# See https://github.com/voltrb/volt#routes for more info on routes

get '/{{ _name }}', _action: 'show', _controller: 'retros'

# The main route, this should be last. It will match any params not
# previously matched.
get '/', {}
