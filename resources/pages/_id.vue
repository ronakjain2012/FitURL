<template>
  <v-layout row wrap justify-center align-center>
    <SessionTracking></SessionTracking>
    <v-flex xs12 sm12 md12>
      <div class="text-center">
        <logo />
      </div>
    </v-flex>
    <v-flex xs12 sm12 md12 class="main-font">
      donbe
    </v-flex>

  </v-layout>
</template>

<script>
/* eslint-disable */
import Logo from '~/components/Logo.vue'
import SessionTracking from '~/components/SessionTracking.vue'
import CopyToClipboard from '~/components/CopyToClipboard.vue'

import { mapGetters, mapActions } from 'vuex'
import repositoryFactory from '~/repository/repositoryFactory'
import storageService from '~/storageService/ls'

const shortUrl = repositoryFactory.get('shortUrl')
export default {
  name: 'index',
  components: {
    Logo,
    SessionTracking,
    CopyToClipboard
  },
  data: function() {
    return {
      rules: [
        (value) => !!value || 'Required.',
        (value) => (value || '').length <= 2000 || 'Max 2000 characters',
        (value) => {
          const pattern = /^(?:([A-Za-z]+):)?(\/{0,3})([0-9.\-A-Za-z]+)(?::(\d+))?(?:\/([^?#]*))?(?:\?([^#]*))?(?:#(.*))?$/
          return pattern.test(value) || 'Invalid URL.'
        }
      ],
      errors: {},
      url_options: {
        special_url: null,
        short_url: null,
        original_url: null,
        expire_date: null,
        expire_time: null,
        user_name: null,
        user_email: null,
        user_mobile: null,
        display_ads: 1,
        analytic_report: 0
      },
      datepicker: false,
      timepicker: false,
      showAdvance: false,
      ui: {
        showLinks: false,
        links: []
      }
    }
  },
  computed: {
    ...mapGetters({
      api_url: 'api/ApiUrl',
      session_id: 'session/getSession'
    }),
    showLinkInBox() {
      return this.ui.links.length > 1
    },
    haveLinks() {
      return this.ui.links.length > 0
    }
  },
  mounted() {
    /**
     * Set User data from ls
     */
    if (storageService.has('n')) {
      this.url_options.user_name = storageService.getDecrtpted('n')
    }
    if (storageService.has('m')) {
      this.url_options.user_mobile = storageService.getDecrtpted('m')
    }
    if (storageService.has('e')) {
      this.url_options.user_email = storageService.getDecrtpted('e')
    }
  },
  methods: {
    ...mapActions({
      showSuccess: 'ui/showSuccessSnackbar',
      showError: 'ui/showErrorSnackbar'
    }),
    resetMainFields() {
      this.url_options.special_url = null
      this.url_options.short_url = null
      this.url_options.original_url = null
      this.url_options.expire_date = null
      this.url_options.expire_time = null
    },
    shoutUrl() {
      let that = this
      that.url_options.session_id = that.session_id
      shortUrl
        .add(that.url_options)
        .then((response) => {
          that.showSuccess(response.data.message)
          /**
           * Manage Some Local Data related to user
           */
          if (
            response.data.data != undefined &&
            response.data.data.urls != undefined
          ) {
            response.data.data.urls.forEach((element) => {
              that.ui.links.push(element)
            })
          }
          if (that.url_options.user_name) {
            storageService.setEncrypted('n', that.url_options.user_name)
          }
          if (that.url_options.user_mobile) {
            storageService.setEncrypted('m', that.url_options.user_mobile)
          }
          if (that.url_options.user_email) {
            storageService.setEncrypted('e', that.url_options.user_email)
          }
          that.ui.showLinks = true
          that.resetMainFields()
        })
        .catch((err) => {
          this.errors = err.response.data.errors
          console.log(err)
        })
    }
  }
}
</script>

<style>
.main-font {
  font-family: 'ABeeZee', sans-serif;
}
</style>
