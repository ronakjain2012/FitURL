<template>
  <v-content>
    <v-container fluid fill-height class="Login">
      <v-layout justify-center fill-height align-center>
        <v-flex xs12 sm7 md3>
          <v-card class="elevation-12">
            <v-toolbar color="primary" dark flat>
              <v-toolbar-title>Login</v-toolbar-title>
              <v-spacer></v-spacer>
              <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                  <v-btn to="/register" icon large v-on="on">
                    <v-icon>mdi-account-plus</v-icon>
                  </v-btn>
                </template>
                <span>Register</span>
              </v-tooltip>
              <v-tooltip right>
                <template v-slot:activator="{ on }">
                  <v-btn icon large to="forgot-password" v-on="on">
                    <v-icon>mdi-account-key</v-icon>
                  </v-btn>
                </template>
                <span>Forgot Password</span>
              </v-tooltip>
            </v-toolbar>
            <v-card-text>
              <v-form>
                <v-text-field
                  label="Email (example@mail.com)"
                  name="login"
                  prepend-icon="mdi-account"
                  type="text"
                  autocomplete="username"
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
              </v-form>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="primary" width="50%" rounded @click="login">Login</v-btn>
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
  name: "Login",
  data: () => {
    return {
      from_fields: {}
    };
  },
  methods: {
    ...mapMutations(["SET_FORM_ITEMS"]),
    login() {
      let that = this;
      model
        .login()
        .then(response => {
          if (response.data.data.token) {
            that.$store.dispatch("setUserData", response.data.data).then(()=>{
              that.$router.push("/");
              resolve();
            });
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
