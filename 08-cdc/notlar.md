# CDC - Changed Data Capture (Degisen Veri Yakalama)

## CDC Nedir?
Kaynak tablolardaki degisiklikleri (INSERT, UPDATE, DELETE) tespit ederek
sadece degisen verileri hedefe aktarma yontemidir.

## Neden CDC?
- Her seferinde tum veriyi tasimanin maliyeti yuksektir
- CDC ile sadece degisen satirlar islenir → performans ve verimlilik artar

## ODI'da CDC Yontemleri
1. **Journalizing KM (JKM)** — ODI'nin kendi CDC mekanizmasi
2. **Oracle GoldenGate** — Gercek zamanli CDC icin
3. **Timestamp bazli** — Son degisiklik tarihine gore filtreleme

## Notlarim

> CDC denemelerin hakkinda notlarini buraya yaz...
