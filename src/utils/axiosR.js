import axios from "axios";
import createAuthRefreshInterceptor from "axios-auth-refresh/src";
import store from "@/store/index.js";

function refresh_token(failedRequest) {
  return new Promise((resolve, reject) => {
    axios
      .post(store.getters.refresh_token_url)
      .then(tokenRefreshResponse => {
        var token = tokenRefreshResponse.data.token;
        localStorage.setItem("token", token);

        setAuthHeaders();

        failedRequest.response.config.headers["Authorization"] = "Bearer " + token;
        failedRequest.response.config.headers["Accept"] = "application/json";

        resolve();
      })
      .catch(err => {
        
        store.dispatch("setUserLoginStatus", false).then(() => {
            window.location = "/login";
        });
        //        window.location = "/login";
        // store.dispatch('logout').then(() =>
        // {
        // });
        reject();
      });
  });
}

// Function that will be called to refresh authorization
const refreshAuthLogic = failedRequest => refresh_token(failedRequest);

// Instantiate the interceptor (you can chain it as it returns the axios instance)
var new_axios = createAuthRefreshInterceptor(axios, refreshAuthLogic);

function setAuthHeaders() {
  var token = localStorage.getItem("token");
  if (token) {
    axios.defaults.headers = {
      Authorization: "Bearer " + token,
      Accept: "application/json",
      responseType: "json"
    };
  }
}
setAuthHeaders();
new_axios.interceptors.request.use(
  function(config) {
    store.commit("SHOW_PROGRESS");
    return config;
  },
  function(error) {
    store.commit("FAIL_PROGRESS");
    store.commit("HIDE_PROGRESS");
    return Promise.reject(error);
  }
);

new_axios.interceptors.response.use(
  function(response) {
    store.commit("HIDE_PROGRESS");
    return response;
  },
  function(error) {
    store.commit("FAIL_PROGRESS");
    store.commit("HIDE_PROGRESS");
    return Promise.reject(error);
  }
);

window.axios = new_axios;

export default new_axios;
