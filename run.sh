#! /bin/bash

export DEEPDIVE_HOME=`pwd`"/../deepdive-master"
export PALEO_HOME=`pwd`

export PYPY_GC_MAX=20GB

# Database Configuration
export DBNAME=cleanpaleo
export PGUSER=postgres
#Password is set via the PGPASSWORD environment variable
export DBPASSWORD=bB19871121
export PGPORT=5432
export PGHOST=localhost

cd $DEEPDIVE_HOME
#$PALEO_HOME/prepare_data.sh
env $DEEPDIVE_HOME/sbt/sbt "run -c $PALEO_HOME/application.conf"
