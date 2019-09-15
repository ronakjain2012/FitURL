/* eslint-disable prefer-const */
'use strict'

const ShortUrl = use('App/Models/ShortUrl')
// const NotificationService = use('App/Utilities/NotificationService')
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

  async find({ request, response, session }) {
    let shortUrl = request.params.id
    let shortModel = await ShortUrl.query()
      .whereNull('deleted_at')
      .where('force_disabled', 0)
      .whereNotNull('special_url')
      .where(function() {
        this.where('special_url', shortUrl).orWhere('short_url', shortUrl)
      })
      .first()
    if (!shortModel) {
      shortModel = await ShortUrl.query()
        .whereNull('deleted_at')
        .where('force_disabled', 0)
        .where('partition_index_number', shortUrl.length)
        .where('partition_index', shortUrl.charAt(0))
        .where(function() {
          this.where('special_url', shortUrl).orWhere('short_url', shortUrl)
        })
        .first()
    }
    if (shortModel) {
      shortModel.hits++
      shortModel.save()
      response.status(200).json({
        status: true,
        message: 'Redirecting...',
        data: {
          original_url: shortModel.original_url,
          meta: shortModel.url_meta,
          url_category: shortModel.url_category,
          domain: shortModel.domain
        }
      })

    } else {
      response.status(403).json({
        status: false,
        errors: {
          original_url: 'Invalid URL.'
        }
      })
    }
  }
}

module.exports = IndexController
