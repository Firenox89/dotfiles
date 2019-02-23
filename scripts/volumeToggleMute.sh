#! /bin/bash

amixer -q set Master toggle
muteResult=`curl -X POST -H Content-Type:application/json -d '{
  "method": "core.mixer.get_mute",
  "jsonrpc": "2.0",
  "params": {},
  "id": 1
}' http://192.168.2.118/mopidy/rpc `

oldMute=`echo $muteResult | jq '.result'`
if [ $oldMute = "true" ]; then
  newMute='false'
else
  newMute='true'
fi

curl -X POST -H Content-Type:application/json -d "{
  \"method\": \"core.mixer.set_mute\",
  \"jsonrpc\": \"2.0\",
  \"params\": {
    \"mute\": $newMute    
  },
  \"id\": 1
}" http://192.168.2.118/mopidy/rpc
