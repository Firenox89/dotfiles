#! /bin/bash

amixer -D pulse sset Master 5%+ unmute
volumeResult=`curl -X POST -H Content-Type:application/json -d '{
  "method": "core.mixer.get_volume",
  "jsonrpc": "2.0",
  "params": {},
  "id": 1
}' http://192.168.2.118/mopidy/rpc `

oldVolume=`echo $volumeResult | jq '.result'`
newVolume=$[$oldVolume + 5]

curl -X POST -H Content-Type:application/json -d "{
  \"method\": \"core.mixer.set_volume\",
  \"jsonrpc\": \"2.0\",
  \"params\": {
    \"volume\": $newVolume    
  },
  \"id\": 1
}" http://192.168.2.118/mopidy/rpc
