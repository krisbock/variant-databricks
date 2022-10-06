#!/usr/bin/env bash

# Pick up user-provided environment variables, specifically HAIL_VERSION
source /databricks/spark/conf/spark-env.sh

/databricks/python3/bin/pip install -U hail==0.2.74
hail_jar_path=$(find /databricks/python3 -name 'hail-all-spark.jar')
mkdir -p /databricks/jars
cp $hail_jar_path /databricks/jars
#export hail_jar_path="/databricks/jars/hail-all-spark.jar"

# Note: This configuration takes precedence since configurations are
# applied in reverse-lexicographic order.
cat <<HERE >/databricks/driver/conf/00-hail.conf
[driver] {
  "spark.kryo.registrator" = "is.hail.kryo.HailKryoRegistrator"
  "spark.serializer" = "org.apache.spark.serializer.KryoSerializer"
}
HERE

/databricks/python3/bin/pip install selenium==3.141.0
