Migrating from MySQL to Postgresql
==================================

### Step 1: Create a proper mysql dump

> `mysqldump --hex-blob dbname > dbname_mysql.sql`

### Step 2: Convert your dump to postgres style

Use the included script. I've fixed it up with better support for
foreign keys (it puts all the constraint creation at the bottom of the
file) and FKs with multiple column references.

> `./mysql2pgsql.pl --sepfile constraints.sql --nodrop dbname_mysql.sql dbname_pg.sql`

### Step 3: Import

Make sure you have created the database first.

> `psql -f dbname_pg.sql`
> `psql -f constraints.sql、

Notes:
------

* If you want to be notified of errors in your dump, do \set ON_ERROR_STOP 1

* Make sure your mysql tables are all utf8 first

* Dumps do not work well with BLOB data. MySQL uses 0x1234, Pg uses
  E'\\x1234'. Don't use BLOBs if you can avoid it in general.

* The test directory contains some simple tests, which are not comprehensive.
  cd test; ./run_test.sh to run the tests. 

* If you have anything to add, please let me know
