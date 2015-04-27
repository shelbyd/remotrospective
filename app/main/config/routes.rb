# See https://github.com/voltrb/volt#routes for more info on routes

client '/{{ _name }}', _action: 'show', _controller: 'retro'

# The main route, this should be last. It will match any params not
# previously matched.
client '/', {}
