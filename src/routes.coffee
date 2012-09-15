module.exports = (app) ->

    app.get '/' , (req, res) ->
        res.render 'index', {action: 'Do Something!'}

    app.get '/action/:action' , (req, res) ->
        res.render 'index', {action: req.params.action}

    app.get '/hello', (req, res) -> 
        res.send 'Hello Node'

    app.get '/hello/:name', (req, res) -> 
        res.send "Hello #{req.params.name}"

    app.get '/set/:key/:val', (req, res) ->
        set req.params.key, req.params.val
        res.send 'OKAY'

    app.get '/get/:key', (req, res) ->
        get req.params.key, (err, val) ->
            if err?
                res.send 500, err
            else
                res.send val
