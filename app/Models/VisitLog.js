/* eslint-disable prefer-const */
'use strict'

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model')
const Session = use('App/Models/Session')

class VisitLog extends Model {
  static get table() {
    return 'visit_logs'
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

  static async updateAndCreate(data) {
    try {
      let thisModel = await this.find(data.master)
      if (!thisModel) {
        thisModel = new this()
      }
      const sessionId = await Session.query()
        .select('id')
        .where('session', data.session_id)
        .first()
      thisModel.url_id = thisModel.url_id
        ? thisModel.url_id
        : data.url_id || null
      thisModel.session_id = thisModel.session_id
        ? thisModel.session_id
        : sessionId
        ? sessionId.id
        : null
      thisModel.visited_at = thisModel.visited_at
        ? thisModel.visited_at
        : data.visited_at || null
      thisModel.visit_start = thisModel.visit_start
        ? thisModel.visit_start
        : data.visit_start || null
      thisModel.visit_end = thisModel.visit_end
        ? thisModel.visit_end
        : data.visit_end || null
      thisModel.skip_ad = data.skip_ad || 0
      thisModel.invalid_hit = data.invalid_hit || 0
      thisModel.redirected_at = thisModel.redirected_at
        ? thisModel.redirected_at
        : data.redirected_at || null
      await thisModel.save()
      return thisModel.id
    } catch (ex) {
      return null
    }
  }
}

module.exports = VisitLog
