import * as CONST from "@/utils/const.js";
import static_routes from "@/router/static_routes";
import Vue from "vue";

export default {
  state: {
    appConfig: {
      name: "Exchange",
      logoImg:
        "https://pluspng.com/img-png/png-logo-design-fancy-png-logo-design-91-on-professional-logo-design-with-png-logo-design-734.png",
      version: "0.0.1",
      defaultLang: "en-us",
      currentLang: "en-us",
      availableLangs: [
        {
          text: "English",
          value: "en-us",
          full: {}
        }
      ]
    },
    currentContext: {
      root: true,
      user: false,
      company: false
    },
    currentUser: {},
    currentCompany: {},
    availableUsers: [],
    availableCompanies: [],
    showUserPicker: false,
    showCompanyPicker: false,
    showAction: false,
    routeList: [],
    startPage: "/",
    initAuthDone: false,
    initMenuLoadDone: false,
    permissions: []
  },
  mutations: {
  },
  getters: {
    getContextUser: state => state.currentUser,
    getAppConfig: state => state.appConfig,
    getAppName: state => state.appConfig.name,
    getAppLogo: state => state.appConfig.avatar,
    getAppVersion: state => state.appConfig.version,
    getDefaultLang: state => state.appConfig.defaultLang,
    getCurrentLang: state => state.appConfig.currentLang,
    getAvailableLangs: state => state.appConfig.availableLangs
  }
};
