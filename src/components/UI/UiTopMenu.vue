<template>
  <div class="top-header text-center"> 
    <v-menu :close-on-content-click="false" :nudge-width="200" nudge-bottom open-on-hover offset-y>
      <template v-slot:activator="{ on }">
        <v-btn class="main-items" x-large v-on="on" depressed tile text>
          <span class="main-items-title">Features</span>
        </v-btn>
      </template>
      <v-card flat text elevation="0">
        <v-list dense>
          <v-list-item>
            <v-list-item-icon>
              <v-icon>mdi-link</v-icon>
            </v-list-item-icon>
            <v-list-item-content class="text-left align-self-start">
              <v-list-item-title>Link Managment</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item>
            <v-list-item-icon>
              <v-icon>mdi-google-circles-extended</v-icon>
            </v-list-item-icon>
            <v-list-item-content class="text-left align-self-start">
              <v-list-item-title>Colleboration</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item>
            <v-list-item-icon>
              <v-icon>mdi-equalizer-outline</v-icon>
            </v-list-item-icon>
            <v-list-item-content class="text-left align-self-start">
              <v-list-item-title>Traffic Routing</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item>
            <v-list-item-icon>
              <v-icon>mdi-chart-line</v-icon>
            </v-list-item-icon>
            <v-list-item-content class="text-left align-self-start">
              <v-list-item-title>Analytics</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item>
            <v-list-item-icon>
              <v-icon>mdi-monitor</v-icon>
            </v-list-item-icon>
            <v-list-item-content class="text-left align-self-start">
              <v-list-item-title>Sales and Markting</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item>
            <v-list-item-icon>
              <v-icon>mdi-piggy-bank</v-icon>
            </v-list-item-icon>
            <v-list-item-content class="text-left align-self-start">
              <v-list-item-title>Reffer and Earn</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-card>
    </v-menu>

    <router-link to="/home">
      <v-btn x-large class="main-items" v-on="on" depressed tile text>
        <span class="main-items-title">Pricing</span>
      </v-btn>
    </router-link>

    <v-menu :close-on-content-click="false" :nudge-width="200" nudge-bottom open-on-hover offset-y>
      <template v-slot:activator="{ on }">
        <v-btn x-large class="main-items" v-on="on" depressed tile text>
          <span class="main-items-title">Intigrations</span>
        </v-btn>
      </template>
      <v-card flat text elevation="0">
        <v-list dense>
          <v-list-item>
            <v-list-item-icon>
              <v-icon>mdi-api</v-icon>
            </v-list-item-icon>
            <v-list-item-content class="text-left align-self-start">
              <v-list-item-title>APIs for Developers</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item>
            <v-list-item-icon>
              <v-icon>mdi-slack</v-icon>
            </v-list-item-icon>
            <v-list-item-content class="text-left align-self-start">
              <v-list-item-title>Slack</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item>
            <v-list-item-icon>
              <v-icon>mdi-message-processing</v-icon>
            </v-list-item-icon>
            <v-list-item-content class="text-left align-self-start">
              <v-list-item-title>Email & SMS</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item>
            <v-list-item-icon>
              <v-icon>mdi-send</v-icon>
            </v-list-item-icon>
            <v-list-item-content class="text-left align-self-start">
              <v-list-item-title>Telegram</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-card>
    </v-menu>

    <v-menu :close-on-content-click="false" :nudge-width="200" nudge-bottom open-on-hover offset-y>
      <template v-slot:activator="{ on }">
        <v-btn x-large class="main-items" v-on="on" depressed tile text>
          <span class="main-items-title">Dashboard</span>
        </v-btn>
      </template>
      <v-card flat text elevation="0">
        <v-list dense>
          <v-list-item>
            <v-list-item-icon>
              <v-icon>mdi-account</v-icon>
            </v-list-item-icon>
            <v-list-item-content class="text-left align-self-start">
              <v-list-item-title>Login</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item>
            <v-list-item-icon>
              <v-icon>mdi-account-multiple-plus-outline</v-icon>
            </v-list-item-icon>
            <v-list-item-content class="text-left align-self-start">
              <v-list-item-title>Sign Up</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-card>
    </v-menu>

    <v-menu :close-on-content-click="false" :nudge-width="200" nudge-bottom open-on-hover offset-y>
      <template v-slot:activator="{ on }">
        <v-btn x-large class="main-items" v-on="on" depressed tile text>
          <span class="main-items-title">Company</span>
        </v-btn>
      </template>
      <v-card flat text elevation="0">
        <v-list dense>
          <v-list-item>
            <v-list-item-icon>
              <v-icon>mdi-help</v-icon>
            </v-list-item-icon>
            <v-list-item-content class="text-left align-self-start">
              <v-list-item-title>Why FitURL?</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item>
            <v-list-item-icon>
              <v-icon>mdi-api</v-icon>
            </v-list-item-icon>
            <v-list-item-content class="text-left align-self-start">
              <v-list-item-title>API Intigrations</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
          <v-list-item>
            <v-list-item-icon>
              <v-icon>mdi-face-agent</v-icon>
            </v-list-item-icon>
            <v-list-item-content class="text-left align-self-start">
              <v-list-item-title>Support</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-card>
    </v-menu>

    <router-link to="/home">
      <v-btn x-large class="main-items" v-on="on" depressed tile text>
        <v-icon left>mdi-gift-outline</v-icon>
        <span class="main-items-title">Donate</span>
      </v-btn>
    </router-link>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "UiTopMenu",
  data: () => ({
    on:null
  }),
  computed: {}
};
</script>


<style lang="scss">
.top-header {
  background-color: $color-secondary;
  .main-items {
    background-color: $color-secondary;
    margin-right: 1rem;
    margin-left: 1rem;
    &-title,
    i.v-icon {
      color: var(--color-text-invert);
    }
  }
  a {
    text-decoration: none;
  }
}
.v-list-item {
  align-content: flex-start;
  i.v-icon {
    color: var(--color-text);
  }
}
.v-menu__content {
  /* box-shadow: none !important; */
  background-color: $color-secondary !important;
}
</style>