# Backlog Projektu (Podzial na 4 role i kamienie milowe WSTI)

## Sprint 1 (28.11 – 11.12 | Cel: Odbior M3 – Dzialajace srodowisko i przeplyw E2E)
* `[Role: Security]` **#1 PKI i certyfikaty mTLS:** Skrypt generujacy lokalne CA oraz certyfikaty klienckie X.509 dla 5 bramek stadionowych.
* `[Role: DevOps]` **#2 Segmentacja sieci i Broker:** Konfiguracja `docker-compose.yml` (sieci `edge_net`, `dmz_net`, `cloud_net`), kontenera NTP oraz brokera Mosquitto z wymuszonym TLS 1.3 i ACL.
* `[Role: DevOps/AI]` **#3 Symulator Edge:** Skrypt w Pythonie (`gate_simulator.py`) generujacy telemetrie ruchu z 5 bramek stadionowych.

## Sprint 2 (04.12 – 12.12 | Cel: Odbior M4 – Monitoring, SOC i AI/ML)
* `[Role: Security]` **#4 NIDS i SIEM:** Wdrozenie sondy sieciowej Suricata oraz centralnego SIEM Wazuh zbierajacego logi z brokera i alerty sieciowe.
* `[Role: Security]` **#5 IAM i PAM:** Konfiguracja Authentik (SSO + MFA dla operatorow) oraz JumpServer / SSH Bastion z audytem sesji.
* `[Role: AI/Monitoring]` **#6 Silnik detekcji anomalii:** Trening modelu Isolation Forest (scikit-learn) na danych normalnych + wstrzykniecie anomalii + porownanie metryk z prostym progiem.

## Sprint 3 (13.12 – 16.01 | Cel: Odbior M5/M6 – Testy odpornosci, IaC i Audyt)
* `[Role: DevOps]` **#7 Automatyzacja IaC:** Playbooki Ansible uruchamiane przez SemaphoreUI do wdrazania konfiguracji przez JumpServer.
* `[Role: Security]` **#8 Scenariusze atakow (M5):** Przeprowadzenie testow negatywnych (nieautoryzowany klient, skanowanie sieci, flood) i zebranie dowodow alertow w Wazuh.
* `[Role: Security]` **#9 Audyt podatnosci (M6):** Jednorazowy skan infrastruktury skanerem Greenbone OpenVAS i udokumentowanie poprawek.
