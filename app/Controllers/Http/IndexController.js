/* eslint-disable prefer-const */
'use strict'

const ShortUrl = use('App/Models/ShortUrl')
// const UrlSetting = use('App/Models/UrlSetting')

class IndexController {
  constructor() {
    this.nuxt = use('Service/Nuxt')
  }
  async store({ request, response }) {
    let data = request.body
    let res = await ShortUrl.short(data)
    response.json(res)

  }
}

module.exports = IndexController
