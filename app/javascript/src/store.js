/* global location */
import Vue from 'vue';
import Vuex from 'vuex';
import axios from 'axios';

Vue.use(Vuex);

export default new Vuex.Store({
  state: {
    // count: 2,
    data: 'data',
    user: 'user',
  },
  getters: {
    // sample: state => state.count * 2
  },
  mutations: {
    // increment(state, number) {
    //   state.count += number;
    // }
  },
  actions: {
    // increment(context, number) {
    //   context.commit('increment', number);
    // },
    // increment({ commit }, number) {
    //   commit('increment', number);
    // },
    getData({ state }) {
      axios.get('/api' + location.pathname)
        .then(response => {
          state.data = response.data
          state.user = response.data.user
          console.log(response)
        });
    }
  }
});