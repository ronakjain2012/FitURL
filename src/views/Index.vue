<template>
<v-container class="ex-container">
    Hello
  
  </v-container>
</template>

<script>
// @ is an alias to /src
import { mapGetters } from "vuex";
export default {
  name: "Index",
  data: () => {
    return {};
  },
  computed: {
    ...mapGetters(["user"])
  },
  mounted() {
    console.log('app mount', this.$route) 
  }
};
</script>
