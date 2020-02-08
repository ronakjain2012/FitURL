<template>
  <div class="ui-header">
    <v-app-bar color="primary" class="ui-header-bar" dark elevation="0">
      <router-link to="login" color="color-text">
        <v-img
          :src="getAppLogo"
          lazy-src="https://pluspng.com/img-png/png-logo-design-fancy-png-logo-design-91-on-professional-logo-design-with-png-logo-design-734.png"
          max-width="50"
          max-height="50"
        ></v-img>
      </router-link>
      <v-toolbar-title>
        <router-link to="/" class="title-main color-text--text">{{getAppName}}</router-link>
      </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-menu left>
        <template v-slot:activator="{ on }">
          <v-btn text v-on="on" color="color-text">
            {{getCurrentLang}}
            <v-icon color="color-text">mdi-translate</v-icon>
          </v-btn>
        </template>

        <v-list>
          <v-list-item v-for="n in 5" :key="n" @click="() => {}">
            <v-list-item-title>Option {{ n }}</v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu>
      <v-switch color="color-text" :ripple="false" v-model="$vuetify.theme.dark" hide-details inset>
        <template v-slot:label>
          <div class="color-text--text">Dark Mode</div>
        </template>
      </v-switch>
    </v-app-bar>
    <UiTopMenu></UiTopMenu>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
import UiTopMenu from './UiTopMenu';
import light from "@/plugins/light";
import dark from "@/plugins/dark";

function hexToRgb(in_hex) {
  return in_hex;
  var hex = in_hex.replace("#", "");
  var arrBuff = new ArrayBuffer(4);
  var vw = new DataView(arrBuff);
  vw.setUint32(0, parseInt(hex, 16), false);
  var arrByte = new Uint8Array(arrBuff);

  return arrByte[1] + "," + arrByte[2] + "," + arrByte[3];
}

export default {
  name: "UiHeader",
  computed: {
    ...mapGetters([
      "getAppName",
      "getAppLogo",
      "getAppVersion",
      "getDefaultLang",
      "getCurrentLang",
      "getAvailableLangs"
    ])
  },
  mounted() {
    window.document.title = this.$route.meta.title;
    this.setLightMode();
  },
  components:{UiTopMenu},
  methods: {
    setLightMode: function() {
      for (var item of Object.keys(light)) {
        document.documentElement.style.setProperty(
          "--" + item,
          hexToRgb(light[item])
        );
        document.documentElement.style.setProperty(
          "--v-primary-base",
          light["color-main"]
        );
        document.documentElement.style.setProperty(
          "--v-accent-base",
          light["color-main"]
        );
        document.documentElement.style.setProperty(
          "--v-error-base",
          light["color-warning"]
        );
      }
    },
    setDarkMode: function() {
      for (var item of Object.keys(dark)) {
        document.documentElement.style.setProperty(
          "--" + item,
          hexToRgb(dark[item])
        );
        document.documentElement.style.setProperty(
          "--v-primary-base",
          dark["color-main"]
        );
        document.documentElement.style.setProperty(
          "--v-accent-base",
          dark["color-main"]
        );
        document.documentElement.style.setProperty(
          "--v-error-base",
          dark["color-warning"]
        );
      }
    }
  },
  watch: {
    $route(toRoute) {
      window.document.title = toRoute.meta.title;
    },
    "$vuetify.theme.dark": function(newValue) {
      if (newValue) {
        this.setDarkMode();
      } else {
        this.setLightMode();
      }
    }
  }
};
</script>

<style lang="scss">
.v-application {
  a.color-text {
    color: $color-text;
  }
}
.v-input--switch__thumb {
  color: $color-main !important;
}
.v-input--switch__track {
  color: $color-secondary !important;
}
</style>