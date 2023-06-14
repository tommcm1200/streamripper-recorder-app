FROM jrottenberg/ffmpeg as ffmpeg

RUN apt-get update \
    && apt-get -y install python python-pip jq wget curl unzip\
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"\
    && unzip awscliv2.zip\
    && ./aws/install

# RUN useradd -m -d /home/streamripper streamripper
# USER streamripper
# WORKDIR /home/streamripper

ADD run_with_awsbatch.sh /run_with_awsbatch.sh
ENTRYPOINT ["/run_with_awsbatch.sh"]
# VOLUME /home/streamripper
