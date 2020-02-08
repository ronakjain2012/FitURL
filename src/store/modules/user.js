import axios from '@/utils/axiosR'

export default {
  state: {
    user: {},
    userName: "",
    userEmail: "",
    userAdmin: "",
    userId: "",
    userLastUpdate: "",
    userLogin: false,
    token: null
  },
  actions: {
    setUserData({ commit, dispatch }, userData) {
      commit("SET_USER", userData);
      commit("SET_USER_TOKEN", userData.token);
      commit("SET_USER_NAME", userData.name);
      commit("SET_USER_EMAIL", userData.email);
      commit("SET_USER_ADMIN", userData.admin);
      commit("SET_USER_ID", userData._id);
      commit("SET_USER_LAST_UPDATE", userData.updated_at);
      dispatch("setUserLoginStatus", true);
    },
    setUserLoginStatus({ commit }, status) {
      if (status === true) {
        commit("SET_USER_LOGIN_STATUS", status);
      } else {
        commit("SET_USER_LOGIN_STATUS", false);
        commit("SET_USER_TOKEN", null);
      }
    }
  },
  mutations: {
    SET_USER: (state, payload) => {
      state.user = payload;
    },
    SET_USER_NAME: (state, payload) => {
      state.userName = payload;
    },
    SET_USER_EMAIL: (state, payload) => {
      state.userEmail = payload;
    },
    SET_USER_ADMIN: (state, payload) => {
      state.userAdmin = payload;
    },
    SET_USER_ID: (state, payload) => {
      state.userId = payload;
    },
    SET_USER_LAST_UPDATE: (state, payload) => {
      state.userLastUpdate = payload;
    },
    SET_USER_LOGIN_STATUS: (state, payload) => {
      state.userLogin = payload;
    },
    SET_USER_TOKEN: (state, payload) => {
      state.token = payload;
      if(payload) {
        localStorage.setItem("token", payload);
        axios.defaults.headers = {
          Authorization: "Bearer " + payload,
          Accept: "application/json",
          responseType: "json"
        };
      } else {
        localStorage.removeItem("token");
      }
    }
  },
  getters: {
    userName: state => state.userName,
    isLogin: state => state.userLogin,
    userEmail: state => state.userEmail,
    userAdmin: state => state.userAdmin,
    userToken: state => state.token,
    userLocalToken: (state, dispatch) => {
      if (state.token === localStorage.getItem("token")) return state.token;
      else dispatch("setUserLoginStatus", false);
    },
    userId: state => state.userId,
    user: state => state.user,
    token: () => localStorage.getItem('token'),
    isLoggedin: (state,getters)=>{
      if(state.userLogin && getters.initAuthDone){
        return true;
      }
      return false;
    }
  }
};
