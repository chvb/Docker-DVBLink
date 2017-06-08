#!/bin/bash

# Prepare DVBLink bin
if [ -z "`ls /usr/local/bin/dvblink --hide='lost+found'`" ]
then
	cp -R /opt-start/dvblink/* /usr/local/bin/dvblink
fi
if [ ! -f "/usr/local/bin/dvblink/dvblink_server" ]
then
	cp -Rn /opt-start/dvblink/* /usr/local/bin/dvblink/
fi

# Prepare DVBLink bin
if [ -z "`ls /opt/DVBLink --hide='lost+found'`" ]
then
	cp -R /opt-start2/dvblink/* /opt/DVBLink
fi
if [ ! -f "/opt/DVBLink/data/database/dlrecorder.db" ]
then
	cp -Rn /opt-start2/dvblink/* /opt/DVBLink/
fi

# Start
/usr/local/bin/dvblink/start.sh
bash

else
echo "Install Wrong! Please Check Image or Path Config!"
sleep 60
fi
