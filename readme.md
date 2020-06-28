
ffmpeg -y \
 -i http://eno.emit.com:1935/live/3pbs_aac_64.stream/playlist.m3u8 \
 -c copy \
 -bsf:a aac_adtstoasc \
 -t 60 \
 out.mp4

ffmpeg -y \
 -i http://eno.emit.com:1935/live/3pbs_aac_64.stream/playlist.m3u8 \
 -c copy \
 -t 60 \
 out.mp4

ffmpeg -y \
 -i http://public-radio1.internode.on.net:8002/114 \
 -c copy \
 -t 15 \
 out.mp4

ffmpeg -y \
 -i http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p \
 -c copy \
 -t 15 \
 out.mp4

ffmpeg -y \
 -i http://stream.ckut.ca:8000/903fm-192-stereo \
 -c copy \
 -t 15 \
 out.mp4

## Testing

Build image
`
docker build -t streamripper:latest .
`

Interactive task:
`
docker run -it --entrypoint='bash' streamripper
`


Set environment variables in task for testing:

`export AWS_REGION="ap-southeast-2"
export QUEUE_URL="https://sqs.ap-southeast-2.amazonaws.com/447119549480/StreamripperQueue"
export RUN_CMD="streamripper $URL -l $DURATION -a $output_filename -o always"
export VERBOSE="0"
export TIMEOUT="10"
export COUNT="5"
export LOOP=""
`

Force refresh of ECS tasks once build job complete
`aws ecs update-service --cluster Personal --service streamripper --force-new-deployment`