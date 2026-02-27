# Paketler ve Senaryolar

## Package (Paket) Nedir?
Birden fazla adimi sirali veya kosullu olarak calistiran is akisi birimidir.

## Scenario Nedir?
Bir mapping veya package'in derlenmis, calistirilabilir halidir.
Production ortaminda scenario'lar calistirilir, kaynak kod degil.

## Load Plan Nedir?
Birden fazla scenario'yu paralel ve sirali olarak organize eden
ust duzey orkestrasyon aracidir.

## Notlarim

### PKG_CALISAN_RAPOR (27 Subat 2026)
- **Adim 1:** MAP_CALISAN_RAPOR mapping'i calistirildi (15 kayit yuklendi)
- **Adim 2:** CALISAN_RAPOR Datastore Check (CKM kontrolu)
- **Baglanti:** ok (success) - mapping basariliysa CKM calisir
- **Ogrenilenler:**
  - Package editoru: Toolbox + Diagram alani
  - Mapping ve Datastore'lar sol panelden diagram alanina surukle-birak ile eklenir
  - Adimlar arasi baglanti: ust arac cubugundaki ok1 (success) veya ko1 (failure) ile yapilir
  - Datastore suruklendiginde Type: Datastore Check olarak CKM kontrolu yapar
  - Package tek bir calistirma ile tum adimlari siraliyla yurutur
