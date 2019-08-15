<template>
  <v-app>
    <v-content>
      <v-card class="overflow-hidden scroll-y" height="100%" fill-height>
        <v-app-bar
          :collapse="!collapseOnScroll"
          :collapse-on-scroll="collapseOnScroll"
          absolute
          color="deep-purple accent-4"
          scroll-target="#scrolling-techniques-6"
        >
          <v-app-bar-nav-icon></v-app-bar-nav-icon>
          <v-toolbar-title class="text-primary">{{ page.title }}</v-toolbar-title>
          <v-spacer></v-spacer>
          <!-- <v-checkbox v-model="collapseOnScroll" color="white" hide-details></v-checkbox> -->
        </v-app-bar>
        <v-sheet id="scrolling-techniques-6" class="overflow-y-auto">
          <v-container fluid fill-height style="margin-top:4%">
            <nuxt />
          </v-container>
        </v-sheet>
      </v-card>
    </v-content>

    <v-footer padless fixed>
      <v-bottom-navigation color="deep-purple accent-4">
        <v-btn>
          <span>Home</span>
          <v-icon>beach_access</v-icon>
        </v-btn>


        <v-btn>
          <span>APIs</span>
          <v-icon>repeat</v-icon>
        </v-btn>

        <v-btn>
          <span>Example</span>
          <v-icon>pages</v-icon>
        </v-btn>

        <v-btn>
          <span>Enterprise Use</span>
          <v-icon>business_center</v-icon>
        </v-btn>

        <v-btn>
          <span>Terms of use</span>
          <v-icon>outlined_flag</v-icon>
        </v-btn>

        <v-btn>
          <span>Contact Us</span>
          <v-icon>ring_volume</v-icon>
        </v-btn>
      </v-bottom-navigation>
    </v-footer>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      collapseOnScroll: true,
      page: {
        title: 'Shorter'
      }
    }
  }
}
</script>
