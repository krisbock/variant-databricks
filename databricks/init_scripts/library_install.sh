# #!/usr/bin/env bash
sudo apt-get update
sudo apt-get install \
    openjdk-8-jdk-headless \
    g++ \
    python3 python3-pip \
    libopenblas-dev liblapack-dev \
    liblz4-dev

git clone https://github.com/hail-is/hail.git
cd hail/hail
sudo make install-on-cluster HAIL_COMPILE_NATIVES=1 SCALA_VERSION=2.12 SPARK_VERSION=3.1.2