
module.exports = (app) ->
    app.post '/square', (req, res) -> 
        console.log req.body
        to_square = req.body.to_square
        res.send {result: to_square * to_square}
