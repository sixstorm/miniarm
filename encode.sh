#!/bin/bash
# encode SELECTION INPUT_FILE OUTPUT_FILE

# FFMPEG Commands
#DVDCmd="ffmpeg -i '$2' -c:v -map 0:a:0? -c:a:0 aac -b:a:0 160k -filter:a:0 'pan=stereo|FL=1.414*FC+0.707*FL+0.5*FLC+0.5*BL+0.5*SL+0.5*LFE|FR=1.414*FC+0.707*FR+0.5*FRC+0.5*BR+0.5*SR+0.5*LFE,acompressor=ratio=4' -metadata:s:a:0 language=eng -metadata:s:a:0 title='Stereo' -metadata:s:a:0 handler_name='Stereo' -disposition:a:0 default -map 0:a:0? -c:a:1 copy -metadata:s:a:1 language=eng -metadata:s:a:0 title='Surround' -metadata:s:a:1 handler_name='Surround' -disposition:a:1 none '$3'"
DVDCmd="ffmpeg -i '$2' -map 0:v -c:v libx264 -preset slow -vf format=yuv420p -movflags +faststart -map 0:a:0 -c:a:0 aac -b:a:0 160k -filter:a:0 'pan=stereo|FL=1.414*FC+0.707*FL+0.5*FLC+0.5*BL+0.5*SL+0.5*LFE|FR=1.414*FC+0.707*FR+0.5*FRC+0.5*BR+0.5*SR+0.5*LFE,acompressor=ratio=4' -metadata:s:a:0 language=eng -metadata:s:a:0 title='Stereo' -metadata:s:a:0 handler_name='Stereo' -disposition:a:0 default -map 0:a:0? -c:a:1 copy -metadata:s:a:1 language=eng -metadata:s:a:1 title='Surround' -metadata:s:a:1 handler_name='Surround' -disposition:a:1 none '$3'"

case $1 in
DVD)
  echo "########################"
  echo $DVDCmd
  echo "########################"
  eval "$DVDCmd"

  ;;

BR)
  echo "You entered Blu-Ray"
  ;;
esac
