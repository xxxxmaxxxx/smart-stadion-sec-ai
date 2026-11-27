# Plan Testow Bezpieczenstwa i Audytu (Etap M5/M6)
1. **Test uwierzytelniania mTLS:** Proba polaczenia klienta bez podpisanego certyfikatu (oczekiwane: odrzucenie TLS handshake).
2. **Test segmentacji i PAM:** Proba bezposredniego SSH do strefy Edge z pominieciem JumpServera (oczekiwane: brak trasy / blokada).
3. **Test NIDS/SIEM:** Skanowanie portow w sieci Edge i weryfikacja alertu w Suricata + Wazuh.
4. **Audyt podatnosci:** Skan kontenerow/hostow narzedziem Greenbone OpenVAS przed odbiorem technicznym.
