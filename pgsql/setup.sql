
create language "plpythonu";

drop schema if exists prestogres_catalog cascade;

create schema prestogres_catalog;

create or replace function prestogres_catalog.run_presto_as_temp_table(
    "server" text, "user" text, "catalog" text, "schema" text,
    "result_table" text, "query" text)
returns void as $$
import prestogres
prestogres.run_presto_as_temp_table(
    server, user, catalog, schema, result_table, query)
$$ language plpythonu;

create or replace function prestogres_catalog.run_system_catalog_as_temp_table(
    "server" text, "user" text, "catalog" text, "schema" text,
    "login_user" text, "login_database" text,
    "result_table" text, "query" text)
returns void as $$
import prestogres
prestogres.run_system_catalog_as_temp_table(
    server, user, catalog, schema, login_user, login_database,
    result_table, query)
$$ language plpythonu;

create or replace function prestogres_catalog.create_schema_holders("count" int)
returns void as $$
import prestogres
prestogres.create_schema_holders(count);
$$ language plpythonu;

create or replace function prestogres_catalog.create_table_holders("count" int)
returns void as $$
import prestogres
prestogres.create_table_holders(count);
$$ language plpythonu;

select prestogres_catalog.create_schema_holders(512);

select prestogres_catalog.create_table_holders(2048);
