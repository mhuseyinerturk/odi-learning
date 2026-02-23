-- PDB'yi ac ve kalici olarak acik tut
-- Kullanim: sqlplus /nolog @open_pdb.sql
connect / as sysdba
ALTER PLUGGABLE DATABASE ORCLPDB OPEN;
ALTER PLUGGABLE DATABASE ORCLPDB SAVE STATE;
SELECT name, open_mode FROM v$pdbs;
exit;
