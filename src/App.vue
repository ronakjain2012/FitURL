<template>
  <v-app>
    <div class="main furl-main">
      <div v-if="false">
        <v-overlay class="ex-overlay">
          <v-progress-circular indeterminate size="190"></v-progress-circular>
        </v-overlay>
      </div>
      <div v-else class="block-main-container">
        <UiHeader />
        <keep-alive>
          <transition name="routerAnimation" enter-active-class="animated fadeIn">
            <v-content>
              <v-layout>
                <router-view></router-view>
              </v-layout>
            </v-content>
          </transition>
        </keep-alive>
      </div>
    </div>
    <vue-progress-bar></vue-progress-bar>
  </v-app>
</template>
<script>
import { mapGetters } from "vuex";
import UiHeader from "@/components/UI/UiHeader";
export default {
  computed: {
    ...mapGetters([
      "progressStatus",
      "progressFail",
      "progressCount",
      "apiProcessStatus"
    ])
  },
  components: { UiHeader },
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
  color: $color-text;
  background-color: $color-main-background !important;
}
.ex-overlay,
.v-overlay,
.v-overlay__scrim {
  background-color: var(--color-secondary) !important;
  color: var(--color-main) !important;
}
.v-toolbar__extension {
  padding-right: 0px !important;
  padding-left: 0px !important;
}
.top-header {
  min-width: 100%;
}
</style>