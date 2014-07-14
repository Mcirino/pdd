#! /bin/bash

export DEEPDIVE_HOME=`pwd`"/../deepdive-master"
export PALEO_HOME=`pwd`

export PYPY_GC_MAX=20GB

# Database Configuration
export DB_NAME=cleanpaleo
export DB_USER=postgres
#Password is set via the PGPASSWORD environment variable
export DB_PASSWORD=bB19871121
export DB_PORT=5432

cd $DEEPDIVE_HOME
#$PALEO_HOME/prepare_data.sh
env $DEEPDIVE_HOME/sbt/sbt "run -c $PALEO_HOME/application.conf"
