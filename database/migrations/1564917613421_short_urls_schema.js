'use strict'

/** @type {import('@adonisjs/lucid/src/Schema')} */
const Schema = use('Schema')

class ShortUrlsSchema extends Schema {
  up() {
    this.create('short_urls', (table) => {
      table
        .bigInteger('_id')
        .unsigned()
        .notNullable()
        .increments()

      table.string('partition_index', 1).nullable()
      table.string('special_url', 255).nullable()
      table.string('short_url', 1024).nullable()
      table.string('original_url', 1024).nullable()
      table.date('expire_date', 1).nullable()
      table.time('expire_time', 1).nullable()
      table.string('user_name', 1).nullable()
      table.string('user_email', 1).nullable()
      table.string('user_mobile', 1).nullable()
      table.string('user_country', 1).nullable()
      table.string('url_meta', 1).nullable()
      table.string('url_category', 1).nullable()
      table.string('display_ads', 1).nullable()
      table.string('analytic_report', 1).nullable()
      table.string('force_disabled', 1).nullable()
      table.timestamp('created_at')
      table.timestamp('created_at', 1).nullable()
      table.timestamp('deleted_at', 1).nullable()
    })
  }

  down() {
    this.drop('short_urls')
  }
}

module.exports = ShortUrlsSchema
