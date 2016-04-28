###

Build sourse.

###

compiler = require "./compiler"

done = -> console.log "ok! complete."


compiler "production"
  .run (err, stats) -> if err then throw err else done()
