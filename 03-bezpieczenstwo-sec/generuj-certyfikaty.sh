#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/certyfikaty"
mkdir -p "$DIR"
cd "$DIR"

# glowne CA
openssl genrsa -out ca.key 4096
openssl req -x509 -new -nodes -key ca.key -sha256 -days 3650 \
  -subj "/C=PL/O=SmartStadium/CN=Stadium-Root-CA" \
  -out ca.crt

# certyfikat dla brokera mqtt
openssl genrsa -out broker.key 2048
openssl req -new -key broker.key \
  -subj "/C=PL/O=SmartStadium/CN=mqtt-broker" \
  -out broker.csr

cat << 'EXT' > broker.ext
subjectAltName = DNS:mqtt-broker,DNS:localhost,IP:127.0.0.1
extendedKeyUsage = serverAuth
EXT

openssl x509 -req -in broker.csr -CA ca.crt -CAkey ca.key -CAcreateserial \
  -out broker.crt -days 825 -sha256 -extfile broker.ext

# certyfikaty dla 5 bramek
for i in 1 2 3 4 5; do
  NAME="gate-0$i"
  openssl genrsa -out "${NAME}.key" 2048
  openssl req -new -key "${NAME}.key" \
    -subj "/C=PL/O=SmartStadium/CN=${NAME}" \
    -out "${NAME}.csr"
  openssl x509 -req -in "${NAME}.csr" -CA ca.crt -CAkey ca.key -CAcreateserial \
    -out "${NAME}.crt" -days 365 -sha256
  rm -f "${NAME}.csr"
done

rm -f broker.csr broker.ext ca.srl
chmod 600 *.key
chmod 644 *.crt

echo "Wygenerowano klucze i certyfikaty w $DIR"
