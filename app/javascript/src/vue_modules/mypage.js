import Vue from 'vue/dist/vue.esm.js';
import VueIndex from "../components/VueIndex"
import router from "../router";

document.addEventListener('DOMContentLoaded', () => {
  const element = document.getElementById("vue-users-show") 
  if (element) {
    const app = new Vue({
      router,
      el: element,
      components: {
        VueIndex
      },
      data: () => { 
        return {
          message: "Hello World mypage",
        }
      },
      methods: {
        
      },
    })
  }
})