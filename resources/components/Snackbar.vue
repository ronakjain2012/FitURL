<template>
  <v-snackbar
    v-model="snackbarObj"
    :bottom="snackbar.y === 'bottom'"
    :color="snackbar.color"
    :left="snackbar.x === 'left'"
    :multi-line="snackbar.multiline"
    :right="snackbar.x === 'right'"
    :timeout="snackbar.timeout"
    :top="snackbar.y === 'top'"
    :vertical="snackbar.mode === 'vertical'"
  >
    {{ snackbar.text }}
    <v-btn dark text @click="hideSnackbar()">Close</v-btn>
  </v-snackbar>
</template>

<script>
/* eslint-disable */
import { mapGetters, mapMutations, mapActions } from 'vuex'

export default {
  name: 'Snackbar',
  computed: {
    ...mapGetters({
      snackbar: 'ui/getSnackbar'
    }),
    snackbarObj: {
      set: function(v) {
        this.hideSnackbar()
      },
      get: function() {
        return this.$store.state.ui.snackbar.show
      }
    }
  },
  methods: {
    ...mapActions({
      hideSnackbar: 'ui/hideSnackbar',
      showSnackbar: 'ui/showSnackbar'
    })
  }
}
</script>
<style scoped>
* {
  font-family: 'ABeeZee', sans-serif;
  font-weight: 600;
}
</style>
