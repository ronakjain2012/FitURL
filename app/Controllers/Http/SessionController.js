'use strict'

const Session = use('App/Models/Session')
class SessionController {
  constructor() {
    this.nuxt = use('Service/Nuxt')
  }
  async store({ request, response, session }) {
    const reqData = request.body
    reqData.session_id = reqData.session_id || session._sessionId
    const sessionModel = await Session.addAndUpdate(reqData)
    response.json(sessionModel)
  }

}

module.exports = SessionController
