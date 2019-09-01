<template>
  <v-layout row wrap justify-center align-center>
    <SessionTracking></SessionTracking>
    <v-flex xs12 sm12 md12>
      <div class="text-center">
        <logo />
      </div>
    </v-flex>
    <v-flex xs12 sm12 md12 class="main-font">
      <v-card>
        <v-card-text>
          <v-container fluid>
            <v-row v-if="!ui.showLinks">
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
                  v-model="url_options.original_url"
                  :error-messages="errors.original_url"
                ></v-text-field>
              </v-col>
              <v-col cols="12" md="2" class="text-center">
                <div class="text-center">
                  <v-btn large text rounded @click="showAdvance = !showAdvance">Advance</v-btn>
                  <v-btn large color="primary" rounded @click="shoutUrl">Short</v-btn>
                </div>
              </v-col>
              <v-col cols="12" sm="6" md="3" no-gutters>
                <v-text-field
                  label="Url Alias (web-meeting)"
                  v-model="url_options.special_url"
                  :error-messages="errors.special_url"
                ></v-text-field>
              </v-col>
            </v-row>
            <v-row v-if="showAdvance && !ui.showLinks" class="main-font">
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
                              <v-text-field
                                v-model="url_options.user_name"
                                :error-messages="errors.user_name"
                                placeholder="Name"
                              ></v-text-field>
                            </v-col>
                            <v-col cols="4">
                              <v-text-field
                                v-model="url_options.user_email"
                                :error-messages="errors.user_email"
                                placeholder="Email"
                              ></v-text-field>
                            </v-col>
                            <v-col cols="4">
                              <v-text-field
                                v-model="url_options.user_mobile"
                                :error-messages="errors.user_mobile"
                                placeholder="Mobile"
                              ></v-text-field>
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
                                :error-messages="errors.display_ads"
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
                                v-model="url_options.analytic_report"
                                :error-messages="errors.analytic_report"
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
                                    :error-messages="errors.expire_date"
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
                                    :error-messages="errors.expire_time"
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
            <v-row v-if="ui.showLinks">
              <v-col cols="md12" v-if="haveLinks">
                <v-btn @click="ui.showLinks = false" text icon> <v-icon>keyboard_arrow_left</v-icon> </v-btn>
                <v-card
                  :flat="!showLinkInBox"
                  v-for="(item,index) of ui.links"
                  :key="index"
                  style="margin-bottom: 10px;"
                >
                  <v-card-title>{{item.short_url}}                    
                    <CopyToClipboard :color="'purple'" :id="index" :textToCopy="item.short_url"/> </v-card-title>
                  <v-card-text>{{item.original_url}} </v-card-text>
                </v-card>
              </v-col>
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
import SessionTracking from '~/components/SessionTracking.vue'
import CopyToClipboard from '~/components/CopyToClipboard.vue'

import { mapGetters, mapActions } from 'vuex'
import repositoryFactory from '~/repository/repositoryFactory'
import storageService from '~/storageService/ls'

const shortUrl = repositoryFactory.get('shortUrl')
export default {
  name: 'index',
  components: {
    Logo,
    SessionTracking,
    CopyToClipboard
  },
  data: function() {
    return {
      rules: [
        (value) => !!value || 'Required.',
        (value) => (value || '').length <= 2000 || 'Max 2000 characters',
        (value) => {
          const pattern = /^(?:([A-Za-z]+):)?(\/{0,3})([0-9.\-A-Za-z]+)(?::(\d+))?(?:\/([^?#]*))?(?:\?([^#]*))?(?:#(.*))?$/
          return pattern.test(value) || 'Invalid URL.'
        }
      ],
      errors: {},
      url_options: {
        special_url: null,
        short_url: null,
        original_url: null,
        expire_date: null,
        expire_time: null,
        user_name: null,
        user_email: null,
        user_mobile: null,
        display_ads: 1,
        analytic_report: 0
      },
      datepicker: false,
      timepicker: false,
      showAdvance: false,
      ui: {
        showLinks: false,
        links: []
      }
    }
  },
  computed: {
    ...mapGetters({
      api_url: 'api/ApiUrl',
      session_id: 'session/getSession'
    }),
    showLinkInBox() {
      return this.ui.links.length > 1
    },
    haveLinks() {
      return this.ui.links.length > 0
    }
  },
  mounted() {
    /**
     * Set User data from ls
     */
    if (storageService.has('n')) {
      this.url_options.user_name = storageService.getDecrtpted('n')
    }
    if (storageService.has('m')) {
      this.url_options.user_mobile = storageService.getDecrtpted('m')
    }
    if (storageService.has('e')) {
      this.url_options.user_email = storageService.getDecrtpted('e')
    }
  },
  methods: {
    ...mapActions({
      showSuccess: 'ui/showSuccessSnackbar',
      showError: 'ui/showErrorSnackbar'
    }),
    resetMainFields() {
      this.url_options.special_url = null
      this.url_options.short_url = null
      this.url_options.original_url = null
      this.url_options.expire_date = null
      this.url_options.expire_time = null
    },
    shoutUrl() {
      let that = this
      that.url_options.session_id = that.session_id
      shortUrl
        .add(that.url_options)
        .then((response) => {
          that.showSuccess(response.data.message)
          /**
           * Manage Some Local Data related to user
           */
          if (
            response.data.data != undefined &&
            response.data.data.urls != undefined
          ) {
            response.data.data.urls.forEach((element) => {
              that.ui.links.push(element)
            })
          }
          if (that.url_options.user_name) {
            storageService.setEncrypted('n', that.url_options.user_name)
          }
          if (that.url_options.user_mobile) {
            storageService.setEncrypted('m', that.url_options.user_mobile)
          }
          if (that.url_options.user_email) {
            storageService.setEncrypted('e', that.url_options.user_email)
          }
          that.ui.showLinks = true
          that.resetMainFields()
        })
        .catch((err) => {
          this.errors = err.response.data.errors
          console.log(err)
        })
    }
  }
}
</script>

<style>
.asd {
  background: linear-gradient(-45deg, #ee7752, #e73c7e, #23a6d5, #23d5ab);
  animation: gradientBG 15s ease infinite;
  background-size: 400% 400%;
}
.main-font {
  font-family: 'ABeeZee', sans-serif;
}
.secondary-font {
  font-family: 'Anton', sans-serif;
}

div[class^='col'],
div[class*='col'],
.v-input {
  padding: 0px;
  padding-top: 0px;
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
