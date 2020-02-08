import * as CONST from "@/utils/const.js";
export default {
  state: {
    baseURL: "http://localhost:8000/api/",
    progress: false,
    progressCount: 0,
    progressFailCount: 0,
    progressPage: false,
    progressPageCount: 0,
    progressFailPageCount: 0
  },
  actions: {
    showProgressBar({ commit }) {
      commit("SHOW_PROGRESS");
    },
    failProgressBar({ commit }) {
      commit("SHOW_PROGRESS");
    },
    hideProgressBar({ commit }) {
      commit("HIDE_PROGRESS");
    }
  },
  mutations: {
    HIDE_PROGRESS: state => {
      state.progressCount--;
      if (state.progressCount == 0) {
        state.progress = false;
      }
    },
    SHOW_PROGRESS: state => {
      state.progress = true;
      state.progressCount++;
    },
    FAIL_PROGRESS: state => {
      state.progressFailCount++;
    },
  },
  getters: {
    baseURL: state => state.baseURL,
    register_url: (state, getters) => `${state.baseURL}auth/register`,
    login_url: (state, getters) => `${state.baseURL}auth/login`,
    logout_url: (state, getters) => `${state.baseURL}auth/logout`,
    refresh_token_url: (state, getters) => `${state.baseURL}auth/refresh`,
    reset_pass_url: (state, getters) => `${state.baseURL}auth/reset_password`,
    forgot_pass_url: (state, getters) => `${state.baseURL}auth/forgot_password`,
    logging_url: (state, getters) => `${state.baseURL}logging`,
    ui_menu_url: (state, getters) =>
      `${state.baseURL}menu${getters.contextUrl}`,
    progressStatus: state => state.progress,
    progressCount: state => state.progressCount,
    progressFail: state => state.progressFailCount,
    contextUrl: (state,getters)=>{
      if(getters.getCurrentContext==CONST.COMPANY_CONTEXT){
        return `/${getters.getContextUserID}/${getters.getContextCompanyID}`;
      }else if(getters.getCurrentContext==CONST.USER_CONTEXT) {
        return `/${getters.getContextUserID}`;
      } else {
        return ``;
      }
    },
  }
};
