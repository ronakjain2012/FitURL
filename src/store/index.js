import Vue from 'vue'
import Vuex from 'vuex'

/* Modules */
import api_store from './modules/api'
import form_store from './modules/form'
import user_store from './modules/user'
import context from './modules/context'


Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    api_store,
    form_store,
    user_store,
    context
  }
})
