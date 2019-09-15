<template>
  <v-layout row wrap justify-center align-center>
    <v-flex xs12 sm12 md12 class="main-font">
      <SkipAndRedirect></SkipAndRedirect>
    </v-flex>
  </v-layout>
</template>

<script>
/* eslint-disable */
import { mapGetters, mapActions } from 'vuex'
import Logo from '~/components/Logo.vue'
import SkipAndRedirect from '~/components/SkipAndRedirect.vue'

export default {
  name: 'id',
  components: {
    Logo,
    SkipAndRedirect
  }
}
</script>

<style>
.main-font {
  font-family: 'ABeeZee', sans-serif;
}
</style>
