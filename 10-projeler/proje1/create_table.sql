connect sys/1346Oracle?@localhost:1521/ORCLPDB as sysdba

-- ODI icin kullanilacak bir kullanici olustur
CREATE USER odi_user IDENTIFIED BY welcome1 DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP;
GRANT CONNECT, RESOURCE, UNLIMITED TABLESPACE TO odi_user;

-- Hedef tabloyu olustur
connect odi_user/welcome1@localhost:1521/ORCLPDB

CREATE TABLE CALISANLAR (
    CALISAN_ID  NUMBER(10) PRIMARY KEY,
    AD          VARCHAR2(50),
    SOYAD       VARCHAR2(50),
    DEPARTMAN   VARCHAR2(50),
    MAAS        NUMBER(10,2)
);

SELECT table_name FROM user_tables;
exit;
