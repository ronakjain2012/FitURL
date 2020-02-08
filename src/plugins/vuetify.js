import Vue from "vue";
import Vuetify from "vuetify/lib";
import light from "./light";
import dark from "./dark";

Vue.use(Vuetify);
const opts = {
  iconfont: "mdi",
  theme: {
    themes: {
      light: light,
      dark: dark
    }
  },
  options: {
    customProperties: true
  }
};

export default new Vuetify(opts);