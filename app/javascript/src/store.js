/* global location */
import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';
import moment from 'moment'

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
    weekAve: state => parseInt(state.data.week_sums / state.data.days_of_week),
    cardLink: state => "card-link-" + state.data.posts[0].id,
    weekActNumber(state) {
      let mAct = state.data.monthly_actions[0] 
      let daysOfMonth = parseInt(state.data.days_of_month)
      let daysOfWeek = state.data.days_of_week
      return parseInt((mAct.number / daysOfMonth ) * daysOfWeek)
    },
    remain(state) {
      let date = state.data.goal.term_end
      let today = state.dateToday
      return moment(date).diff(today, 'days')
    },
    // textReplace(state) {
    //   return state.data.goal.indicator.replace(/\n/g, '<br/>');
    // }
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
      return axios.get('/api' + location.pathname, {})
    }
  }
});