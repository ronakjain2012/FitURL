import Vue from "vue";
import Router from "vue-router";
import store from "@/store/index.js";
import static_routes from "./static_routes";

import repository from "@/repository/repository";
const model = repository.get("menu");

Vue.use(Router);
const router = new Router({
  mode: "history",
  base: process.env.BASE_URL,
  routes: static_routes
});
router.beforeEach((to, from, next) => {
  store.dispatch("showProgressBar");
  next();
});

router.afterEach((to, from) => {
  store.dispatch("hideProgressBar");
});

export default router;
