const stdin = process.openStdin()
const fs = require('fs')

let data = ''

stdin.on('data', chunk => {
  data += chunk
})

stdin.on('end', () => {
  const array = data.split('\n').filter(line => !(line.includes('error') || line.startsWith('Default'))).map(s => s.replaceAll('\r', ''))
  for (const line of array) {
    fs.appendFileSync('./.env', `${line}\n`) 
  }
})
