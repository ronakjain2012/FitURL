import axios from '@/utils/axiosR'
import store from "../store";

export default {
    async menuData() {
      return axios.get(`${store.getters.ui_menu_url}`)
    },
  }