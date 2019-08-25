import security from '@/security/substitution'
export const state = () => {
  return {
    session_id: null,
    city: null,
    continent: null,
    country: null,
    location: null,
    time_zone: null,
    postal: null,
    registered_country: null,
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
      attepmts:0
    }
  }
}
export const mutations = {
  setDriverSuccess(state,success) {
    state.driver.status = true
    state.driver.success = success
    state.driver.raw_data = success
  },
  setDriverFail(state,fail) {
    state.driver.status = false
    state.driver.fail = fail
  },
  setDriverAttemptsIncrement(state){
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
  setData({ commit, state },data) {
    switch(state.driver.current_driver) {
      case 'maxmid':

      break;
      default:

    }
  },
  setDriverSuccess({commit},success){
    commit('setDriverSuccess',success)
  },
  setDriverFail({commit},fail){
    commit('setDriverFail',fail)
  },
  driverAttemptIncrement({commit}){
    commit('setDriverAttemptsIncrement')
  }
}
