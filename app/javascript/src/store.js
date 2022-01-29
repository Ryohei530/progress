/* global location */
import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';
import moment from 'moment';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    // count: 2,
    data: 'data',
    user: 'user',
    dateToday: ""
  },
  getters: {
    // sample: state => state.count * 2
    data: state => state.data,
    chart_data: state => state.data,
    user: state => state.data.user,
    current_user: state => state.data.current_user,
    goal: state => state.data.goal,
    monthly_goal: state => state.data.monthly_goal,
    monthly_goals: state => state.data.monthly_goals,
    monthly_actions: state => state.data.monthly_actions,
    monthly_actions_array: state => state.data.monthly_actions_array,
    monthly_ratios: state => state.data.monthly_ratios.reverse(),
    rday_dates: state => state.data.rday_dates,
    reports: state => state.data.reports,
    liked_reports: state => state.data.liked_reports,
    liked_report_users_obj: state => state.data.liked_report_users_obj,
    liked_report_monthly_goals: state => state.data.liked_report_monthly_goals,
    liked_report_monthly_actions_array: state => state.data.liked_report_monthly_actions_array,
    report_actions_array: state => state.data.report_actions_array,
    report_images_array: state => state.data.report_images_array,
    liked_report_actions_array: state => state.data.liked_report_actions_array,
    liked_report_images_array: state => state.data.liked_report_images_array,
    report_comments: state => state.data.report_comments,
    latest_report: state => state.data.latest_report,
    latest_report_actions: state => state.data.latest_report_actions,
    posts: state => state.data.posts,
    liked_posts: state => state.data.liked_posts,
    liked_post_users_obj: state => state.data.liked_post_users_obj,
    post_comments: state => state.data.post_comments,
    post_images_array: state => state.data.post_images_array,
    liked_post_images_array: state => state.data.liked_post_images_array,
    days_of_week: state => state.data.days_of_week,
    days_of_month: state => state.data.days_of_month,
    day_date: state => state.data.day_date,
    day_done: state => state.data.day_done,
    day_dones: state => state.data.day_dones,
    week_terms: state => state.data.week_terms,
    week_dones: state => state.data.week_dones,
    nth_week: state => state.data.nth_week,
    week_sums: state => state.data.week_sums.reverse(),
    sums: state => state.data.sums.reverse(),
    
    
    // weekAve: state => parseInt(state.data.week_sums[0] / state.data.day_done.length),
    cardLink: state => "card-link-" + state.data.posts[0].id,
    // weekActNumber(state) {
    //   let mAct = state.data.monthly_actions[0];
    //   let daysOfMonth = state.data.days_of_month;
    //   let daysOfWeek = state.data.days_of_week;
    //   return parseInt((mAct.number / daysOfMonth ) * daysOfWeek);
    // },
    remain(state) {
      let date = state.data.goal.term_end;
      let today = state.dateToday;
      return moment(date).diff(today, 'days');
    },
  },
  mutations: {
    // increment(state, number) {
    //   state.count += number;
    // }
    setData(state, payload) {
      state.data = payload;
    }
  },
  actions: {
    // increment(context, number) {
    //   context.commit('increment', number);
    // },
    // increment({ commit }, number) {
    //   commit('increment', number);
    // },
    getData({ state }) {
      let pathArray = location.pathname.split('/');
      // return axios.get('/api' + location.pathname, {})
      return axios.get('/api/users/' + pathArray[2], {});
    }
  }
});