# Specyfikacja Modulu AI / Monitoring (Etap M2 -> M4)
* **Kontrakt danych (JSON z bramek):** `gate_id`, `timestamp_utc`, `valid_scans_per_min`, `rejected_scans_per_min`, `crowd_density_pct`, `packet_bytes`.
* **Metoda detekcji:** Algorytm **Isolation Forest** (`scikit-learn`) uczony na profilu normalnego ruchu wejsc stadionowych.
* **Benchmark (Baseline):** Porownanie skutecznosci modelu ML (*Precision / Recall / F1-score*) z klasycznym progiem statycznym (`rejected_scans_per_min > 15`).
