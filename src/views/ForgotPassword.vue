<template>
  <v-content>
    <v-container fluid fill-height class="Login">
      <v-layout justify-center fill-height align-center>
        <v-flex xs12 sm7 md3>
          <v-card class="elevation-12">
            <v-toolbar color="primary" dark flat>
              <v-toolbar-title>Forgot Password</v-toolbar-title>
              <v-spacer></v-spacer>
              <v-tooltip bottom>
                <template v-slot:activator="{ on }">
                  <v-btn to="/" icon large v-on="on">
                    <v-icon>mdi-home</v-icon>
                  </v-btn>
                </template>
                <span>Home</span>
              </v-tooltip>
            </v-toolbar>
            <v-card-text>
              <v-form>
                <v-text-field label="Email (example@mail.com)" name="login" prepend-icon="mdi-account" type="text" autocomplete="email"></v-text-field>
                <v-text-field
                  id="password"
                  label="OTP (1996)"
                  name="otp"
                  prepend-icon="mdi-textbox-password"
                  type="password"
                  autocomplete="current-password"
                ></v-text-field>
              </v-form>
            </v-card-text>
            <v-card-actions>
              <v-spacer></v-spacer>
              <v-btn color="primary" width="50%" rounded>Reset</v-btn>
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

export default {
  name: "ForgotPassword",
  data: () => {
    return {};
  }
};
</script>
