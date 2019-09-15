<template>
  <v-row>
    <SessionTracking></SessionTracking>
    <v-col cols="12" class="text-center">
      <h2 v-if="Object.keys(errors).length<=0">Thank you for using FitURL.</h2>
      <h1 v-if="Object.keys(errors).length">{{errors.original_url}}</h1>
      <v-btn
        large
        color="primary"
        rounded
        @click="url_options.skip_ad=1,redirect()"
        v-if="main_url"
      >Skip Ad</v-btn>
    </v-col>
  </v-row>
</template>

<script>
/* eslint-disable */
import { mapGetters, mapActions } from 'vuex'
import Logo from '~/components/Logo.vue'
import SessionTracking from '~/components/SessionTracking.vue'
import SkipAndRedirect from '~/components/SkipAndRedirect.vue'
import repositoryFactory from '~/repository/repositoryFactory'
const shortUrl = repositoryFactory.get('shortUrl')
const visit = repositoryFactory.get('visit')

const REDIRECT_IN = 20000 // mi sec
export default {
  name: 'SkipAndRedirect',
  components: {
    Logo,
    SessionTracking,
    SkipAndRedirect
  },
  data: function() {
    return {
      errors: {},
      main_url: null,
      url_options: {
        master: null,
        skip_ad: 0,
        visited_at: null,
        visit_start: null,
        visit_end: null,
        redirected_at: null,
        invalid_hit: 0
      },
      short_url: null
    }
  },
  computed: {
    ...mapGetters({
      session_id: 'session/getSession'
    })
  },
  mounted() {
    this.getParam()
    let that = this
    this.url_options.visited_at = this.$moment
      .utc()
      .format('YYYY-MM-DD HH:mm:ss')
    this.url_options.visit_start = this.url_options.visited_at
    this.url_options.session_id = this.session_id
    shortUrl
      .find(this.short_url)
      .then((response) => {
        that.main_url = response.data.data.original_url
        setTimeout(that.redirect, REDIRECT_IN)
        if (response.data.data.meta) {
          if (response.data.data.meta.title) {
            window.title = response.data.data.meta.title
          }
        }
        that.updateLog()
      })
      .catch((err) => {
        that.errors = err.response.data.errors
        that.url_options.invalid_hit = 1
        that.updateLog()
        console.log(err)
      })
  },
  methods: {
    ...mapActions({
      showSuccess: 'ui/showSuccessSnackbar',
      showError: 'ui/showErrorSnackbar'
    }),
    getParam() {
      this.short_url = this.$router.history.current.params['id']
    },
    findUrl() {
      let that = this
      that.url_options.session_id = that.session_id
      shortUrl
        .add(that.url_options)
        .then((response) => {})
        .catch((err) => {
          this.errors = err.response.data.errors
          console.log(err)
        })
    },
    redirect() {
      this.url_options.visit_end = this.$moment
        .utc()
        .format('YYYY-MM-DD HH:mm:ss')
      this.updateLog()
      this.redirected_at = this.$moment.utc().format('YYYY-MM-DD HH:mm:ss')
      this.updateLog()
      window.location.replace(this.main_url)
    },
    updateLog() {
      let that = this
      this.url_options.session_id = this.session_id
      visit
        .update(that.url_options)
        .then((response) => {
          this.url_options.master = response.data.data
          console.log(response)
        })
        .catch((err) => {
          console.log(err)
        })
    }
  }
}
</script>

<style>
* {
  font-family: 'ABeeZee', sans-serif;
}
</style>