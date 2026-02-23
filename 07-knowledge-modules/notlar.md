# Knowledge Modules (KM)

## KM Nedir?
Knowledge Module'ler, ODI'nin veriyi nasil tasiyacagini, donusturecegini ve
kontrol edecegini belirleyen yeniden kullanilabilir sablonlardir.

## KM Turleri

| KM Tipi | Kisaltma | Gorev |
|---------|----------|-------|
| Loading | LKM | Veriyi kaynaktan staging area'ya tasir |
| Integration | IKM | Veriyi staging'den hedefe yukler |
| Check | CKM | Veri kalite kontrolu yapar |
| Reverse | RKM | Metadata kesfi (reverse engineering) |
| Journalizing | JKM | Degisen veri yakalama (CDC) |

## Ornek KM'ler
- **LKM SQL to SQL** — SQL kaynaktan SQL hedefe veri tasima
- **LKM File to SQL** — Dosyadan veritabanina tasima
- **IKM Oracle Insert** — Basit INSERT islemi
- **IKM Oracle Incremental Update** — MERGE (upsert) islemi

## Notlarim

> KM denemelerin hakkinda notlarini buraya yaz...
