import Vue from 'vue/dist/vue.esm.js';
import VueIndex from "../components/VueIndex"


document.addEventListener('turbolinks:load', () => {
  const element = document.getElementById("vue-vue-index") 
  if (element) {
    const app = new Vue({
      el: element,
      components: {
        VueIndex
      },
      data: () => { 
        return {
          message: "Hello World Vue Index",
          
        }
      },
      methods: {
        allowedHours: v => v % 2,
        allowedMinutes: v => v >= 10 && v <= 50,
        allowedStep: m => m % 10 === 0,
      },
    })
  }
})