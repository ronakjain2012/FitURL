'use strict'

class IndexController {
  constructor() {
    this.nuxt = use('Service/Nuxt')
  }
  async store({ request: { request: req }, response: { response: res } }){
    await new Promise((resolve, reject) => {
      console.log(req)
    });
  }
}

module.exports = IndexController
