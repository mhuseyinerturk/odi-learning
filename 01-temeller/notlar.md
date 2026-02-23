# ODI Temelleri

## ODI Nedir?
Oracle Data Integrator (ODI), farkli veri kaynaklarini entegre etmek icin kullanilan
kurumsal bir ETL/ELT aracidir.

## ETL vs ELT
- **ETL (Extract-Transform-Load):** Veri cikartilir → ayri bir sunucuda donusturulur → hedefe yuklenir
- **ELT (Extract-Load-Transform):** Veri cikartilir → hedefe yuklenir → hedef DB uzerinde donusturulur
- ODI, ELT yaklasimini benimser. Bu sayede hedef veritabaninin islem gucunden yararlanir.

## Temel Mimari

```
┌─────────────────────────────────────────────────────┐
│                    ODI Studio                        │
│  ┌──────────┐ ┌──────────┐ ┌────────┐ ┌──────────┐ │
│  │ Designer │ │ Operator │ │Topology│ │ Security │ │
│  └──────────┘ └──────────┘ └────────┘ └──────────┘ │
└──────────────────────┬──────────────────────────────┘
                       │
        ┌──────────────┼──────────────┐
        ▼              ▼              ▼
┌──────────────┐ ┌───────────┐ ┌───────────┐
│   Master     │ │   Work    │ │   ODI     │
│  Repository  │ │Repository │ │  Agent    │
│  (Topoloji,  │ │ (Projeler,│ │(Calistirma│
│   Guvenlik)  │ │  Modeller)│ │  Motoru)  │
└──────────────┘ └───────────┘ └───────────┘
```

## ODI Studio Navigator'lari

| Navigator | Amac |
|-----------|------|
| **Designer** | Mapping, model ve proje gelistirme |
| **Operator** | Calistirma izleme, hata ayiklama, loglar |
| **Topology** | Veri sunuculari, sema tanimlari, agent yonetimi |
| **Security** | Kullanici, rol ve yetki yonetimi |

## Temel Kavramlar

- **Project:** Tum gelistirme calismalarinin organize edildigi ust yapi
- **Folder:** Proje icindeki mantiksal gruplama
- **Mapping:** Kaynak-hedef arasi veri donusum kurallari
- **Package:** Birden fazla adimi iceren is akisi
- **Scenario:** Derlenmis, calistirilabilir birim
- **Load Plan:** Karmasik yukleme surecleri icin orkestrasyon
- **Model:** Veri yapilarinin (tablo, dosya) ODI icindeki temsili
- **Datastore:** Tek bir tablonun/dosyanin ODI icindeki temsili
- **Knowledge Module:** Veri entegrasyonu stratejilerini belirleyen sablonlar

## Notlarim

- ODI Studio'da 4 Navigator var: Designer (gelistirme), Operator (izleme), Topology (baglantilar), Security (kullanicilar)
- Mapping calistirirken Context: Global, Agent: Local (No Agent) secilir
- Operator Navigator'daki Steps gorunumu hata ayiklamanin en onemli araci
- Knowledge Module'ler projeye import edilmeden kullanilamaz
- CSV dosyalarinin Record Separator ayari (LF/CRLF) cok onemli — dosya formatiyla eslesmelidir
