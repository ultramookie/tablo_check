#!/bin/bash

# IP of Tablo
IP=10.0.1.6
# Port to run command on
PORT=18080
# Dead Mans Snitch URL to ping
DMS="https://nosnch.in/DMS_ID_HERE"

# Make sure we are getting at least some listing of recordings (hopefully
# there is stuff recorded on the DVR)
LINES=`curl -s http://${IP}:${PORT}/plex/rec_ids | wc -l`
# Check that we are getting "ids" which is returned in this call.
IDCHK=`curl -s http://${IP}:${PORT}/plex/rec_ids | grep ids | wc -l`

if [ "$LINES" -gt "0" ] && [ "$IDCHK" -gt "0" ]
then
  curl ${DMS}
else
  echo "Tablo ${IP} seems down..."
fi
