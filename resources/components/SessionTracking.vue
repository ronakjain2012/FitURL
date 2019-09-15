<template>
  <div v-show="false">User Info</div>
</template>

<script>
/* eslint-disable */
import { mapGetters, mapActions } from 'vuex'
import storageService from '~/storageService/ls'

export default {
  name: 'SessionTracking',
  mounted() {
    /**
     * Get Driver and call respective api
     */
    this.$store.dispatch('session/loadSession')
    let that = this
    switch (this.driver) {
      case 'maxmind':
        try {
          geoip2.insights(
            async (success) => {
              await this.$store.dispatch('session/setDriverSuccess', success)
              that.dispatchMethod()
            },
            async (error) => {
              await this.$store.dispatch('session/setDriverFail', error)
              that.dispatchMethod()
            }
          )
        } catch (err) {
          console.log(err)
        }
        break
      default:
    }
  },
  computed: {
    ...mapGetters({
      driver: 'session/getDriver'
    })
  },
  methods: {
    dispatchMethod() {
      this.$store.dispatch('session/setUserAgent', window.navigator.userAgent)
      this.$store.dispatch('session/driverAttemptIncrement')
      this.$store.dispatch('session/setData')
    }
  }
}
</script>

