#!/usr/bin/env bash
date -u
echo ------------------------
echo "Args: $@"
echo ------------------------
env
echo ------------------------

SHOWNAME=$2
RADIOSTATION=$3
DURATION=$4
URL=$5

echo ------------------------
echo SHOWNAME: $SHOWNAME
echo RADIOSTATION: $RADIOSTATION
echo DURATION: $DURATION
echo URL: $URL
echo OUTPUT_BUCKET: $OUTPUT_BUCKET
echo OUTPUT_DIR: $OUTPUT_DIR

date=`TZ=Australia/Melbourne date +"%Y-%m-%d_%a_%H%M"`
# output_filename="$RADIOSTATION-$SHOWNAME-${date}.mp4"
output_filename="$RADIOSTATION-$SHOWNAME-${date}.mp3"
output_fullpath=$OUTPUT_DIR"/"$output_filename
echo "output_fullpath: $output_fullpath"
echo ------------------------

ffmpeg -y \
    -i $URL \
    -c:a libmp3lame \
    -t $DURATION \
    $output_fullpath

#Copy Episode to S3
echo COPYING $output_fullpath TO S3 
aws s3 cp $output_fullpath s3://$OUTPUT_BUCKET/$RADIOSTATION/$SHOWNAME/$output_filename --storage-class STANDARD_IA
        
# Exit after recording episode - start fresh next time.
# exit 1

