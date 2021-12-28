import Vue from "vue";
import Router from "vue-router";
import Home from "./components/Home.vue";
import Goal from "./components/Goal.vue";
import MonthlyGoal from "./components/MonthlyGoal.vue";
import Report from "./components/Report.vue";
import Post from "./components/Post.vue";

Vue.use(Router);

export default new Router({
  routes: [
    { 
      path: '/', 
      component: Home
    },
    { 
      path: '/goal', 
      component: Goal
    },
    { 
      path: '/monthly_goal', 
      component: MonthlyGoal
    },
    { 
      path: '/report', 
      component: Report
    },
    { 
      path: '/post', 
      component: Post
    },
  ]
});