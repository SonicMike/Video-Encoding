This folder contains information about HandBrake.  You will find a preset file and a pdf of the directions for manually configuring HandBrake.

HandBrake

## HandBrake Encoding Settings

### Introduction:

Included in this folder is a HandBrake preset that you can import.

To import the preset, choose Preset > Import from file. The preset will be called Mediasite Preset 1.

### Summary tab

Format: MP4.
Preset: Fast 720p30.
Web Optimized: Selected.
Align A/V start: Selected.


![HandBrake_B6CCXPniUY.png](./_resources/be3e744357084b1ba132555aa43c0c4c.png)



### Dimensions tab


1280 x 720 or less depending on the source material.



### Filters tab
Skip unless you need to perform on of those operations on your video.



### Video tab

Video Codec H.264.
Framerate set to your frame rate of your material. Either use the "Same as Source" settings or set the FPS here. The FPS setting should be not more than 30 fps.
Constant frame rate selected.
Avg bitrate 1500 or less. Depending on the content and your goals the bitrate could be lessened.
2 pass encoding.
Turbo first pass.

Encoder preset
Use whatever preset your conformable with.  The slower the better things will look.

Encoder level
Auto.

In Extra Options enter
Use "keyint=#".
Replace the # symbol with your value. For the value get the frames per second value and multiply it by 2 for a key frame every 2 seconds.  Multiply by 4 for a key frame every 4 seconds.  The keyframe frequency has be be less than one every 6 seconds to bypass transcoding.

![HandBrake_SaG15XfZA0.png](._resources/02a72dd742ae46d79cd30874fa5349f0.png)


### Tune tab
For screencast I sometimes try "Still Image".  The quality is a little better with that tuning.  Its not that significant however.
	
![HandBrake_OsZYADhebf.png](._resources/8f1c88b6ad1641908bdcf144a22b6d3e.png)


### Audio tab
Set the bitrate and the mixdown mode (stereo or mono).
![HandBrake_nN0HJSoGvV.png](._resources/7133685f05604056837ff962f5876b24.png)

### Subtitle tab
Skip.

### Chapters tab
Skip.



