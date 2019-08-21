'use strict'

const ShortUrl = use('App/Models/ShortUrl')
const UrlSetting = use('App/Models/UrlSetting')

class IndexController {
  constructor() {
    this.nuxt = use('Service/Nuxt')
  }
  async store({ request, response }) {
    let data = request.body
    let errors = {}
    if (!data.original_url.length) errors.special_url = 'URL is Required.'
    if (data.special_url) {
      let alias = await ShortUrl.findBy('special_url', data.special_url)
      if (alias) {
        errors.special_url = 'URL alias is not available.'
      }
    }
    ShortUrl.short(data)
    response.json({ error_fields: errors })
  }
}

module.exports = IndexController
