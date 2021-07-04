##FROM ubuntu:21.10

##RUN apt-get update && apt-get install -y openjdk-16-jre wget unzip maven tesseract-ocr tesseract-ocr-fra

FROM gzpyzjy/ubuntu-jdk16

RUN apt-get update && \
    apt-get install -y apt-utils && \
    apt-get install -y locales tzdata && \
    locale-gen zh_CN.UTF-8 && \
    update-locale LANG=zh_CN.UTF-8 LANGUAGE=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8 && \
    ln -fs /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

ENV LANG=zh_CN.UTF-8 LANGUAGE=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8

WORKDIR /root

RUN export https_proxy="http://192.168.10.2:3128" && wget https://oss.sonatype.org/content/repositories/snapshots/fr/pilato/elasticsearch/cra
wler/fscrawler-es7/2.7-SNAPSHOT/fscrawler-es7-2.7-20210622.151852-185.zip

RUN unzip fscrawler-es7-2.7-20210622.151852-185.zip

CMD ["/root/fscrawler-es7-2.7-SNAPSHOT/bin/fscrawler","document","--debug","--rest"]
