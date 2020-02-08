<template>
  <v-content>
    <v-container fluid fill-height class="Login">
      <v-layout justify-center fill-height align-center>
        <v-flex xs12 sm7 md3>
          <v-card class="elevation-12">
            <v-toolbar color="primary" dark flat>
              <v-toolbar-title>Register</v-toolbar-title>
              <v-spacer></v-spacer>
              <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                  <v-btn to="/login" icon large v-on="on">
                    <v-icon>mdi-account-badge-outline</v-icon>
                  </v-btn>
                </template>
                <span>Sign-In if already have a account</span>
              </v-tooltip>
            </v-toolbar>
            <v-card-text>
              <v-form>
                <v-text-field
                  label="Name (Alex)"
                  autocomplete="username"
                  name="login"
                  prepend-icon="mdi-account"
                  type="text"
                  v-model="from_fields.name"
                ></v-text-field>
                <v-text-field
                  label="Email (example@mail.com)"
                  autocomplete="username"
                  name="login"
                  prepend-icon="mdi-account"
                  type="text"
                  v-model="from_fields.email"
                ></v-text-field>
                <v-text-field
                  id="password"
                  label="Password"
                  name="password"
                  prepend-icon="mdi-textbox-password"
                  type="password"
                  autocomplete="current-password"
                  v-model="from_fields.password"
                ></v-text-field>
                <v-text-field
                  id="repeat-password"
                  label="Repeat Password"
                  name="repeat-password"
                  prepend-icon="mdi-textbox-password"
                  type="password"
                  autocomplete="current-password"
                  v-model="from_fields.repeat_password"
                ></v-text-field>
              </v-form>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="primary" width="50%" rounded @click="register">Register</v-btn>
            </v-card-actions>
          </v-card>
        </v-flex>
      </v-layout>
    </v-container>
  </v-content>
</template>

<script>
// @ is an alias to /src
//import HelloWorld from '@/components/HelloWorld.vue'
import { mapGetters, mapMutations } from "vuex";
import repository from "@/repository/repository";
const model = repository.get("login");

export default {
  name: "Register",
  data: () => {
    return {
      from_fields: {}
    };
  },
  methods: {
    ...mapMutations(["SET_FORM_ITEMS"]),
    async register() {
      let that = this;
      await model
        .register()
        .then(response => {
          if (response.data.data.token) {
            that.$store.dispatch("setUserData", response.data.data);
            that.$router.push("/");
          }
        })
        .catch(e => {
          that.$store.dispatch("setUserLoginStatus", false);
        });
    }
  },
  watch: {
    from_fields: function(newVal) {
      this.SET_FORM_ITEMS(newVal);
    }
  }
};
</script>
