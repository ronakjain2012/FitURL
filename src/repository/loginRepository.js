import axiosO from '@/utils/axiosO'
import store from "../store";

export default {
    async login() {
      return axiosO.post(`${store.getters.login_url}`,store.getters.getFomItems)
    },
    async register() {
      return axiosO.post(`${store.getters.register_url}`,store.getters.getFomItems)
    },
    async forgotPassword() {
      return axiosO.post(`${store.getters.forgot_pass_url}`,store.getters.getFomItems)
    }
  }