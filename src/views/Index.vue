<template>
  <v-container class="ex-container" fluid>
    <div class="section">
      <div class="timeline-section">
        <v-row align="center" justify="center">
          <v-col cols="10" class="color-secondary--text">
            <span class="display-4 font-weight-black">URLs</span>
            <span class="display-3 font-italic font-weight-medium">Digital Seeds of Future...</span>
          </v-col>
        </v-row>
        <v-row align="center" justify="center">
          <v-col cols="8" class="color-secondary--text">
            <span
              class="display-2 font-italic font-weight-medium"
            >Make It look pretty & short with our Futuristic Solutions</span>
          </v-col>
        </v-row>
      </div>
      <div class="shortener-main">
        <ShortUrlMain />
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
    </div>
    <div class="section">
      <v-row align="center" justify="center">
        <v-col cols="12" class="text-center color-text--text">
          <span class="display-4 font-weight-black">Features</span>
        </v-col>
      </v-row>
      <v-row align="center" justify="center">
        <v-col cols="12" class="text-center color-secondary--text">asasdasdsa</v-col>
      </v-row>
    </div>
    <div class="section">
      <v-row align="center" justify="center">
        <v-col cols="12" class="text-center color-text--text">
          <span class="display-4 font-weight-black">Testimonial</span>
        </v-col>
      </v-row>
      <v-row align="center" justify="center">
        <v-col cols="12" class="text-center color-secondary--text">
          <v-card elevation="1" max-width="1400" class="mx-auto">
            <v-system-bar lights-out></v-system-bar>
            <v-carousel
              :continuous="false"
              :cycle="true"
              :show-arrows="true"
              hide-delimiter-background
              show-arrows-on-hover
              :touchless="true"
              delimiter-icon="mdi-minus"
            >
              <v-carousel-item v-for="(slide, i) in slides" :key="i">
                <v-sheet :color="colors[i]" height="100%" tile>
                  <v-row class="fill-height" align="center" justify="center">
                    <v-col cols="12" class="text-center color-text-invert--text">
                      <div>
                        <v-avatar width="150" height="150">
                          <img :src="slide.avatar" lazy-src="https://pluspng.com/img-png/png-logo-design-fancy-png-logo-design-91-on-professional-logo-design-with-png-logo-design-734.png" :alt="slide.name" />
                        </v-avatar>
                      </div>
                      <div class="display-3">{{ slide.name }}</div>
                      <div class="display-1">{{ slide.feedback }}</div>
                      <div class="display-4">
                        <v-rating
                          :value="Math.min(parseInt(slide.rating),5)"
                          background-color="color-dashboard-background"
                          color="color-text-invert"
                        ></v-rating>
                      </div>
                    </v-col>
                  </v-row>
                </v-sheet>
              </v-carousel-item>
            </v-carousel>
          </v-card>
        </v-col>
      </v-row>
    </div>
  </v-container>
</template>

<script>
// @ is an alias to /src
import { mapGetters } from "vuex";
import ShortUrlMain from "@/components/Functional/ShortUrlMain";

export default {
  name: "Index",
  data: () => {
    return {
      slides: [
        {
          id: 1,
          name: "Ruby J.",
          feedback:
            "Thank You! I just can't get enough of FitURL. I want to get a T-Shirt with FitURL on it so I can show it off to everyone. You guys rock! I just can't get enough of FitURL. I want to get a T-Shirt with FitURL on it so I can show it off to everyone.",
          rating: 5,
          avatar:
            "https://mir-s3-cdn-cf.behance.net/project_modules/disp/e65b0d19596101.562dd1103a414.jpg"
        },
        {
          id: 2,
          name: "Ruthie I.",
          feedback:
            "I have gotten at least 50 times the value from FitURL. Absolutely wonderful! You won't regret it. It really saves me time and effort. FitURL is exactly what our business has been lacking.",
          rating: 5,
          avatar:
            "https://mir-s3-cdn-cf.behance.net/project_modules/disp/7d60c421927087.56309c5578687.jpg"
        },
        {
          id: 3,
          name: "Philis K.",
          feedback:
            "If you aren't sure, always go for FitURL. We have no regrets!",
          rating: 4,
          avatar:
            "https://mir-s3-cdn-cf.behance.net/project_modules/disp/3d2fbb19596185.562de8de7e239.jpg"
        },
        {
          id: 4,
          name: "Rosmunda X.",
          feedback:
            "Thank you for making it painless, pleasant and most of all hassle free! We've used FitURL for the last five years.",
          rating: 5,
          avatar:
            "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/01987e39490193.5771df55169f2.jpg"
        },
        {
          id: 5,
          name: "Susannah Y.",
          feedback: "I will refer everyone I know. It's really wonderful.",
          rating: 4,
          avatar:
            "https://mir-s3-cdn-cf.behance.net/project_modules/disp/6f70a011082959.560f11231c979.jpg"
        }
      ],
      colors: [
        "green",
        "secondary",
        "yellow darken-4",
        "red lighten-2",
        "orange darken-1"
      ],
      items: [
        {
          id: 1,
          content:
            "Make your links powerful marketing assets. Custom links replace “FitURL.com” with your chosen domain name, making your links consistently recognizable across channels. They’re so powerful, businesses that use them get up to 34% more clicks."
        },
        {
          id: 2,
          content:
            "Links are the main touchpoint between you and your customers. Every time you click, tap or swipe you’re using a link. “FitURL.com” provides the most complete link management solution that puts your brand first"
        },
        {
          id: 2,
          content:
            "Your shortened URLs can be used in publications, advertisements, blogs, forums, e-mails, instant messages, and other locations. Track statistics for your business and projects by monitoring the number of hits from your URL with the click counter"
        }
      ]
    };
  },
  computed: {
    ...mapGetters(["user"])
  },
  components: { ShortUrlMain }
};
</script>

<style lang="scss">
.timeline-alert {
  border-color: $color-text !important;
}
div.section {
  min-height: calc(85vh);
  background-color: $color-main-background !important;
  /* overflow-y: auto; */
}
</style>