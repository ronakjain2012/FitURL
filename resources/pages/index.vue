<template>
  <v-layout column justify-center align-center>
    <v-flex xs12 sm8 md6>
      <div class="text-center">
        <logo />
      </div>
    </v-flex>
    <v-flex xs12 sm8 md6>
      <v-card width="1500">
        <v-card-text>
          <v-container fluid>
            <v-row>
              <v-col cols="12" md="10">
                <v-text-field
                  label="Short URL"
                  autofocus
                  clearable
                  validate-on-blur
                  :rules="rules"
                  placeholder="Paste URL Here !!"
                  outlined
                  prepend-inner-icon="link"
                ></v-text-field>
              </v-col>
              <v-col cols="12" md="2">
                <div class="text-right">
                  <v-btn large text rounded @click="showAdvance = !showAdvance">Advance</v-btn>
                  <v-btn large color="primary" rounded>Short</v-btn>
                </div>
              </v-col>
            </v-row>
            <v-row v-if="showAdvance">
              <v-flex md12 sm12>
                <v-card flat>
                  <v-card-text>
                    <v-expansion-panels accordion inset multiple>
                      <v-expansion-panel>
                        <v-expansion-panel-header>User Details</v-expansion-panel-header>
                        <v-expansion-panel-content>
                          <v-row no-gutters>
                            <v-col cols="12">
                              <p>This feature is in Beta version!</p>
                              <p>This feature is for enterprices and advance users who wants to track the link activity and want to get update for their links.</p>
                            </v-col>
                            <v-col cols="4">
                              <v-text-field v-model="url_options.user_name" placeholder="Name"></v-text-field>
                            </v-col>
                            <v-col cols="4">
                              <v-text-field v-model="url_options.user_email" placeholder="Email"></v-text-field>
                            </v-col>
                            <v-col cols="4">
                              <v-text-field v-model="url_options.user_mobile" placeholder="Mobile"></v-text-field>
                            </v-col>
                          </v-row>
                        </v-expansion-panel-content>
                      </v-expansion-panel>

                      <v-expansion-panel>
                        <v-expansion-panel-header>Ads</v-expansion-panel-header>
                        <v-expansion-panel-content>
                          <v-row no-gutters>
                            <v-col cols="12">
                              <p>This will enable/disable the ads when short url is opened.</p>
                            </v-col>
                            <v-col cols="12">
                              <v-checkbox
                                v-model="url_options.display_ads"
                                label="Show Ads on redirect"
                              ></v-checkbox>
                            </v-col>
                          </v-row>
                        </v-expansion-panel-content>
                      </v-expansion-panel>
                      <v-expansion-panel>
                        <v-expansion-panel-header>Analytic Reports</v-expansion-panel-header>
                        <v-expansion-panel-content>
                          <v-row no-gutters>
                            <v-col cols="12">
                              <p>
                                This will enable/disable the reports like (when clicked, location details, unique/duplicate clicks etc.) and will be sent on email provied in
                                <b>User Detail</b> section.
                              </p>
                            </v-col>
                            <v-col cols="12">
                              <v-checkbox
                                v-model="url_options.display_ads"
                                label="Show Ads on redirect"
                              ></v-checkbox>
                            </v-col>
                          </v-row>
                        </v-expansion-panel-content>
                      </v-expansion-panel>

                      <v-expansion-panel>
                        <v-expansion-panel-header>
                          <v-row no-gutters>
                            <v-col cols="4" md="6">Expire</v-col>
                            <v-col
                              cols="4"
                              md="3"
                            >Date {{ url_options.expire_date || '____-__-__' }}</v-col>
                            <v-col cols="4" md="3">Time {{ url_options.expire_time || '__:__' }}</v-col>
                          </v-row>
                        </v-expansion-panel-header>
                        <v-expansion-panel-content>
                          <v-row no-gutters justify="space-around">
                            <v-col cols="12">
                              <p>After selected time url will be longer accessible by Our portal</p>
                            </v-col>
                            <v-col cols="6">
                              <v-menu
                                v-model="datepicker"
                                :close-on-content-click="false"
                                :nudge-right="40"
                                transition="scale-transition"
                                offset-y
                                full-width
                                min-width="290px"
                              >
                                <template v-slot:activator="{ on }">
                                  <v-text-field
                                    v-model="url_options.expire_date"
                                    label="Expire Date"
                                    prepend-icon="event"
                                    v-on="on"
                                    clearable
                                  ></v-text-field>
                                </template>
                                <v-date-picker
                                  v-model="url_options.expire_date"
                                  @input="datepicker = false"
                                ></v-date-picker>
                              </v-menu>
                            </v-col>
                            <v-col cols="6">
                              <v-menu
                                ref="menu"
                                v-model="timepicker"
                                :close-on-content-click="false"
                                :nudge-right="40"
                                :return-value.sync="url_options.expire_time"
                                transition="scale-transition"
                                offset-y
                                full-width
                                max-width="290px"
                                min-width="290px"
                              >
                                <template v-slot:activator="{ on }">
                                  <v-text-field
                                    v-model="url_options.expire_time"
                                    label="Expire Time"
                                    prepend-icon="access_time"
                                    readonly
                                    v-on="on"
                                    clearable
                                  ></v-text-field>
                                </template>
                                <v-time-picker
                                  v-model="url_options.expire_time"
                                  full-width
                                  @click:minute="$refs.menu.save(url_options.expire_time)"
                                ></v-time-picker>
                              </v-menu>
                            </v-col>
                          </v-row>
                        </v-expansion-panel-content>
                      </v-expansion-panel>
                    </v-expansion-panels>
                  </v-card-text>
                </v-card>
              </v-flex>
            </v-row>
          </v-container>
        </v-card-text>
      </v-card>
    </v-flex>
  </v-layout>
</template>

<script>
/* eslint-disable */
import Logo from '~/components/Logo.vue'

export default {
  name: 'index',
  components: {
    Logo
  },
  data: function() {
    return {
      rules: [
        (value) => !!value || 'Required.',
        (value) => (value || '').length <= 2000 || 'Max 2000 characters',
        (value) => {
          const pattern = /^(?:([A-Za-z]+):)?(\/{0,3})([0-9.\-A-Za-z]+)(?::(\d+))?(?:\/([^?#]*))?(?:\?([^#]*))?(?:#(.*))?$/;
          return pattern.test(value) || 'Invalid URL.'
        }
      ],
      url_options: {
        partition_index_number: 0,
        partition_index: null,
        special_url: null,
        short_url: null,
        original_url: null,
        expire_date: null,
        expire_time: null,
        user_name: null,
        user_email: null,
        user_mobile: null,
        user_country: null,
        url_meta: null,
        url_category: null,
        display_ads: 1,
        analytic_report: 0,
        force_disabled: 0
      },
      datepicker: false,
      timepicker: false,
      showAdvance: false,
    }
  },
  watch: {}
}
</script>

<style>
.asd {
  background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
  animation: gradientBG 15s ease infinite;
  background-size: 400% 400%;
}

@keyframes gradientBG {
  0% {
    background-position: 0% 50%;
  }
  50% {
    background-position: 100% 50%;
  }
  100% {
    background-position: 0% 50%;
  }
}
</style>
