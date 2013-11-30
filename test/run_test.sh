#!/bin/sh

export PATH=/usr/local/perl-5.18/bin:$PATH

perl ../mysql2pgsql.pl test.mysql.dump test.pgsql.out.1 >test.pgsql.log.1 2>&1
echo "Checking translation after default options"
if diff test.pgsql.out.1 test.pgsql.ref.1
then
    echo OK
else
    echo FAIL: differences found.
fi


perl ../mysql2pgsql.pl -splitinserts -nodoubleslash test.mysql.dump test.pgsql.out.2 >test.pgsql.log.2 2>&1
echo "Checking translation after splitting inserts and no double slash options"
if diff test.pgsql.out.2 test.pgsql.ref.2
then
    echo OK
else
    echo FAIL: differences found.
fi

