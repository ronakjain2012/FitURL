<template>
  <div class="text-center">
    <v-dialog v-model="dialogObj" width="500" v-if="dialog.showCloseOnly">
      <v-card>
        <v-card-title class="headline grey lighten-2" primary-title>{{dialog.title}}</v-card-title>
        <v-card-text>{{dialog.content}}</v-card-text>
        <v-divider></v-divider>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="primary" text @click="dialogObj = false">Close</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
    <v-dialog v-model="dialogObj" width="500" v-if="dialog.showConfirm">
      <v-card>
        <v-card-title class="headline">{{dialog.title}}</v-card-title>
        <v-card-text>{{dialog.content}}</v-card-text>
        <v-card-actions>
          <v-spacer></v-spacer>
          <v-btn color="green darken-1" text @click="dialogAction(false)">Disagree</v-btn>
          <v-btn color="green darken-1" text @click="dialogAction(true)">Agree</v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
/* eslint-disable */
import { mapGetters, mapActions } from 'vuex'

export default {
  computed: {
    ...mapGetters({
      dialog: 'ui/getDialog'
    }),
    dialogObj: {
      set: function(v) {
        this.hideDialog()
      },
      get: function() {
        return this.$store.state.ui.dialog.show
      }
    }
  },
  methods: {
    ...mapActions({
      hideDialog: 'ui/hideDialog',
      showDialog: 'ui/showDialog',
      dialogAction: 'ui/dialogAction'
    })
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
</style>
