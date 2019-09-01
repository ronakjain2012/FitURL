/* eslint-disable prefer-const */
'use strict'

const ShortUrl = use('App/Models/ShortUrl')
const NotificationService = use('App/Utilities/NotificationService')
const Env = use('Env')

/**
 * @description Project APIs
 * 200: {status: true, message: String, data: [Object, Array, null]}
 * 402: {status: false, errors: [Object]}
 */
class IndexController {
  constructor() {
    this.nuxt = use('Service/Nuxt')
  }
  getAvailableDomains() {
    if (Env.get('NODE_ENV') === 'development') {
      return [Env.get('APP_URL')]
    }
    return [Env.get('APP_URL'), 'thefiturl.com', 'fit.com', 'fiturl.co']
  }

  async store({ request, response, session }) {
    let data = request.body
    let res = await ShortUrl.short(data)
    if (res.status === true) {
      let urls = []
      for (let domain of this.getAvailableDomains()) {
        urls.push({
          original_url: data.original_url,
          short_url: `${domain}/${res.data.special_url || res.data.short_url}`
        })
      }
      res.message = `Wohh! fat to fit is ready`
      res.data = {
        urls
      }
      response.status(200).json(res)
    } else response.status(403).json(res)
  }
}

module.exports = IndexController
