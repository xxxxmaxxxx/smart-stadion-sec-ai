# Model Zagrozen STRIDE i Plan Mitygacji (Etap M2)

| Kategoria STRIDE | Zagrozenie na stadionie | Skutek | Wdrozona kontrola bezpieczenstwa |
| :--- | :--- | :--- | :--- |
| **Spoofing** | Podpiecie falszywego czytnika biletow do sieci stadionowej. | Wpuszczenie osob bez biletow lub paraliz wejsc. | **mTLS (certyfikaty X.509)** dla kazdej bramki – broker odrzuca polaczenia bez podpisu naszego CA. |
| **Tampering (nieautoryzowana modyfikacja)** | Modyfikacja pakietow z czujnikow tlumu lub manipulacja logami. | Brak reakcji na scisk w tunelu; zatarcie sladow ataku. | Szyfrowanie **TLS 1.3**, **ACL w Mosquitto** (bramka pisze tylko na swoj temat), centralizacja logow w **Wazuh** + **NTP**. |
| **Repudiation (wyparcie)** | Zmiana konfiguracji bramek przez operatora i wyparcie sie dzialania. | Brak rozliczalnosci podczas incydentu masowego. | Logowanie przez **Authentik (MFA)** oraz tunelowanie SSH przez **JumpServer / Bastion** z audytem komend. |
| **Information Disclosure (ujawnienie informacji)** | Podsluch ruchu w strefie Edge i wyciek danych biletow lub hasel. | Naruszenie prywatnosci i przejecie danych dostepowych. | Wylaczenie nieszyfrowanego portu 1883 (tylko 8883/TLS), brak sekretow w repozytorium Git (`.env` w `.gitignore`). |
| **Denial of Service** | Zalanie brokera zapytaniami (flood) przed rozpoczeciem meczu. | Zablokowanie bramek i kolejki przed stadionem. | Detekcja skanowania/floodu w **Suricata** oraz wykrywanie anomalii natezenia ruchu przez **Isolation Forest**. |
| **Elevation of Privilege ** | Przejecie konta technicznego na bramce i przejscie do Cloud SOC. | Przejecie kontroli nad centrala bezpieczenstwa. | Segmentacja sieci (`edge_net` / `dmz_net` / `cloud_net`), zasada **Least Privilege** i brak bezposredniego routingu Edge-Cloud. |
EOL
