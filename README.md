# Oracle Data Integrator (ODI) - Ogrenme Rehberi

Bu repo, Oracle Data Integrator'i adim adim ogrenmek icin olusturulmustur.

## Klasor Yapisi

```
odi-learning/
├── 01-temeller/          # ODI nedir, temel kavramlar, mimari
├── 02-kurulum/           # ODI Studio, Repository, Agent kurulumu
├── 03-topoloji/          # Fiziksel/Mantiksal topoloji tanimlari
├── 04-modelleme/         # Veri modelleri, Reverse Engineering
├── 05-mapping/           # Mapping tasarimi, donusum kurallari
├── 06-paketler-ve-senaryolar/ # Package, Scenario, Load Plan
├── 07-knowledge-modules/ # IKM, LKM, CKM, RKM, JKM
├── 08-cdc/               # Changed Data Capture (Degisen Veri Yakalama)
├── 09-big-data/          # Hadoop, Hive, Spark entegrasyonu
└── 10-projeler/          # Pratik projeler ve uygulamalar
```

## Ogrenme Yol Haritasi

### Seviye 1 - Temel (Hafta 1-2)
- [x] ODI mimarisini anla (Master/Work Repository, Agent, Studio)
- [x] ODI Studio kurulumu yap
- [x] Repository olustur ve baglan
- [x] ODI Studio arayuzunu tanı (Designer, Operator, Topology, Security)

### Seviye 2 - Topoloji ve Modelleme (Hafta 3-4)
- [x] Fiziksel ve mantiksal topoloji tanimla
- [x] Veri sunucusu (Data Server) ekle
- [x] Fiziksel ve mantiksal semalar olustur
- [x] Reverse Engineering ile model olustur
- [x] Veri deposu (Datastore) kavramini ogren

### Seviye 3 - Mapping ve Donusum (Hafta 5-7)
- [x] Basit bir kaynak-hedef mapping olustur
- [x] Filter, Join, Lookup, Aggregate komponentlerini ogren
- [x] Expression Editor ile donusum kurallari yaz
- [x] Farkli Knowledge Module'leri dene (IKM, LKM)
- [x] Hata yonetimi ve veri kalite kontrolu (CKM)

### Seviye 4 - Is Akislari (Hafta 8-9)
- [x] Package olustur (coklu adim is akisi)
- [ ] Degisken (Variable) ve kosullu dallanma kullan
- [ ] Scenario derle ve calistir
- [ ] Load Plan ile karmasik is akislari yonet
- [ ] Zamanlama (Scheduling) ayarla

### Seviye 5 - Ileri Konular (Hafta 10-12)
- [ ] CDC (Changed Data Capture) uygula
- [ ] Web servisleri entegrasyonu
- [ ] Groovy scripting ile otomasyon
- [ ] Performans optimizasyonu
- [ ] Hata ayiklama ve monitoring (Operator Navigator)

## Pratik Proje Fikirleri

1. **CSV'den Veritabanina:** CSV dosyalarindan Oracle DB'ye veri yukle
2. **Veri Ambari Beslemesi:** Birden fazla kaynaktan bir Star Schema doldur
3. **Veri Temizligi:** Kirli veriyi temizle ve kalite kontrolu uygula
4. **CDC Projesi:** Kaynak tablodaki degisiklikleri otomatik yakala
5. **Coklu Kaynak Birlestirme:** Farkli veritabanlarindan veri birlestir

## Faydali Kaynaklar

- [Oracle ODI Dokumantasyonu](https://docs.oracle.com/en/middleware/fusion-middleware/data-integrator/)
- [Oracle Learning Library - ODI](https://www.oracle.com/middleware/technologies/data-integrator.html)
- [ODI Tutorial - Oracle Base](https://oracle-base.com/articles/misc/oracle-data-integrator-odi-articles)
