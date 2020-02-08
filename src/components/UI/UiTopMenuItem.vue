<template>
  <div class="ex-top-header text-center">
    <v-menu
      :close-on-content-click="false"
      :nudge-width="200"
      nudge-bottom
      open-on-hover
      offset-y
      v-for="(i,k) in mainLinks"
      :key="k"
    >
      <template v-slot:activator="{ on }">
        <v-btn class="ex-main-items" v-on="on" depressed tile text v-if="i.children.length>0">
          <span class="ex-main-items-title">{{i.title}}</span>
          <v-icon right>{{i.meta.data.data.icon}}</v-icon>
        </v-btn>
        <v-btn v-else class="ex-main-items" depressed tile text>
          <span class="ex-main-items-title">{{i.title}}</span>
          <v-icon right>{{i.meta.data.data.icon}}</v-icon>
        </v-btn>
      </template>
      <v-card>
        <v-list dense>
          <v-list-item v-for="(item,index) of i.children" :key="index">
            <v-list-item-icon>
              <v-icon v-text="item.meta.data.data.icon"></v-icon>
            </v-list-item-icon>
            <v-list-item-content class="text-left align-self-start">
              <v-list-item-title>{{item.meta.title}}</v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list>
      </v-card>
    </v-menu>
  </div>
</template>

<script>
import { mapGetters } from "vuex";
export default {
  name: "UiTopMenu",
  data: () => ({
    fav: true,
    message: false,
    hints: true
  }),
  computed: {
    ...mapGetters(["routesList"]),
    mainLinks() {
      return this.routesList.find(el => el["pageId"] == "root")["children"];
    }
  }
};
</script>


<style lang="scss">
.ex-top-header {
  background-color: var(--v-primary-base);
  .ex-main-items {
    margin-right: 1rem;
    margin-left: 1rem;
    &-title,
    i.v-icon {
      color: var(--color-text-invert);
    }
  }
}
.v-list-item {
  align-content: flex-start;
  i.v-icon {
    color: var(--color-text);
  }
}
</style>