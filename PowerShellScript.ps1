New-Item -Path 'C:\Users\karim.niang\Desktop\Clienti\Fastweb\Ran Monitoring  - FastKa\1. Query\SQL' -ItemType 'file' -Name 'my_sql_create_tables.txt' -Value @'
use myfastweb;
CREATE TABLE IF NOT EXISTS ran_monitoring_volumi_daily
(
    time_data DATE,
    nodo VARCHAR(10),
    nodo_tdd_fdd VARCHAR(7),
    cella VARCHAR(8),
    rete CHAR(5),
    band VARCHAR(8),
    rat VARCHAR(2),
    fdd_tdd CHAR(3),
    vendor VARCHAR(8),
    flusso VARCHAR(14),
    mnc VARCHAR(7),
    banda VARCHAR(15),
    regione VARCHAR(30),
    provincia VARCHAR(30),
    comune VARCHAR(32),
    area VARCHAR(10),
    area_type VARCHAR(8),
    ul_dl CHAR(2),
    volume_mb NUMERIC(10,2)
);
'@
