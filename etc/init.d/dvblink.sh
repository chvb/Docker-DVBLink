#!/bin/bash

chmod -R 777 /opt/DVBLink
chmod -R 777 /usr/local/bin/dvblink
chmod -R 777 /opt-start/DVBLink
chmod -R 777 /opt-start/dvblink

# Prepare DVBLink bin
if [ -z "`ls /usr/local/bin/dvblink/config --hide='lost+found'`" ]
then
	cp -R /opt-start/config/* /usr/local/bin/dvblink/config
fi
if [ ! -f "/usr/local/bin/dvblink/config/dvblink_settings.xml" ]
then
	cp -Rn /opt-start/config/* /usr/local/bin/dvblink/config/
fi

# Prepare DVBLink bin
if [ -z "`ls /opt/DVBLink --hide='lost+found'`" ]
then
	cp -R /opt-start/DVBLink/* /opt/DVBLink
fi
if [ ! -f "/opt/DVBLink/data/database/dlrecorder.db" ]
then
	cp -Rn /opt-start/DVBLink/* /opt/DVBLink/
fi

# Start
/usr/local/bin/dvblink/start.sh
bash

else
echo "Install Wrong! Please Check Image or Path Config!"
sleep 60
fi
