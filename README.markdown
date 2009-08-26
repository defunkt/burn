Burn
====

Burn is a Sinatra app that listens for POSTs and forwards the messages it
receives to Campfire.

1. Make a `campfire.yml`. 
2. Put it in the same directory as `burn.rb`. 
3. Run it: `$ ruby burn.rb`. 
4. Hit it: `curl -F message='Hi mom!' http://localhost:4567`

Chris Wanstrath // chris@ozmm.org
