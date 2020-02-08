import Index from '../views/Index.vue'
var routes = [
  {
    path: "/",
    name: "Home",
    component: Index,
    meta: {
      data: {},
      requiresAuth: false
    }
  },
  {
    path: "/register",
    name: "register",
    component: () => import("../views/Register.vue"),
    meta: {
      data: {},
      requiresAuth: false
    }
  },
  {
    path: "/login",
    name: "login",
    component: () => import("../views/Login.vue"),
    meta: {
      data: {},
      requiresAuth: false
    }
  },
  {
    path: "/forgot-password",
    name: "about",
    component: () => import("../views/ForgotPassword.vue"),
    meta: {
      data: {},
      requiresAuth: false
    }
  }
];
export default routes;
