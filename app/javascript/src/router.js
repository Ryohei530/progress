import Vue from "vue";
import Router from "vue-router";
import Home from "./components/Home.vue";
import Goal from "./components/Goal.vue";

Vue.use(Router);

export default new Router({
  routes: [{ path: '/', component: Home}, { path: '/goal', component: Goal}]
});