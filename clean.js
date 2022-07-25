const fs = require('fs')
const manifest = require('./manifest.json')
const { startsWith } = manifest
const env = fs.readFileSync('./.env').toString('utf-8')
const clean = val => {
  if (startsWith) {
    const flagStartsWith = startsWith.some(test => val.startsWith(test))
    if (flagStartsWith) return true
  }
  // TODO - add other basic search functions to manifest and test
  return false
}
const array = env.split('\n').reduce((acc, val) => ([...acc, ...(clean(val) ? [] : [val])]), [])
const s = array.join('\n')

fs.writeFileSync('.env', s)
