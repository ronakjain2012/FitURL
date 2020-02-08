<template>
  <v-app>
    <div class="main furl-main">
      <div v-if="false">
        <v-overlay class="ex-overlay">
          <v-progress-circular indeterminate size="190"></v-progress-circular>
        </v-overlay>
      </div>
      <div v-else class="block-main-container">
        <keep-alive>
          <router-view></router-view>
        </keep-alive>
      </div>
    </div>
    <vue-progress-bar></vue-progress-bar>
  </v-app>
</template>
<script>
import { mapGetters } from "vuex";

export default {
  computed: {
    ...mapGetters([
      "progressStatus",
      "progressFail",
      "progressCount",
      "apiProcessStatus"
    ])
  },
  watch: {
    progressStatus: function(newVal) {
      if (newVal === true) {
        this.$Progress.start();
      } else {
        this.$Progress.finish();
      }
    },
    progressFail: function(newVal) {
      this.$Progress.fail();
    }
  }
};
</script>
<style lang="scss">
@import "@/scss/_index.scss";

#app {
  font-family: "Avenir", Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: $color-text;
  background-color: $color-background-dashboard-main;
}
.ex-overlay,
.v-overlay,
.v-overlay__scrim {
  background-color: var(--color-secondary) !important;
  color: var(--color-main) !important;
}
</style>