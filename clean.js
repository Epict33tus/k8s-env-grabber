const fs = require('fs')

const env = fs.readFileSync('./.env').toString('utf-8')
console.log({ env })
const array = env.split('\n').reduce((acc, val) => ([...acc, ...(!!val.startsWith('CM') || !!val.startsWith('ARGO') ? [] : [val])]), [])
const s = array.join('\n')

fs.writeFileSync('.env', s)
