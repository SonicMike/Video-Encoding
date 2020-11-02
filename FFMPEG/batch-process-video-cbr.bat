@echo off

REM //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

REM This batch file should have a .bat file extension
REM Uses Constants Rate Factor encoding (CRF) - https://trac.ffmpeg.org/wiki/Encode/H.264#crf
REM Drag and drop mp4 files onto this batch file to process them with ffmpeg.
REM The processed files will be in the same folder as the original with the word done at the end of the file name.
REM uses ffmpeg for processing the files - https://ffmpeg.zeranoe.com/builds/

REM //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

TITLE Converting file - Press ctrl+c to abort processing.
REM set videoTune=""

REM //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

REM This section of the script contains variables which you can change

REM //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

REM //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

REM Please update this path to your ffmpeg.

REM //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

set ffmpeg=C:\ffmpeg\bin\ffmpeg.exe

REM these variables allow to alter the way the video gets compressed.
set framesPerSecond=15

REM video dimensions 
set height=720

REM it's best to leave the width alone. It will be set automatically and proportional to the height keeping the aspect ratio right. 
set width=-2

REM has to be 6 or lower to bypass transcoding.
set keyframe=5.000

REM valid tune settings: film, animation, stillimage. https://trac.ffmpeg.org/wiki/Encode/H.264
REM stillimage seems to work ok for screencasts.
REM add rem to the next line to skip this setting.
rem set videoTune=-tune stillimage

REM Valid presets. ultrafast, superfast, veryfast, faster, fast, medium, slow, slower, veryslow. https://trac.ffmpeg.org/wiki/Encode/H.264
REM Slower presets encode smaller but take longer.
set h264preset=medium

REM A sane range is 17–28. A higher number means the file will be smaller. Rate control decides how many bits will be used for each frame. This will determine the file size and also how quality is distributed. https://trac.ffmpeg.org/wiki/Encode/H.264
set constantRateFactor=21

REM for audioMode set it to 1 for mono, 2 for stereo
set audioMode=1

REM 64, 128, 256 are all good audio bit rates to use.
set audioBitRate=64


REM //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

REM End of variables

REM //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////


if not exist %ffmpeg% (
Echo "FFMPEG not found.  Please update the path in the script."
goto:eof
) else (
Rem ffmpeg is found.
)

:start

:again
echo Press ctrl+c to abort processing.
echo Processing "%~1"
echo.
%ffmpeg% -loglevel quiet -stats -i "%~1" -r %framesPerSecond% -vf "scale=iw*sar:ih,setsar=1,scale=%width%:%height%" -force_key_frames:v "expr:gte(t,n_forced*%keyframe%)" -crf %constantRateFactor% -preset %h264preset% %videoTune% -c:a aac -b:a %audioBitRate%k -ac %audioMode%  -movflags +faststart "%~p1%~n1-done.mp4"
echo Done
shift
if "%~1" == "" goto:eof
goto:again

