import * as CONST from "@/utils/const.js";
import static_routes from "@/router/static_routes";
import Vue from "vue";

export default {
  state: {
    appConfig: {
      name: "FitURL",
      avatar:
        "https://pluspng.com/img-png/png-logo-design-fancy-png-logo-design-91-on-professional-logo-design-with-png-logo-design-734.png",
      version: "0.0.2",
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
    navigationDraw: false
  },
  mutations: {
    SET_NAVIGATION_DRAW: (state, payload) => {
      state.navigationDraw = payload;
    }
  },
  getters: {
    navigationDraw: state => state.navigationDraw,
    getCurrentLang: state => state.appConfig.currentLang
  }
};
