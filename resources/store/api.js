export const state = () => {
  return {
    api_url:process.env.API_URL
  }
}

export const mutations = {
  SetApiUrl(state, url) {
    state.api_url = url
  }
}

export const getters = {
  ApiUrl(state) {
    return state.api_url
  }
}

export const actions = {}
