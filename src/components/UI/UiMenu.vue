<template>
  <v-card flat color="primary">
    <v-container fluid grid-list-xl>
      <v-layout row wrap>
        <v-flex v-for="(i,k) in mainLinks" :key="k" lg6 md12 sm12 xs12>
          <v-card>
            <div class="d-flex flex-no-wrap justify-space-between">
              <div>
                <v-card-title class="headline" v-text="i.title"></v-card-title>
              </div>
              <v-avatar class="ma-0" size="50" tile>
                <v-icon>{{i.meta.data.data.icon}}</v-icon>
              </v-avatar>
            </div>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
  </v-card>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "UiMenu",
  computed: {
    ...mapGetters(["modelAllusers", "getCollectonData", "modelAllcompany","routesList"]),
    users() {
      this.$store.dispatch("getData", this.modelAllusers);
      return this.getCollectonData(this.modelAllusers);
    },
    companies() {
      this.$store.dispatch("getData", this.modelAllcompany);
      return this.getCollectonData(this.modelAllcompany);
    },
    mainLinks() {
      return this.routesList.find(el=>el['pageId']=='root')['children']
    },
  },
};
</script>