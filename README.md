# BashRip
Simple bash scripts for easy FLAC ripping and tagging of audio CDs using cdparanoia

## Requirements
- [cdparanoia](https://www.xiph.org/paranoia/index.html)
- [flac](https://xiph.org/flac/)

## Usage
1. Clone repo or download zip archive and extract
2. Insert audio CD
3. Navigate to rip destination, ie. `cd /path/to/Music/Artist/Album`
4. Execute `/path/to/BashRip/rip2flac.sh`
5. Once cdparanoia batch WAV rip completes, enter artist, album, and track title info. When all track titles entered, script will convert all ripped WAV files to tagged FLAC files named according to track number and title. Source WAV files will be deleted.

## Notes
- If you want to adjust FLAC compression , simply open and edit `rip2flac.sh`
- To convert the resulting FLAC files to MP3, I recommend [this script](https://github.com/tacvbo/yaflac2mp3/blob/master/yaflac2mp3.sh)...has been working well for me

## License
GNU GENERAL PUBLIC LICENSE, Version 3
