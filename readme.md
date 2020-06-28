
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

`set -x AWS_REGION="ap-southeast-2"
QUEUE_URL="https://sqs.ap-southeast-2.amazonaws.com/447119549480/StreamripperQueue"
RUN_CMD="streamripper $URL -l $DURATION -a $output_filename -o always"
VERBOSE="0"
TIMEOUT="10"
COUNT="5"
LOOP=""
`

