# Mapping Ornekleri

## Mapping Nedir?
Mapping, kaynak verinin hedefe nasil donusturulerek aktarilacagini tanimlayan ODI bilesenidir.
ODI 12c'de gorsel bir editor ile tasarlanir.

## Mapping Bileşenleri

```
┌─────────┐    ┌──────────┐    ┌──────────┐    ┌─────────┐
│  Kaynak  │───>│  Filter  │───>│  Join/   │───>│  Hedef  │
│(Source)  │    │          │    │ Lookup   │    │(Target) │
└─────────┘    └──────────┘    └──────────┘    └─────────┘
                                    │
                               ┌────┴─────┐
                               │Aggregate │
                               │Expression│
                               └──────────┘
```

## Temel Komponentler

| Komponent | Aciklama | SQL Karsiligi |
|-----------|----------|---------------|
| **Source (Kaynak)** | Verinin alindigi tablo/dosya | FROM |
| **Target (Hedef)** | Verinin yazildigi tablo/dosya | INSERT INTO |
| **Filter** | Satirlari filtrele | WHERE |
| **Join** | Tablolari birlestir | JOIN ... ON |
| **Lookup** | Referans tablodan deger al | LEFT JOIN |
| **Aggregate** | Gruplama ve toplama | GROUP BY, SUM(), COUNT() |
| **Expression** | Donusum ifadesi | SELECT ifadesi |
| **Set** | Birden fazla veri akisini birlestir | UNION, INTERSECT |
| **Distinct** | Tekrarlari kaldir | DISTINCT |
| **Sort** | Siralama | ORDER BY |

## Ornek 1: Basit Kaynak → Hedef

**Senaryo:** EMPLOYEES tablosundan EMP_SUMMARY tablosuna veri aktar

```
Kaynak: HR.EMPLOYEES
  - EMPLOYEE_ID
  - FIRST_NAME
  - LAST_NAME
  - SALARY
  - DEPARTMENT_ID

Hedef: DW.EMP_SUMMARY
  - EMP_ID        ← EMPLOYEE_ID
  - FULL_NAME     ← FIRST_NAME || ' ' || LAST_NAME
  - SALARY        ← SALARY
  - DEPT_ID       ← DEPARTMENT_ID
```

**Expression ornegi:**
```sql
FULL_NAME = SRC_EMPLOYEES.FIRST_NAME || ' ' || SRC_EMPLOYEES.LAST_NAME
```

## Ornek 2: Join ile Coklu Kaynak

**Senaryo:** EMPLOYEES ve DEPARTMENTS tablolarini birlestir

```
Kaynak 1: HR.EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, DEPARTMENT_ID)
Kaynak 2: HR.DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME)

Join Kosulu: EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID

Hedef: DW.EMP_DEPT_REPORT
  - EMP_NAME       ← FIRST_NAME
  - DEPT_NAME      ← DEPARTMENT_NAME
```

## Ornek 3: Aggregate ile Ozet Rapor

**Senaryo:** Departman bazinda maas ozeti

```
Kaynak: HR.EMPLOYEES

Aggregate:
  - GROUP BY: DEPARTMENT_ID
  - SUM(SALARY) as TOTAL_SALARY
  - COUNT(*) as EMP_COUNT
  - AVG(SALARY) as AVG_SALARY

Hedef: DW.DEPT_SALARY_SUMMARY
```

## Knowledge Module Secimi

Mapping calistirirken secilecek KM, verinin nasil tasinacagini belirler:

- **IKM Oracle Insert** → Basit INSERT
- **IKM Oracle Incremental Update** → Varsa guncelle, yoksa ekle (MERGE)
- **IKM Oracle Multi Insert** → Bir kaynaktan birden fazla hedefe

## Notlarim

### Proje 1: MAP_CSV_TO_ORACLE (23 Subat 2026)
- **Kaynak:** CSV dosyasi (calisanlar.csv) - 10 kayit
- **Hedef:** CALISANLAR tablosu (Oracle)
- **KM:** LKM File to SQL + IKM SQL Control Append
- **Sonuc:** 10 satir basariyla yuklendi
- **Ogrenilenler:**
  - CSV dosyasi CRLF formatinda olmali (LF ile 0 satir yuklendi)
  - EKM degil, IKM+LKM secilmeli
  - File Topology ayarlarinda Record Separator = "\r\n" olmali

### Proje 2: MAP_CALISAN_RAPOR (27 Subat 2026)
- **Kaynak:** CALISANLAR2 (20 kayit) + DEPARTMANLAR (5 kayit)
- **Hedef:** CALISAN_RAPOR tablosu (Oracle)
- **Komponentler:** JOIN, FILTER, Expression
- **KM:** IKM SQL Control Append (LKM gerek yok - ayni DB)
- **JOIN:** CALISANLAR2.DEPARTMAN_ID = DEPARTMANLAR.DEPARTMAN_ID
- **FILTER:** CALISANLAR2.MAAS > 5000
- **Expression'lar:**
  - AD_SOYAD = CALISANLAR2.AD || ' ' || CALISANLAR2.SOYAD
  - MAAS_SEVIYE = CASE WHEN MAAS >= 10000 THEN 'Yuksek' WHEN MAAS >= 6000 THEN 'Orta' ELSE 'Dusuk' END
- **Sonuc:** 15 satir yuklendi (5 kisi maas filtresinde elendi)
- **Ogrenilenler:**
  - Kaynak ve hedef ayni DB'deyse LKM gerekmez, sadece IKM yeterli
  - JOIN komutu Component Palette'den eklenir (ODI 12c)
  - Expression ile kaynak veride olmayan yeni sutunlar olusturulabilir
  - Warning (sari ucgen) veri yuklemesini etkilemez, sadece bilgilendirme
