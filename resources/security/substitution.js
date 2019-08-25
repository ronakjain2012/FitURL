/* eslint-disable prefer-const */
const charSet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-= '.split(
  ''
)
const CaesarSet = 'Kkop8=EPY7yfTFmU-gc9 2hZHWdLJvzatB1ISOenVRi3GX0qlx_5u4Ns6wrAjbQMCD'.split(
  ''
)

export default {
  encrypt: (pt) => {
    let ptArray = pt.split('')
    let ctArray = []
    for (let i = 0, n = ptArray.length; i < n; i++) {
      if (charSet.includes(ptArray[i])) {
        ctArray.push(CaesarSet[charSet.indexOf(ptArray[i])])
      } else {
        ctArray.push(ptArray[i])
      }
    }
    return ctArray.join('')
  },
  decrypt: (ct) => {
    let ctArray = ct.split('')
    let ptArray = []
    for (let i = 0, n = ctArray.length; i < n; i++) {
      if (CaesarSet.includes(ctArray[i])) {
        ptArray.push(charSet[CaesarSet.indexOf(ctArray[i])])
      } else {
        ptArray.push(ptArray[i])
      }
    }
    return ptArray.join('')
  },
  getChars: () => {
    return charSet
  },
  getCaesar: () => {
    return CaesarSet
  }
}
