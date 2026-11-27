# Smart Stadium Access & Crowd Shield

**Powiazanie z katalogiem tematow:** Temat nr 01 (Inteligentny monitoring infrastruktury IoT) + elementy Tematu nr 03 (Zero Trust) i nr 05 (Mini-SOC).
**Realizacja:** Zespol 1-osobowy z pelnym podzialem na 4 role projektowe.

## Podzial rol i odpowiedzialnosci
| Rola | Zakres realizacji w projekcie |
| :--- | :--- |
| **Lider / architekt** | Plan prac, backlog, diagramy architektury (DFD), granice zaufania oraz dziennik decyzji (ADR). |
| **Cloud / DevOps** | Konteneryzacja (Docker Compose), automatyzacja (Ansible + SemaphoreUI), synchronizacja czasu (NTP) i odtwarzalnosc. |
| **Security Engineer** | Model zagrozen STRIDE, PKI/mTLS, segmentacja sieci, PAM (JumpServer/Bastion), IAM/MFA (Authentik), Suricata, Wazuh i skan OpenVAS. |
| **AI / Monitoring** | Telemetria bramek stadionowych, detekcja anomalii (Isolation Forest vs prog), metryki jakosci i alerty w SIEM. |

## Struktura repozytorium
* `01-architektura-i-plan/` – Karta projektu, diagramy DFD, dziennik decyzji (ADR)
* `02-infrastruktura-devops/` – Docker Compose, konfiguracja brokera MQTT, NTP i Ansible
* `03-bezpieczenstwo-sec/` – Model zagrozen STRIDE, skrypty certyfikatow mTLS, reguly Suricata/Wazuh
* `04-analityka-ai/` – Silnik wykrywania anomalii w Pythonie (Isolation Forest)
* `05-symulator-stadionu/` – Symulator bramek biletowych oraz generator ruchu atakujacego
* `06-testy-i-audyt/` – Scenariusze testowe (M5), dowody dzialania i raport podatnosci
