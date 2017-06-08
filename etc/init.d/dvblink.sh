#!/bin/bash

# Prepare DVBLink bin
if [ -z "`ls /usr/local/bin/dvblink --hide='lost+found'`" ]
then
	cp -R /opt-start/dvblink/* /usr/local/bin/dvblink
fi
if [ ! -f "/usr/local/bin/dvblink/start.sh" ]
then
	cp -Rn /opt-start/dvblink/* /usr/local/bin/dvblink
fi

# Start
/usr/local/bin/dvblink/start.sh
bash

else
echo "Install Wrong! Please Check Image or Path Config!"
sleep 60
fi
