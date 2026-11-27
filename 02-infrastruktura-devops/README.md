# Infrastruktura sieciowa i broker MQTT

## Struktura sieci
- edge_net (172.28.10.0/24) - strefa brzegowa (bramki wejsciowe)
- dmz_net (172.28.20.0/24) - strefa zdemilitaryzowana (broker MQTT, NTP, inspekcja ruchu)
- cloud_net (172.28.30.0/24, internal: true) - izolowana strefa centralna (SOC, SIEM, AI)

## Uruchomienie srodowiska
1. Wygenerowanie certyfikatow mTLS:
   ./03-bezpieczenstwo-sec/generuj-certyfikaty.sh

2. Uruchomienie kontenerow brokera Mosquitto oraz serwera NTP:
   docker compose -f 02-infrastruktura-devops/docker-compose.yml up -d

3. Sprawdzenie logow brokera:
   docker logs stadion-mqtt-broker
