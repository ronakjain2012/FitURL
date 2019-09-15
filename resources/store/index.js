
export const state = () => {
  return {
    app_name:'FitURL'
  };
};

export const mutations = {
  SET_APP_NAME (state, { name }) {
    state.app_name = name
  }
};

export const getters = {
  app_name(state) {
    return state.app_name
  }
}

export const actions = {
  APP_NAME({ commit }, name) {
    commit('SET_APP_NAME',name);
  }
};
