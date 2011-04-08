Migrating from MySQL to Postgresql
==================================

### Step 1: Create a proper mysql dump

> `mysqldump --hex-blob --skip-opt  dbname > dbname_mysql.sql`

### Step 2: Convert your dump to postgres style

Use the included script. I've fixed it up with better support for
foreign keys (it puts all the constraint creation at the bottom of the
file) and FKs with multiple column references.

> `./mysql2pgsql.pl dbname_mysql.sql dbname_pg.sql`

### Step 3: Import

Make sure you have created the database first.

> `psql -f dbname_pg.sql`
