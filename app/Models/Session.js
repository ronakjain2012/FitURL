'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')

class Session extends Model {
  static get table() {
    return 'sessions'
  }
  static get primaryKey() {
    return 'id'
  }
  static get deleteTimestamp() {
    return null
  }
  static get dateFormat() {
    return 'YYYY-MM-DD HH:mm:ss'
  }

  static async addOrUpdate(session) {
    let thisModel = this.query()
      .where('deleted_at', null)
      .where('id', session.session_id)
      .first()
    if (thisModel) {
      thisModel.visit_count++
      await thisModel.save()
    } else {
      thisModel = await this.create(session)
    }
    return {
      session_id: thisModel.id,
      genrated_at: this.$moment(
        thisModel.updated_at || thisModel.created_at,
        'YYYY-MM-DD HH:mm:ss'
      ).format('X'),
      expire_at: this.$moment(
        thisModel.updated_at || thisModel.created_at,
        'YYYY-MM-DD HH:mm:ss'
      )
        .add(1, 'h')
        .format('X')
    }
  }

  static async create(session) {
      let thisModel = new this()
      thisModel.session = session.city
      thisModel.region = session.city
      thisModel.country = session.city
      thisModel.country_code = session.city
      thisModel.state = session.city
      thisModel.city = session.city
      thisModel.zip_code = session.city
      thisModel.iso_code = session.city
      thisModel.lat = session.city
      thisModel.long = session.city
      thisModel.postal_code = session.city
      thisModel.area_code = session.city
      thisModel.metro_code = session.city
      thisModel.ip = session.city
      thisModel.visit_count = 1
      thisModel.agent = session.city
      thisModel.isp = session.city
      thisModel.org = session.city
      thisModel.business_name = session.city
      thisModel.business_website = session.city
      thisModel.raw_data = session.city
      await thisModel.save()
      return thisModel
  }
}

module.exports = Session
