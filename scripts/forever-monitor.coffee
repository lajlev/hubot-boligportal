forever = require('forever-monitor')
child = new (forever.Monitor)('your-filename.js',
  max: 3
  silent: true
  options: [])
child.on 'exit', ->
  console.log 'your-filename.js has exited after 3 restarts'
  return
child.start()