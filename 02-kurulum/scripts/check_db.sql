-- Veritabani durumunu kontrol et
-- Kullanim: sqlplus /nolog @check_db.sql
connect / as sysdba
SELECT instance_name, status FROM v$instance;
SELECT name FROM v$database;
SELECT name, open_mode FROM v$pdbs;
exit;
