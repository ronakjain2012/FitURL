<template>
  <div v-show="false">User Info</div>
</template>

<script>
/* eslint-disable */
import { mapGetters, mapActions } from 'vuex'
import storageService from '~/storageService/ls'

export default {
  mounted() {
    /**
     * Get Driver and call respective api
     */
    this.$store.dispatch('session/loadSession')
    switch (this.driver) {
      case 'maxmind':
        try {
          geoip2.insights(
            async (success) => {
              await this.$store.dispatch('session/setDriverSuccess', success)
            },
            (error) => {
              this.$store.dispatch('session/setDriverFail', error)
            }
          )
        } catch (err) {
          console.log(err)
        } finally {
          this.$store.dispatch('session/setUserAgent', navigator.userAgent)
          this.$store.dispatch('session/driverAttemptIncrement')
          this.$store.dispatch('session/setData')
        }
        break
      default:
    }
  },
  data: function() {
    return {
      api: null
    }
  },
  methods: {},
  computed: {
    ...mapGetters({
      driver: 'session/getDriver'
    })
  }
}
</script>

