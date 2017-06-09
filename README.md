# Docker DVBLink DVB Software

DVBLink offers everything you need to enjoy your favorite Satellite (DVB-S/S2), Cable (DVB-C and QAM), Terrestrial (DVB-T/T2 and ATSC), IPTV and Analog TV channels and recordings within your home network and on the go!

Record your favorite TV programs in original quality directly to the local hard disk of your NAS, PC, Mac or Raspberry Pi

Watch live and recorded TV on your mobile devices with free DVBLink apps for iOS and Android

Live and recorded TV in a web browser for Windows, Linux and Mac laptops and workstations

Enjoy your favorite programs on all TV screens in house with Kodi and DLNA clients

## Volumes

DVBLogic is quite locked down, directory-wise. Currently only `/share` and `/recordings` are used.

Everything else is splitted up by DVBLogic to different files.

Currently the volumes are:

* `/recordings` - Recordings folder. You might have to point it here. **Required**
* `/opt/DVBLink` - Where all xmltv, transponders, playlists etc is located. **Required**
* `/usr/local/bin/dvblink` - Config folder. **Required**

## Ports

It's recommended to run the docker with `--net=host` to be able to use IPTV without issues.

* `22` - SSH Port.
* `39876` - DVBLink config port.
* `8100` - DVBLink tvguide port.

## Info

Read more at http://dvblogic.com
