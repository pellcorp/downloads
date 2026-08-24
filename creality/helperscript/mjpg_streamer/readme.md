# Installing MJPG Streamer

The mjpg_streamer installed by helper script is via entware and often entware is down, I built mjpg_streamer for Simple AF project, but we long ago migrated to uStreamer, but
the package is still around.

To install the MJPG Streamer, run this from SSH:

```
curl -L "https://github.com/pellcorp/k1-mjpg-streamer/releases/download/main/mjpg-streamer.tar.gz" -o /usr/data/mjpg-streamer.tar.gz
tar -zxf /usr/data/mjpg-streamer.tar.gz -C /usr/data/
```



