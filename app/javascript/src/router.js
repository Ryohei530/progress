import Vue from "vue";
import Router from "vue-router";
import Home from "./components/Home.vue";
import Goal from "./components/Goal.vue";
import MonthlyGoal from "./components/MonthlyGoal.vue";
import Report from "./components/Report.vue";
import LikedReport from "./components/LikedReport.vue";
import Post from "./components/Post.vue";
import LikedPost from "./components/LikedPost.vue";

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
      path: '/liked_report', 
      component: LikedReport
    },
    { 
      path: '/post', 
      component: Post
    },
    { 
      path: '/liked_post', 
      component: LikedPost
    },
  ]
});