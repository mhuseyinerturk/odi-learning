# Topoloji (Topology)

## Topoloji Nedir?
ODI'da topoloji, veri kaynaklarina ve hedeflerine erisim icin gerekli fiziksel ve
mantiksal baglanti bilgilerini tanimladigin yerdir.

## Katmanli Yapi

```
Mantiksal (Logical)          Fiziksel (Physical)
┌──────────────────┐         ┌──────────────────────┐
│ Logical Schema   │ ──────> │ Physical Schema      │
│ (ornek: HR)      │         │ (ornek: HR@PROD_DB)  │
└──────────────────┘         └──────────────────────┘
                              │
                              ▼
                             ┌──────────────────────┐
                             │ Data Server           │
                             │ (ornek: PROD_DB)      │
                             │ JDBC URL, user, pass  │
                             └──────────────────────┘
```

## Neden Mantiksal-Fiziksel Ayrimi?
- **Mapping'lerde mantiksal sema kullanilir** → Ortam bagimsiz tasarim
- **Calistirma sirasinda fiziksel sema kullanilir** → Context ile ortam secilir
- Ayni mapping, DEV/TEST/PROD ortamlarinda degisiklik yapmadan calisabilir

## Context (Baglam)
- Mantiksal semalari fiziksel semalara eslestiren yapidir
- Ornek: "Development" context'i HR → HR@DEV_DB'ye esler
- Ornek: "Production" context'i HR → HR@PROD_DB'ye esler

## Notlarim

> Topoloji tanimlarken ogrendiklerini buraya yaz...
