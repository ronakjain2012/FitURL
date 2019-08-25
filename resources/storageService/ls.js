/* eslint-disable no-extra-boolean-cast */
/* eslint-disable no-unneeded-ternary */
// eslint-disable-next-line no-unused-vars
import security from '~/security/substitution'
class Ls {
  has(key) {
    return !(localStorage.getItem(key) === null)
  }
  get(key) {
    if (this.canStorage() && this.has(key)) {
      return localStorage.getItem(key)
    } else {
      return null
    }
  }
  getJson(key) {
    if (this.canStorage() && this.has(key)) {
      return JSON.parse(localStorage.getItem(key))
    } else {
      return null
    }
  }
  getDecrtpted(key) {
    if (this.canStorage() && this.has(key)) {
      return JSON.parse(security.decrypt(localStorage.getItem(key)))
    } else {
      return null
    }
  }
  set(key, value) {
    if (this.beforeSet(value)) {
      localStorage.setItem(key, value)
      return this.afterSet(key)
    } else return false
  }
  setJson(key, value) {
    if (this.beforeSet(value)) {
      localStorage.setItem(key, JSON.stringify(value))
      return this.afterSet(key)
    } else return false
  }
  setEncrypted(key, value) {
    if (this.beforeSet(value)) {
      localStorage.setItem(key, security.encrypt(JSON.stringify(value)))
      return this.afterSet(key)
    } else return false
  }
  clearAll() {
    localStorage.clear()
  }
  delete(key) {
    if (this.canStorage() && this.has(key)) {
      localStorage.removeItem(key)
    }
  }
  beforeSet(value) {
    if (value === undefined) return false
    else return true
  }
  afterSet(key) {
    return this.get(key) !== undefined
  }
  canStorage() {
    return !!localStorage ? true : false
  }
  getAll() {
    return JSON.parse(JSON.stringify(localStorage.valueOf()))
  }
}
export default new Ls()
