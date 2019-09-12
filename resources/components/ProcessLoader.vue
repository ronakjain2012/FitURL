<template>
  <v-dialog v-model="loader" max-width="600" persistent>
    <v-card flat color="rgba(255,255,255,0.9)">
      <v-card-text class="text-xs-center">
        <v-progress-linear :height="19" indeterminate rounded ></v-progress-linear>
      </v-card-text>
    </v-card>
  </v-dialog>
</template>

<script>
/* eslint-disable */
import { mapGetters, mapMutations, mapActions } from 'vuex'

export default {
  name: 'ProcessLoader',
  computed: {
    loader: {
      set: function(v) {
        this.hideLoader()
      },
      get: function() {
        return this.$store.state.ui.loader
      }
    }
  },
  methods: {
    ...mapActions({
      hideLoader: 'ui/hideLoader',
      showLoader: 'ui/showLoader'
    })
  }
}
</script>
<style scoped>
.main-font {
  font-family: 'ABeeZee', sans-serif;
}
</style>
