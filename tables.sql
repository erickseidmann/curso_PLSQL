CREATE TABLE toys (
    toy_name varchar2(100),
    weight  number
);

SELECT * FROM toys;

SELECT table_name, iot_name, iot_type, external,
        partitioned, temporary, cluster_name
from user_tables;

CREATE TABLE bricks(
    colour VARCHAR2(10),
    shape VARCHAR2(10)
);

SELECT table_name
from user_tables
where table_name = 'BRICKS';

CREATE TABLE toys_heap(
    toy_name VARCHAR2(100)
) organization heap;

DROP TABLE toys_heap;

SELECT table_name, iot_name, iot_type, external,
        partitioned, temporary, cluster_name
from user_tables
where table_name = 'TOYS_HEAP';

CREATE TABLE toys_iot(
    toy_id  integer primary key,
    toy_name VARCHAR2(100)
) organization index;

SELECT table_name, iot_type
from user_tables
where table_name = 'TOYS_IOT';

CREATE TABLE bricks_iot(
    bricks_id integer primary key
) organization index;

SELECT table_name, iot_type
from user_tables
where table_name = 'BRICKS_IOT';

CREATE OR REPLACE  directory toy_dir as '/path/to/file';


CREATE GLOBAL TEMPORARY TABLE toys_gtt(
    toy_name VARCHAR2(100)
);

CREATE PRIVATE TEMPORARY TABLE ora$ptt_toys(
    toy_name varchar2(100)
);



SELECT table_name, temporary
from user_tables
where table_name in ('TOYS_GTT', 'ORA$PTT_TOYS');

CREATE TABLE toys_range(
    toy_name VARCHAR2(100)
) PARTITION BY RANGE (toy_name)(
PARTITION p0 values less than ('b'),
partition p1 values less than ('c')
);

create table toys_list(
    toy_name varchar2(100)
)partition by list (toy_name) (
partition p0 values ('Sir Stripypants'),
partition p1 values ('Miss Snuggles')
);

create table toys_hash(
    toy_name varchar2(100)
) partition by hash (toy_name) partitions 4;

create table toys_part_iot (
    toy_id  integer primary key,
    toy_name varchar2(100)
) organization index
partition  by hash (toy_id) partitions 4;

select table_name, partitioned
from user_tables
where table_name in ('TOYS_HAS', 'TOYS_LIST', 'TOYS_RANGE', 'TOYS_PART_IOT');

select table_name, partition_name
from user_tab_partitions;

create table bricks_hash(
    brick_id integer
)partition by hash (brick_id) partitions 8;

select table_name, partitioned
from user_tables
where table_name = 'BRICKS_HASH';

create cluster toy_cluster (
    toy_name varchar2(100)
);
create table toys_cluster_tab (
    toy_name varchar2(100)
)cluster toy_cluster (toy_name);

create table toy_owners_tab(
    owner varchar2(20),
    toy_name varchar2(100)
) cluster toy_cluster(toy_name);

select cluster_name from user_clusters;

select table_name, cluster_name
from user_tAbles
where table_name in ('TOYS_CLUSTER_TAB', 'TOY_OWNERS_CLUSTER_TAB');

select table_name
from user_tables
where table_name = 'TOYS_HEAP';

DROP TABLE toys_heap;

DROP TABLE toys;

select table_name
from user_tables
where table_name = 'TOYS';