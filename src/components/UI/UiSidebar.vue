<template>
  <v-navigation-drawer v-model="drawer" absolute temporary right class="color-text--text" >
    <v-list>
      <v-list-item>
        <v-list-item-title class="color-text--text">
          <router-link class="color-text--text" to="/">Home</router-link>
        </v-list-item-title>
      </v-list-item>
      <v-list-group  no-action >
        <template v-slot:activator>
          <v-list-item-title class="color-text--text">Features</v-list-item-title>
        </template>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-link</v-icon>
          </v-list-item-icon>
          <v-list-item-content class="text-left align-self-start">
            <v-list-item-title class="color-text--text">Link Managment</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-google-circles-extended</v-icon>
          </v-list-item-icon>
          <v-list-item-content class="text-left align-self-start">
            <v-list-item-title class="color-text--text">Colleboration</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-equalizer-outline</v-icon>
          </v-list-item-icon>
          <v-list-item-content class="text-left align-self-start">
            <v-list-item-title class="color-text--text">Traffic Routing</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-chart-line</v-icon>
          </v-list-item-icon>
          <v-list-item-content class="text-left align-self-start">
            <v-list-item-title class="color-text--text">Analytics</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-monitor</v-icon>
          </v-list-item-icon>
          <v-list-item-content class="text-left align-self-start">
            <v-list-item-title class="color-text--text">Sales and Markting</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-piggy-bank</v-icon>
          </v-list-item-icon>
          <v-list-item-content class="text-left align-self-start">
            <v-list-item-title class="color-text--text">Reffer and Earn</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list-group>
      <v-list-item>
        <v-list-item-title class="color-text--text">
          <router-link class="color-text--text" to="/">Pricing</router-link>
        </v-list-item-title>
      </v-list-item>
      <v-list-group  no-action>
        <template v-slot:activator>
          <v-list-item-title class="color-text--text">Intigrations</v-list-item-title>
        </template>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-api</v-icon>
          </v-list-item-icon>
          <v-list-item-content class="text-left align-self-start">
            <v-list-item-title class="color-text--text">APIs for Developers</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-slack</v-icon>
          </v-list-item-icon>
          <v-list-item-content class="text-left align-self-start">
            <v-list-item-title class="color-text--text">Slack</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-message-processing</v-icon>
          </v-list-item-icon>
          <v-list-item-content class="text-left align-self-start">
            <v-list-item-title class="color-text--text">Email & SMS</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-send</v-icon>
          </v-list-item-icon>
          <v-list-item-content class="text-left align-self-start">
            <v-list-item-title class="color-text--text">Telegram</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list-group>
      <v-list-group  no-action>
        <template v-slot:activator>
          <v-list-item-title class="color-text--text">Dashboard</v-list-item-title>
        </template>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-account</v-icon>
          </v-list-item-icon>
          <v-list-item-content class="text-left align-self-start">
            <v-list-item-title class="color-text--text">Login</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-account-multiple-plus-outline</v-icon>
          </v-list-item-icon>
          <v-list-item-content class="text-left align-self-start">
            <v-list-item-title class="color-text--text">Sign Up</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list-group>
      <v-list-group  no-action>
        <template v-slot:activator>
          <v-list-item-title class="color-text--text">Company</v-list-item-title>
        </template>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-help</v-icon>
          </v-list-item-icon>
          <v-list-item-content class="text-left align-self-start">
            <v-list-item-title class="color-text--text">Why FitURL?</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-api</v-icon>
          </v-list-item-icon>
          <v-list-item-content class="text-left align-self-start">
            <v-list-item-title class="color-text--text">API Intigrations</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
        <v-list-item>
          <v-list-item-icon>
            <v-icon>mdi-face-agent</v-icon>
          </v-list-item-icon>
          <v-list-item-content class="text-left align-self-start">
            <v-list-item-title class="color-text--text">Support</v-list-item-title>
          </v-list-item-content>
        </v-list-item>
      </v-list-group>
      <v-list-item>
        <v-list-item-title class="color-text--text">
          <router-link class="color-text--text" to="/">Donate</router-link>
        </v-list-item-title>
      </v-list-item>
    </v-list>
  </v-navigation-drawer>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "UiSidebar",
  computed: {
    ...mapGetters(["navigationDraw"]),
    drawer: {
      set: function(val) {
        this.$store.commit("SET_NAVIGATION_DRAW", val);
      },
      get: function() {
        return this.navigationDraw;
      }
    }
  }
};
</script>

<style lang="scss">
.ex-image-circle {
  border-radius: 50%;
  vertical-align: middle;
}
.ex-img-circle .v-image {
  border: 2px dashed white;
}
</style>