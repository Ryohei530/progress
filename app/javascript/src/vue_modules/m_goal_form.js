/* global $ */
import Vue from 'vue/dist/vue.esm.js';
import MonthlyGoalActionForm from "../components/MonthlyGoalActionForm";

document.addEventListener('DOMContentLoaded', () => {
  const element = document.getElementById("m-goal-form");
  if (element) {
    const app = new Vue({
      el: element,
      components: {
        MonthlyGoalActionForm
      },
      data: () => { 
        return {
          message: "Hello World mypage",
          num: el.length
        };
      },
      methods: {
        addForm() {
          let ComponentClass = Vue.extend(MonthlyGoalActionForm);
          let instance = new ComponentClass({
            propsData: {
              index: this.num,
            }
          });
          instance.$mount();
          $('.action').append(instance.$el);
        },
        removeForm() {
          
        },
      },
    });
  }
})