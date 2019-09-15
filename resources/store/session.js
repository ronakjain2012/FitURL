import storageService from '~/storageService/ls'
import repositoryFactory from '@/repository/repositoryFactory'
const session = repositoryFactory.get('session')

export const state = () => {
  return {
    session: null,
    session_id: null,
    city: null,
    continent: null,
    country: null,
    location: { lat: 0, long: 0 },
    time_zone: null,
    postal: null,
    iso_code: null,
    represented_country: null,
    state: null,
    ip: null,
    ips: null,
    org: null,
    service_type: null,
    agent: null,
    business_website: null,
    blocked: false,
    driver: {
      current_driver: 'maxmind',
      status: null,
      success: null,
      fail: null,
      raw_data: null,
      attepmts: 0
    }
  }
}
export const mutations = {
  setDriverSuccess(state, success) {
    state.driver.status = true
    state.driver.success = success
    state.driver.raw_data = success
  },
  setDriverFail(state, fail) {
    state.driver.status = false
    state.driver.fail = fail
  },
  setDriverAttemptsIncrement(state) {
    state.driver.attepmts++
  },
  setUserAgent(state, agent) {
    state.agent = agent
  },
  /* Setting Data of Session */
  maxmind(state) {
    state.city = state.driver.raw_data.city.names.en
    state.continent = state.driver.raw_data.continent.names.en
    state.country = state.driver.raw_data.country.names.en
    state.location.lat = state.driver.raw_data.location.latitude
    state.location.long = state.driver.raw_data.location.longitude
    state.time_zone = state.driver.raw_data.location.time_zone
    state.postal = state.driver.raw_data.postal.code
    state.iso_code = state.driver.raw_data.registered_country.iso_code
    state.state = state.driver.raw_data.subdivisions[0].names.en
    state.ip = state.driver.raw_data.traits.ip_address
    state.ips = state.driver.raw_data.traits.isp
    state.org = state.driver.raw_data.traits.organization
    state.service_type = state.driver.raw_data.traits.user_type
    state.business_website = null
  },
  setSession(state, sessionData) {
    state.session_id = sessionData.session_id
    state.session = sessionData
    storageService.setEncrypted('session', sessionData)
  },
  loadSession(state) {
    state.session = storageService.getDecrypted('session')
    if (state.session) state.session_id = state.session.session_id || null
  }
}

export const getters = {
  getDriver(state) {
    return state.driver.current_driver
  },
  getSession(state) {
    return state.session_id
  }
}

export const actions = {
  setData({ commit, dispatch, state }) {
    switch (state.driver.current_driver) {
      case 'maxmind':
        if (state.driver.status) {
          commit('maxmind')
        }
        dispatch('addSession')
        break
      default:
        if (state.driver.status) {
          commit('maxmind')
        }
    }
  },
  setDriverSuccess({ commit }, success) {
    commit('setDriverSuccess', success)
  },
  setDriverFail({ commit }, fail) {
    commit('setDriverFail', fail)
  },
  setUserAgent({ commit }, agent) {
    commit('setUserAgent', agent)
  },
  driverAttemptIncrement({ commit }) {
    commit('setDriverAttemptsIncrement')
  },
  addSession({ commit, dispatch, state }) {
    const reqData = {
      session_data: state.session,
      session_id: state.session_id,
      region: state.continent,
      country: state.country,
      country_code: state.iso_code,
      state: state.state,
      city: state.city,
      zip_code: state.postal,
      iso_code: state.iso_code,
      lat: state.location.lat,
      long: state.location.long,
      postal_code: state.postal,
      area_code: state.postal,
      metro_code: state.postal,
      ip: state.ip,
      visit_count: 1,
      agent: state.agent,
      isp: state.ips,
      org: state.org,
      business_name: state.org,
      business_website: null,
      timezone: state.time_zone,
      raw_data: JSON.stringify(state.driver.raw_data)
    }
    session
      .add(reqData)
      .then((response) => {
        commit('setSession', response.data)
      })
      .catch((err) => {
        console.log(err)
      })
  },
  loadSession({ commit }) {
    commit('loadSession')
  }
}
