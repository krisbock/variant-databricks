# #!/usr/bin/env bash
# /databricks/python/bin/pip install Sphinx==3.3.1
# /databricks/python/bin/pip install sphinx-rtd-theme==0.5.0
# /databricks/python/bin/pip install nbsphinx==0.8.0
# /databricks/python/bin/pip install pylint==2.6.0
# /databricks/python/bin/pip install pytest==6.2.2
# /databricks/python/bin/pip install twine==3.2.0
# # varspark dependencies
# /databricks/python/bin/pip install pandas==1.1.4
# /databricks/python/bin/pip install typedecorator==0.0.5
# /databricks/python/bin/pip install Jinja2==3.0.3
# /databricks/python/bin/pip install hail==0.2.74
# /databricks/python/bin/pip install variant-spark

apt-get update
apt-get install \
    openjdk-8-jdk-headless \
    g++ \
    python3 python3-pip \
    libopenblas-dev liblapack-dev \
    liblz4-dev

git clone https://github.com/hail-is/hail.git
cd hail/hail
make install-on-cluster HAIL_COMPILE_NATIVES=1 SCALA_VERSION=2.12 SPARK_VERSION=3.1.2