// eslint-disable-next-line no-unused-vars
let isSupported = true
try {
  const test = 'localstorage-test'
  window.localStorage.setItem(test, test)
  window.localStorage.removeItem(test)
} catch (e) {
  isSupported = false
  console.error('Local storage is not supported')
}
export default {
  has: (key) => {
    return !window.localStorage.getItem(key) === null
  },
  get: (key) => {
    if (this.canStorage() && this.has(key)) {
      return window.localStorage.getItem(key)
    } else {
      return null
    }
  },
  getJson: (key) => {
    if (this.canStorage() && this.has(key)) {
      return JSON.parse(window.localStorage.getItem(key))
    } else {
      return null
    }
  },
  set: (key, value) => {
    if (this.beforeSet(value)) {
      window.localStorage.setItem(key, value)
      return this.afterSet(key)
    } else return false
  },
  setJson: (key, value) => {
    if (this.beforeSet(value)) {
      window.localStorage.setItem(key, JSON.stringify(value))
      return this.afterSet(key)
    } else return false
  },
  clearAll: () => window.localStorage.clear(),
  delete: (key) => {
    if (this.canStorage() && this.has(key)) {
      window.localStorage.removeItem(key)
    }
  },
  beforeSet: (value) => {
    if (value === undefined) return false
    else return true
  },
  afterSet: (key) => {
    return this.get(key) !== undefined
  },
  canStorage: () => {
    return !!window.localStorage
  }
}
