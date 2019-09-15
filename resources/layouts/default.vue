<template>
  <v-app>
    <v-app-bar color="deep-purple accent-4 main-font" absolute>
      <v-img class="logo-style" src="favicon.ico" max-height="45" max-width="45" />
      <v-toolbar-title class="white--text main-font">Fit URL</v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-items class="d-none d-lg-block">
        <v-btn text color="white" to="/" class="margin-right-15" nuxt>Home</v-btn>
        <!-- <v-btn text color="white" to="/fit/apis" class="margin-right-15" nuxt>APIs</v-btn>
        <v-btn text color="white" to="/fit/reports" class="margin-right-15" nuxt>Reports</v-btn>
        <v-btn text color="white" to="/fit/contact" class="margin-right-15" nuxt>Helping Hand</v-btn> -->
      </v-toolbar-items>
      <!-- <v-menu left bottom class="main-font">
        <template v-slot:activator="{ on }">
          <v-btn icon v-on="on" class="d-none d-lg-block">
            <v-icon class="white--text">mdi-dots-vertical</v-icon>
          </v-btn>
        </template>
        <v-list subheader>
          <v-list-item link>
            <v-list-item-icon>
              <v-icon>attachment</v-icon>
            </v-list-item-icon>
            <v-list-item-title>Terms & Conditions</v-list-item-title>
          </v-list-item>
          <v-list-item link>
            <v-list-item-icon>
              <v-icon>ring_volume</v-icon>
            </v-list-item-icon>
            <v-list-item-title>Contact Us</v-list-item-title>
          </v-list-item>
          <v-list-item link>
            <v-list-item-icon>
              <v-icon>bug_report</v-icon>
            </v-list-item-icon>
            <v-list-item-title>Report a bug</v-list-item-title>
          </v-list-item>
          <v-list-item link>
            <v-list-item-icon>
              <v-icon>business</v-icon>
            </v-list-item-icon>
            <v-list-item-title>About</v-list-item-title>
          </v-list-item>
        </v-list>
      </v-menu> -->
    </v-app-bar>
    <v-content>
      <v-container class="padding-app">
        <nuxt />
      </v-container>
      <!-- APP UI elements -->
      <ProcessLoader></ProcessLoader>
      <Snackbar></Snackbar>
      <Dialog></Dialog>
    </v-content>
    <v-footer padless fixed>
      <v-bottom-navigation color="deep-purple accent-4" class="hidden-lg-and-up">
        <v-btn>
          <span class="main-font">Home</span>
          <v-icon>beach_access</v-icon>
        </v-btn>
        <!-- <v-btn>
          <span class="main-font">APIs</span>
          <v-icon>repeat</v-icon>
        </v-btn>
        <v-btn>
          <span class="main-font">Helping Hand</span>
          <v-icon>sentiment_very_satisfied</v-icon>
        </v-btn>
        <v-menu class="main-font">
          <template v-slot:activator="{ on }">
            <v-btn icon v-on="on">
              <v-icon>mdi-dots-vertical</v-icon>
            </v-btn>
          </template>
          <v-list subheader>
            <v-list-item link>
              <v-list-item-icon>
                <v-icon>attachment</v-icon>
              </v-list-item-icon>
              <v-list-item-title>Terms & Conditions</v-list-item-title>
            </v-list-item>
            <v-list-item link>
              <v-list-item-icon>
                <v-icon>ring_volume</v-icon>
              </v-list-item-icon>
              <v-list-item-title>Contact Us</v-list-item-title>
            </v-list-item>
            <v-list-item link>
              <v-list-item-icon>
                <v-icon>bug_report</v-icon>
              </v-list-item-icon>
              <v-list-item-title>Report a bug</v-list-item-title>
            </v-list-item>
            <v-list-item link>
              <v-list-item-icon>
                <v-icon>business</v-icon>
              </v-list-item-icon>
              <v-list-item-title>About</v-list-item-title>
            </v-list-item>
          </v-list>
        </v-menu> -->
      </v-bottom-navigation>
    </v-footer>
  </v-app>
</template>

<script>
/* eslint-disable */
import { mapGetters, mapMutations, mapState, mapActions } from 'vuex'
import ProcessLoader from '~/components/ProcessLoader.vue'
import Snackbar from '~/components/Snackbar.vue'
import Dialog from '~/components/Dialog.vue'

export default {
  components: {
    Dialog,
    Snackbar,
    ProcessLoader
  },
  data() {
    return {
      page: {
        title: 'FitURL'
      }
    }
  }
}
</script>
<style scoped>
.main-font {
  font-family: 'ABeeZee', sans-serif;
}
.secondary-font {
  font-family: 'Anton', sans-serif;
}
.padding-app {
  padding-top: 6.5rem;
}
.margin-right-15 {
  margin-right: 15px;
}
.logo-style {
  border-radius: 50%;
  padding: 10px;
  margin: 5px;
  margin-right: 15px;
}
div.container.padding-app {
  padding-right: 50px;
  padding-left: 50px;
}
</style>
