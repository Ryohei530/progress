/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

import Vue from 'vue';
import App from '../app.vue';
import router from '../src/router';
import store from '../src/store';
import VueIndex from "../src/components/VueIndex";


document.addEventListener('DOMContentLoaded', () => {
  // const element = document.getElementById("app")
  // console.log(element)
  // if (element) {
    const app = new Vue({
      el: '#app',
      router,
      store,
      render: h => h(App)
    }).$mount()
  
    console.log(app)
    
    const app2 = new Vue({
      el: "#vue-app",
      components: {
        VueIndex
      },
      data: () => { 
        return {
          message: "Hello World mypage",
          activeBtn: false,
          isActive: '1'
        };
      },
      computed: {
        btnLine1: function() {
          return {
            'btn_line01': this.activeBtn
          };
        },
        btnLine2: function() {
          return {
            'btn_line02': this.activeBtn
          };
        },
        btnLine3: function() {
          return {
            'btn_line03': this.activeBtn
          };
        },
        tabActive1: function() {
          return {
          'tab-active': this.isActive === '1'
          };
        },
        tabActive2: function() {
          return {
          'tab-active': this.isActive === '2'
          };
        },
      },
      methods: {
        changeTab: function(num) {
          this.isActive = num;
        },
      },
    })
    
    console.log(app2)
  // }
  // else {
  //   const app = new Vue({
  //     el: "#vue-app",
  //     components: {
  //       VueIndex
  //     },
  //     data: () => { 
  //       return {
  //         message: "Hello World mypage",
  //       }
  //     },
  //     methods: {
        
  //     },
  //   })
    
  //   console.log(app)
  // }
})


// The above code uses Vue without the compiler, which means you cannot
// use Vue to target elements in your existing html templates. You would
// need to always use single file components.
// To be able to target elements in your existing html/erb templates,
// comment out the above code and uncomment the below
// Add <%= javascript_pack_tag 'hello_vue' %> to your layout
// Then add this markup to your html template:
//
// <div id='hello'>
//   {{message}}
//   <app></app>
// </div>


// import Vue from 'vue/dist/vue.esm'
// import App from '../app.vue'

// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     el: '#hello',
//     data: {
//       message: "Can you say hello?"
//     },
//     components: { App }
//   })
// })
//
//
//
// If the project is using turbolinks, install 'vue-turbolinks':
//
// yarn add vue-turbolinks
//
// Then uncomment the code block below:
//
// import TurbolinksAdapter from 'vue-turbolinks';
// import Vue from 'vue/dist/vue.esm';
// import App from '../app.vue';


// Vue.use(TurbolinksAdapter);


// document.addEventListener('turbolinks:load', () => {
//   const app = new Vue({
//     el: '#app',
//     data: () => {
//       return {
//         message: "Can you say hello?",
//         activeBtn: false,
//         isActive: '1'
//       };
//     },
//     computed: {
//       btnLine1: function() {
//         return {
//           'btn_line01': this.activeBtn
//         };
//       },
//       btnLine2: function() {
//         return {
//           'btn_line02': this.activeBtn
//         };
//       },
//       btnLine3: function() {
//         return {
//           'btn_line03': this.activeBtn
//         };
//       },
//       tabActive1: function() {
//         return {
//         'tab-active': this.isActive === '1'
//         };
//       },
//       tabActive2: function() {
//         return {
//         'tab-active': this.isActive === '2'
//         };
//       },
//     },
//     methods: {
//       changeTab: function(num) {
//         this.isActive = num;
//       },
//     },
//     components: { App }
//   });
// });


// require("../src/pages/vue_index");
// require("../src/pages/mypage");
