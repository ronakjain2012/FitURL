import '@mdi/font/css/materialdesignicons.css' // Ensure you are using css-loader
import Vue from 'vue'
import VueProgressBar from 'vue-progressbar'
import App from './App.vue'
import router from './router/router'
import store from './store/index.js'
import vuetify from '@/plugins/vuetify'
import 'babel-polyfill'
import './registerServiceWorker'

Vue.use(VueProgressBar, {
  color: 'rgb(143, 255, 199)',
  failedColor: 'red',
  height: '3px'
})

Vue.router = router;
Vue.use(router);

Vue.config.productionTip = false

new Vue({
  router,
  store,
  vuetify,
  render: h => h(App)
}).$mount('#app')
