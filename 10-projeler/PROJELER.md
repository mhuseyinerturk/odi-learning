# Pratik Projeler

## Proje 1: CSV'den Veritabanina Veri Yukleme
**Zorluk:** Baslangic
**Aciklama:** Bir CSV dosyasindan Oracle tabloya veri yukle
**Ogrenilecekler:** LKM File to SQL, basit mapping, topoloji tanimlama

## Proje 2: Coklu Tablo Birlestirme
**Zorluk:** Orta
**Aciklama:** Employees + Departments tablolarini birlestirip ozet tablo olustur
**Ogrenilecekler:** Join, Expression, Aggregate komponentleri

## Proje 3: Incremental Yukleme
**Zorluk:** Orta-Ileri
**Aciklama:** Sadece degisen verileri yukle (IKM Incremental Update)
**Ogrenilecekler:** MERGE mantigi, CDC temelleri

## Proje 4: Star Schema Veri Ambari
**Zorluk:** Ileri
**Aciklama:** Fact ve Dimension tablolarini besleyen ETL sureci olustur
**Ogrenilecekler:** Load Plan, Package, tam bir ETL pipeline

## Proje Notlarim

### Proje 1 - TAMAMLANDI (23 Subat 2026)
- CSV'den Oracle'a 10 calisan kaydi yuklendi
- KM: LKM File to SQL + IKM SQL Control Append
- Dosya: 10-projeler/proje1/

### Proje 2 - TAMAMLANDI (27 Subat 2026)
- 2 kaynak tablo (CALISANLAR2 + DEPARTMANLAR) JOIN ile birlestirildi
- FILTER ile maas > 5000 filtresi uygulandi
- Expression ile AD_SOYAD birlestirme ve MAAS_SEVIYE hesaplama yapildi
- 20 kaynaktan 15 kayit hedef tabloya yuklendi
- KM: IKM SQL Control Append (ayni DB, LKM gerek yok)
- Dosya: 10-projeler/proje2/
