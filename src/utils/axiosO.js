import axios from 'axios'
import store from "@/store/index.js";

const customAxios = axios.create({
    responseType: 'json'
})
customAxios.interceptors.request.use(function (config) {
    store.commit('SHOW_PROGRESS')
    return config;
  }, function (error) {
    store.commit('FAIL_PROGRESS')
    store.commit('HIDE_PROGRESS')
    return Promise.reject(error);
  });

customAxios.interceptors.response.use(function (response) {
    store.commit('HIDE_PROGRESS')
    return response;
  }, function (error) {
    store.commit('FAIL_PROGRESS')
    store.commit('HIDE_PROGRESS')
    return Promise.reject(error);
  });
export default customAxios