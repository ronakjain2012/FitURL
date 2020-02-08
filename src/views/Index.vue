<template>
  <v-container class="ex-container">
    <div class="timeline-section">
      <v-card class="mx-auto" flat>
        <v-card-text class="py-0 px-1">
          <v-timeline dense>
            <v-slide-x-reverse-transition group hide-on-leave>
              <v-timeline-item
                v-for="item in items"
                :key="item.id"
                color="secondary"
                small
                fill-dot
              >
                <v-alert
                :value="true"
                color="primary"
                icon="mdi-arrow-right-thick"
                class="color-text--text timeline-alert"
                >{{item.content}}</v-alert>
              </v-timeline-item>
            </v-slide-x-reverse-transition>
          </v-timeline>
        </v-card-text>
      </v-card>
    </div>
  </v-container>
</template>

<script>
// @ is an alias to /src
import { mapGetters } from "vuex";
export default {
  name: "Index",
  data: () => {
    return {
      items: [
        {
          id: 1,
          content: 'Make your links powerful marketing assets. Custom links replace “FitURL.com” with your chosen domain name, making your links consistently recognizable across channels. They’re so powerful, businesses that use them get up to 34% more clicks.',
        },
        {
          id: 2,
          content: 'Links are the main touchpoint between you and your customers. Every time you click, tap or swipe you’re using a link. “FitURL.com” provides the most complete link management solution that puts your brand first',
        }
      ],
    };
  },
  computed: {
    ...mapGetters(["user"])
  },
  mounted() {
    console.log("app mount", this.$route);
  }
};
</script>

<style lang="scss">
  .timeline-alert {
    border-color: $color-text !important;
  }
</style>