# Plan Infrastruktury Hybrydowej i Automatyzacji (Cloud / DevOps)
* **Segmentacja sieci:** 3 izolowane sieci Docker (`edge_net`, `dmz_net`, `cloud_net`) + reguły `nftables`.
* **Synchronizacja czasu:** Kontener Chrony (NTP) zapewniajacy spojnosc znacznikow czasu w logach Edge i Cloud.
* **Automatyzacja (IaC):** Playbooki Ansible uruchamiane przez SemaphoreUI wdrazajace konfiguracje bramek i agentow Wazuh przez JumpServer (`ProxyJump`).
