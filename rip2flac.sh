#!/bin/bash

# This script is designed to be run from the directory where you want to keep the music files

# STEP 1: Rip CD to WAV files using cdparanoia
cdparanoia -B

# The working directory should now have multiple WAV files in the format
# 	track[track_number].cdda.wav
# We want to get the album/albumartist info and track info, starting with track 01
read -p "Album Artist: " album_artist
read -p "Album: " album

track_titles=()
track=0
function incrementTrackNumber() {
    ((track++))
    track_string=`printf %02d $track`
}
incrementTrackNumber

while [ -f "track$track_string.cdda.wav" ]
do
	read -p "Track ${track_string} Title: " track_title
	track_titles[track]=$track_title
	incrementTrackNumber
done

# We now have artist/album/track info for the entire album
# Convert songs to FLAC, tagging as we go

track=0
incrementTrackNumber
while [ -f "track${track_string}.cdda.wav" ]
do
    track_file_name="$track_string ${track_titles[track]}.flac"
    flac --delete-input-file --verify -0 --output-name="${track_file_name}" -T artist="${album_artist}" -T albumartist="${album_artist}" -T album="${album}" -T tracknumber=${track} -T title="${track_titles[track]}" track${track_string}.cdda.wav
    incrementTrackNumber
done

exit 1
