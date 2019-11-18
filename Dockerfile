FROM jrottenberg/ffmpeg as ffmpeg

RUN apt-get update \
    && apt-get -y install python python-pip jq wget \
    && pip install awscli

# RUN useradd -m -d /home/streamripper streamripper
# USER streamripper
# WORKDIR /home/streamripper

ADD run_with_poll.sh /run_with_poll.sh
ENTRYPOINT ["/run_with_poll.sh"]
# VOLUME /home/streamripper
