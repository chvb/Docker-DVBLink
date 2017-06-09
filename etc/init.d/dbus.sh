#!/usr/bin/with-contenv bash

rm /var/run/dbus/pid
exec dbus-daemon --system --nofork
