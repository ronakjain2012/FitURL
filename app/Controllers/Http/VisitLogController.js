'use strict'

const VisitLog = use('App/Models/VisitLog')

class VisitLogController {
  constructor() {
    this.nuxt = use('Service/Nuxt')
  }

  async update({ request, response }) {
    const requestData = request.body
    const data = await VisitLog.updateAndCreate(requestData)
    response.status(200).json({
      status: true,
      message: '',
      data
    })
  }
}

module.exports = VisitLogController
