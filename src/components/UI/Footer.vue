<template>
  <v-footer height="auto">
    <v-card flat tile class="flex">
      <v-card-title class="primary color-text--text">
        <strong class="subheading">Get connected with us on social networks!</strong>
        <v-spacer></v-spacer>
        <v-btn v-for="icon in icons" :key="icon" icon dark class="mx-3">
          <v-icon size="24px" color="color-text">{{ icon }}</v-icon>
        </v-btn>
      </v-card-title>
      <v-card-text class="secondary color-text--text pt-4 pb-4">
        <v-layout>
          <v-flex v-for="(col, i) in rows" :key="i" xs3>
            <span class="title color-text-invert--text" v-text="col.title.toUpperCase()"></span>
            <hr width="90%" />
            <div v-for="(child, i) in col.children" :key="i" class="color-text-invert--text" v-text="child"></div>
          </v-flex>
          <v-flex xs3 layout column pr-1 class="color-text-invert--text">
            <span class="title color-text-invert--text">CONTACT</span>
            <hr width="90%" />
            <div>
              <v-icon size="18px" class="mr-3 color-text-invert--text">mdi-map-marker</v-icon>Find a Donation Office Near You 
            </div>
            <div>
              <v-icon size="18px" class="mr-3 color-text-invert--text">mdi-map-marker</v-icon>Find Our Branch Near You
            </div>
            <div>
              <v-icon size="18px" class="mr-3 color-text-invert--text">mdi-office-building</v-icon>B-50 Pooja Path, Parshnaath Colony, Jaipur (302019)
            </div>
            <div>
              <v-icon size="18px" class="mr-3 color-text-invert--text">mdi-email-outline</v-icon>info@city1st.com
            </div>
            <div>
              <v-icon size="18px" class="mr-3 color-text-invert--text">mdi-phone</v-icon>+91-902-424-3932
            </div>
            <div>
              <v-icon size="18px" class="mr-3 color-text-invert--text">mdi-deskphone</v-icon>801-299-1769
            </div>
          </v-flex>
        </v-layout>
      </v-card-text>
      <v-card-actions class="color-dashboard-background color-text--text justify-center">
        <strong>Time Source Inc.</strong>&nbsp; &copy; 2020
      </v-card-actions>
    </v-card>
  </v-footer>
</template>

<script>
export default {
  name: "Footer",
  data: () => ({
    icons: [
      "mdi-facebook",
      "mdi-twitter",
      "mdi-linkedin",
      "mdi-instagram",
      "mdi-youtube"
    ],
    rows: [
      {
        title: "Services",
        children: [
          "Apply Now",
          "Solicitud en Español",
          "Construction Loan Application",
          "Mortgage Learning Center",
          "Calculators",
          "FAQs"
        ]
      },
      {
        title: "Links",
        children: [
          "Become a Branch",
          "Become a Loan Officer",
          "Become a Partner"
        ]
      },
      {
        title: "Support",
        children: [
          "City First Story",
          "Become Part of Our Story",
          "Financial Health Help"
        ]
      }
    ]
  })
};
</script>

<style lang="scss">
.v-footer {
  padding: 0px !important;
}
</style>