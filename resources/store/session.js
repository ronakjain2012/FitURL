import storageService from '~/storageService/ls'
export const state = () => {
  return {
    session:null,
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
  }
  /* Setting Data of Session */
}

export const getters = {
  getDriver(state) {
    return state.driver.current_driver
  }
}

export const actions = {
  setData({ commit, dispatch, state }) {
    switch (state.driver.current_driver) {
      case 'maxmind':
        console.log(state.driver.raw_data)
        if (state.driver.status) {
          // state.city = state.driver.raw_data.city.names.en
          // state.continent = state.driver.raw_data.continent.names.en
          // state.country = state.driver.raw_data.country.names.en
          // state.location.lat = state.driver.raw_data.location.latitude
          // state.location.long = state.driver.raw_data.location.longitude
          // state.time_zone = state.driver.raw_data.location.time_zone
          // state.postal = state.driver.raw_data.postal.code
          // state.iso_code = state.driver.raw_data.registered_country.iso_code
          // state.state = state.driver.raw_data.subdivisions[0].names.en
          // state.ip = state.driver.raw_data.traits.ip_address
          // state.ips = state.driver.raw_data.traits.isp
          // state.org = state.driver.raw_data.traits.organization
          // state.service_type = state.driver.raw_data.traits.user_type
          // state.business_website = state.driver.raw_data.traits.user_type
        }
        dispatch('addSession')
        break
      default:
    }
  },
  setDriverSuccess({ commit }, success) {
    commit('setDriverSuccess', success)
  },
  setDriverFail({ commit }, fail) {
    commit('setDriverFail', fail)
  },
  driverAttemptIncrement({ commit }) {
    commit('setDriverAttemptsIncrement')
  },
  addSession({ commit, dispatch, state }) {
    // const session = storageService.getDecrtpted('session')
    console.log(storageService.getDecrtpted('session'))
  }
}
