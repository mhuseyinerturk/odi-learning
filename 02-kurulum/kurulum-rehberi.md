# ODI Kurulum Rehberi

## On Gereksinimler

### Yazilim
- **JDK 8** (Oracle JDK veya OpenJDK) — ODI 12c icin zorunlu
- **Oracle Database** (11g veya 12c+) — Repository icin
  - Alternatif: Oracle XE (ucretsiz, ogrenme icin yeterli)
- **Oracle WebLogic Server** (opsiyonel, Agent icin)

### Sistem Gereksinimleri
- RAM: Minimum 4 GB (8 GB onerilen)
- Disk: Minimum 10 GB bos alan
- Isletim Sistemi: Windows 10/11, Linux (OEL, RHEL, Ubuntu)

## Kurulum Adimlari

### 1. JDK Kurulumu
```bash
# JDK 8 indir ve kur
# JAVA_HOME ortam degiskenini ayarla
# Ornek: JAVA_HOME=C:\Program Files\Java\jdk1.8.0_xxx
```

### 2. Oracle Database Kurulumu (Repository icin)
- Oracle XE indirilebilir: https://www.oracle.com/database/technologies/xe-downloads.html
- Kurulumdan sonra bir kullanici olustur:
```sql
-- Master Repository icin
CREATE USER ODI_REPO_MASTER IDENTIFIED BY password;
GRANT CONNECT, RESOURCE, DBA TO ODI_REPO_MASTER;

-- Work Repository icin
CREATE USER ODI_REPO_WORK IDENTIFIED BY password;
GRANT CONNECT, RESOURCE, DBA TO ODI_REPO_WORK;
```

### 3. ODI 12c Kurulumu
1. Kurulum dosyasini (V983389-01.zip) ac
2. `setup.exe` veya `runInstaller` calistir
3. Kurulum tipini sec: "Enterprise Installation" veya "Standalone Installation"
4. Oracle Home dizinini belirle
5. Kurulumu tamamla

### 4. Repository Olusturma (RCU - Repository Creation Utility)
```bash
# RCU'yu calistir (ODI Home altinda)
# Windows: <ODI_HOME>/oracle_common/bin/rcu.bat
# Linux:   <ODI_HOME>/oracle_common/bin/rcu.sh
```
- "Create Repository" sec
- Database baglanti bilgilerini gir
- ODI sema onekini belirle (ornek: DEV)
- Master ve Work Repository icin semalari olustur

### 5. ODI Studio'yu Baslat
```bash
# Windows: <ODI_HOME>/odi/studio/odi.exe
# Linux:   <ODI_HOME>/odi/studio/odi.sh
```

### 6. Repository Baglantisi Olustur
- ODI Studio'da "Connect to Repository" tikla
- Login Name: Istedigin bir isim
- User: SUPERVISOR (varsayilan)
- Password: Kurulumda belirledigin sifre
- JDBC URL: jdbc:oracle:thin:@localhost:1521/XEPDB1
- Master/Work Repository bilgilerini gir

## Kurulum Sonrasi Kontrol Listesi
- [x] JDK 8 kuruldu ve JAVA_HOME ayarlandi (C:\Java\jdk1.8.0_202)
- [x] Oracle Database 19c kuruldu ve calisiyor (ORCL / ORCLPDB)
- [x] ODI 12c (12.2.1.4) kurulumu tamamlandi (C:\Oracle\Middleware\Oracle_Home)
- [x] RCU ile repository semalari olusturuldu (prefix: DEV)
- [x] ODI Studio aciliyor ve repository'e baglanabiliyor (SUPERVISOR / WORKREP)

## Gercek Kurulum Bilgileri

| Bilesen | Deger |
|---------|-------|
| JAVA_HOME | C:\Java\jdk1.8.0_202 |
| ORACLE_HOME (DB) | C:\Oracle19c |
| ORACLE_HOME (ODI) | C:\Oracle\Middleware\Oracle_Home |
| Database | Oracle 19c Enterprise Edition |
| PDB | ORCLPDB |
| ODI Version | 12.2.1.4.0 |
| Repository Prefix | DEV |
| Work Repository | WORKREP (Development) |

## Olasi Sorunlar ve Cozumleri

| Sorun | Cozum |
|-------|-------|
| ODI Studio acilmiyor | JAVA_HOME'un JDK 8'i gosterdiginden emin ol |
| Repository baglanti hatasi | DB'nin calistigini ve kullanici/sifrenin dogru oldugunu kontrol et |
| Bellek hatasi | ODI Studio'nun JVM parametrelerini artir (odi.conf dosyasi) |
| RCU "Unknown Encryption Algorithm" | sqlnet.ora'ya uyumlu encryption tipleri ekle (AES128, RC4_128) |
| RCU rcu.bat "syntax error" | rcu.bat yerine dogrudan rcu_internal.bat kullan |
| PDB acik degil hatasi | ALTER PLUGGABLE DATABASE ORCLPDB OPEN; ve SAVE STATE; calistir |
| CSV verisi yuklenmiyor (0 satir) | Record Separator'un dosya formatiyla eslestiginden emin ol (LF vs CRLF) |

## Notlarim

- RCU silent modda calistirildi: -variables ODI_SUPERVISOR_PASSWORD, ODI_WORK_REP_NAME, ODI_WORK_REP_TYPE parametreleri gerekli
- PDB her DB restart'ta kapanabilir, SAVE STATE ile kalici acik tutulur
- rcu.bat'taki WLS_ORACLE_HOME bos olunca syntax error verir, rcu_internal.bat tercih et
