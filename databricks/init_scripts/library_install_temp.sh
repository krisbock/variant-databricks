#!/usr/bin/env bash

# Pick up user-provided environment variables, specifically HAIL_VERSION
source /databricks/spark/conf/spark-env.sh

/databricks/python/bin/pip install -U hail==0.2.16
hail_jar_path=$(find /databricks/python3 -name 'hail-all-spark.jar')
cp $hail_jar_path /databricks/jars
export hail_jar_path="/databricks/jars/hail-all-spark.jar"

# Note: This configuration takes precedence since configurations are
# applied in reverse-lexicographic order.
cat <<HERE >/databricks/driver/conf/00-hail.conf
[driver] {
  "spark.kryo.registrator" = "is.hail.kryo.HailKryoRegistrator"
  "spark.serializer" = "org.apache.spark.serializer.KryoSerializer"
  "spark.jars" = "/databricks/jars/hail-all-spark.jar"
}
HERE
