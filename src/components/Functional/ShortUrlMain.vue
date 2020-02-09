<template>
  <v-alert :value="true" class="color-text-invert--text timeline-alert">
    <v-row no-gutters>
      <v-col cols="12"></v-col>
      <v-col cols="12">
        <v-text-field
          v-model="message"
          color="color-text-invert"
          label="URL "
          type="text"
          filled
          rounded
          solo
          autofocus
          height="60"
        >
          <template v-slot:append>
            <v-fade-transition leave-absolute>
              <v-btn depressed x-large rounded color="secondary" class="ntm">Shortene</v-btn>
            </v-fade-transition>
          </template>
        </v-text-field>
      </v-col>
    </v-row>
    <v-row no-gutters justify="center" class="mb-10">
      <v-col lg="11" md="10" cols="10">
        <div class="color-text-invert--text short-url-pallet">
          <v-tooltip bottom>
            <template v-slot:activator="{ on }">
              <v-btn
                class="setting-buttons float-right"
                depressed
                fab
                small
                color="primary"
                v-on="on"
              >
                <v-icon color="secondary">mdi-brain</v-icon>
              </v-btn>
            </template>
            <span>Smart URL</span>
          </v-tooltip>
          <v-tooltip bottom>
            <template v-slot:activator="{ on }">
              <v-btn
                class="setting-buttons float-right"
                depressed
                fab
                small
                color="primary"
                v-on="on"
              >
                <v-icon color="secondary">mdi-account-cog-outline</v-icon>
              </v-btn>
            </template>
            <span>Advance Settings</span>
          </v-tooltip>
        </div>
      </v-col>
    </v-row>
  </v-alert>
</template>

<script>
import { mapGetters } from "vuex";

export default {
  name: "ShortUrlMain",
  methods: {},
  watch: {},
  data: () => {
    return {
      message: ""
    };
  }
};
</script>

<style lang="scss">
.ntm {
  margin-right: -24px !important;
  height: 60px !important;
}
.v-text-field__details {
  display: none !important;
}
.v-input__slot {
  margin-bottom: 0px;
}
.v-input__append-outer {
  margin-top: 0px !important;
}
</style>

<style lang="scss" scoped>
.short-url-pallet {
  background-color: $color-secondary;
  border-radius: 0 0 5px 5px;
  height: 60px;
  padding: 12px;
  font-size: 20px;
}
.setting-buttons {
  margin-top: 0px !important;
  margin-right: 10px;
}
</style>