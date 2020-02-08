<template>
  <div class="ex-ui-sidebar">
    <v-container class="text-center">
      <v-row>
        <v-col justify="center" align="center">
          <div class="ex-img-circle align-center">
            <v-img
              class="ex-image-circle text-center"
              src="https://mir-s3-cdn-cf.behance.net/project_modules/1400_opt_1/e994b191090889.5e28889a2000d.jpg"
              lazy-src="logo.png"
              max-width="150"
              max-height="150"
              aspect-ratio="1"
            ></v-img>
          </div>
        </v-col>
      </v-row>
      <v-row>
        <v-col justify="center" align="center" class="white--text">{{userName}} ({{userEmail}})</v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "UiSidebar",
  computed: {
    ...mapGetters([
      "getAppName",
      "getAppLogo",
      "getAppVersion",
      "getDefaultLang",
      "getCurrentLang",
      "getAvailableLangs",
      "userName",
      "userEmail"
    ])
  }
};
</script>

<style lang="scss">
.ex-image-circle {
  border-radius:50%;
  vertical-align: middle;
}
.ex-img-circle .v-image {
  border: 2px dashed white
}
</style>