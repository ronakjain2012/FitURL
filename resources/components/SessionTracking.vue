<template>
  <div v-show="false">User Info</div>
</template>

<script>
/* eslint-disable */
import { mapGetters, mapActions } from 'vuex'
import { async } from 'q'

export default {
  mounted() {
    /**
     * Get Driver and call respective api
     */
    switch (this.driver) {
      case 'maxmind':
        geoip2.insights(
          async (success) => {
            await this.$store.dispatch('session/setDriverSuccess', success)
            await this.$store.dispatch('session/driverAttemptIncrement')
            await this.$store.dispatch('session/setData')
          },
          (error) => {
            this.$store.dispatch('session/setDriverFail', error)
            this.$store.dispatch('session/driverAttemptIncrement')
          }
        )
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

