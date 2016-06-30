#! /bin/bash

export APP_HOME=`cd $(dirname $0)/; pwd`
export DEEPDIVE_HOME=/Users/czhang/Desktop/deepdive

# Database Configuration
export DBNAME=postgres

export PGUSER=postgres
export PGPASSWORD=bB19871121
export PGPORT=${PGPORT:-5434}
export PGHOST=${PGHOST:-localhost}

export DEEPDIVE_JDBC_DRIVER="org.postgresql.Driver"
export DBPORT=5434
export DBHOST=localhost
export DBUSER=postgres
export DEEPDIVE_JDBC_URL="localhost:5434"

# Initialize database
#bash $APP_HOME/../prepare_data.sh
#bash $APP_HOME/../setup_database.sh $DBNAME

# Using ddlib
export PYTHONPATH=$DEEPDIVE_HOME/ddlib:$PYTHONPATH

cd $DEEPDIVE_HOME

SBT_OPTS="-Xmx4g" sbt "run -c $APP_HOME/application.conf"
#deepdive -c $APP_HOME/application.conf
