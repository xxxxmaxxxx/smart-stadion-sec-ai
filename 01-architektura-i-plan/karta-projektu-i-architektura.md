# Karta Projektu i Architektura Systemu (Etap M1 + M2)

## 1. Opis problemu biznesowego i zakres MVP
Podczas imprez masowych (mecze, koncerty, zawody lekkoatletyczne) bramki biletowe oraz czujniki zageszczenia tlumu pracuja na brzegu sieci (Edge), gdzie latwo o fizyczne podpiecie nieautoryzowanego sprzetu lub przeciazenie infrastruktury przed otwarciem bram.

**Zakres MVP:**
1. **Strefa Edge (Stadion):** Symulacja 5 bramek biletowych (Python) wysylajacych telemetrie i logi ruchu.
2. **Bezpieczny transport i PAM:** Broker MQTT (Mosquitto) z wymuszonym TLS 1.3 + mTLS, izolacja sieciowa, dostęp administracyjny wylacznie przez JumpServer/Bastion oraz synchronizacja czasu NTP.
3. **Monitoring sieci i SOC:** Sonda NIDS (Suricata) oraz centralny SIEM (Wazuh) z logowaniem operatorow przez Authentik (SSO + MFA).
4. **Analityka AI/ML:** Model Isolation Forest wykrywajacy anomalie ruchu na bramkach porownany z prostym progiem.

## 2. Diagram Architektury i Przeplywu Danych (DFD z granicami zaufania)

```mermaid
flowchart LR
    subgraph EDGE["STREFA 1: EDGE – STADION (Niskie zaufanie)"]
        GATES["Bramki Biletowe x5<br/>(Python Simulator)"]
        ROGUE["Intruz / Nieautoryzowany klient<br/>(Scapy / Test ataku)"]
    end

    subgraph DMZ["STREFA 2: DMZ / BRZEG (Kontrola i inspekcja)"]
        SURICATA["Suricata NIDS<br/>(Inspekcja pakietow)"]
        BASTION["JumpServer / SSH Bastion<br/>(Audyt sesji PAM)"]
        BROKER["Broker MQTT Mosquitto<br/>(Wymuszone mTLS + ACL)"]
    end

    subgraph CLOUD["STREFA 3: CLOUD SOC (Wysokie zaufanie)"]
        AUTH["Authentik IAM<br/>(SSO OIDC + MFA)"]
        WAZUH["Wazuh SIEM<br/>(Korelacja logow i alertow)"]
        AI["Silnik AI Python<br/>(Isolation Forest vs Prog)"]
        ANSIBLE["Ansible + SemaphoreUI<br/>(Automatyzacja IaC)"]
    end

    GATES -- "1. Telemetria MQTT (mTLS)" --> BROKER
    ROGUE -. "2. Brak certyfikatu [BLOKADA]" .-> BROKER
    GATES -. "Ruch sieciowy" .-> SURICATA
    ROGUE -. "Skanowanie / Flood" .-> SURICATA
    BROKER -- "3. Logi brokera" --> WAZUH
    SURICATA -- "4. Alerty sieciowe" --> WAZUH
    BASTION -- "5. Logi sesji SSH" --> WAZUH
    WAZUH -- "6. Dane telemetryczne" --> AI
    AI -- "7. Alert anomalii ML" --> WAZUH
    AUTH -- "8. Dostep SSO+MFA" --> WAZUH
    AUTH -- "8. Dostep SSO+MFA" --> BASTION
    ANSIBLE -- "9. Konfiguracja IaC" --> BASTION
    BASTION -- "10. SSH ProxyJump" --> GATES
