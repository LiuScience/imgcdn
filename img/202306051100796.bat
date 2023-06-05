@echo off

ffmpeg -i %1 -f segment -segment_time 20 -segment_format mpegts -segment_list %cd%\playlist.m3u8 -c copy -bsf:v h264_mp4toannexb -map 0 %cd%\wcache\%%04d.ts && move %cd%\wcache\0030.ts %cd%\0030.ts 

ffmpeg -i 0030.ts -c:v libx264 -c:a copy -vf "movie=rm425-16-315.png[wm];[in][wm]overlay=W-w-10:H-h-5[out]" [RIYUE]0030.ts

del /s/q %cd%\wcache\0000.ts && del /s/q %cd%\0030.ts && ren %cd%\[RIYUE]0030.ts 0030.ts && move %cd%\0030.ts %cd%\wcache\0030.ts && move %cd%\playlist.m3u8 %cd%\wcache\playlist.m3u8 && ffmpeg -i %cd%\wcache\playlist.m3u8 -c copy -bsf:a aac_adtstoasc %~n1.RYK.mp4 && del /s/q %cd%\wcache\*.*
:: && del /s/q %%1
:: && move %cd%\%1 %cd%\video\%1

pause