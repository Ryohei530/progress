/* eslint no-console: 0 */
// Run this example by adding <%= javascript_pack_tag 'hello_vue' %> (and
// <%= stylesheet_pack_tag 'hello_vue' %> if you have styles in your component)
// to the head of your layout file,
// like app/views/layouts/application.html.erb.
// All it does is render <div>Hello Vue</div> at the bottom of the page.

// import Vue from 'vue'
// import App from '../app.vue'

// document.addEventListener('DOMContentLoaded', () => {
//   const app = new Vue({
//     render: h => h(App)
//   }).$mount()
//   document.body.appendChild(app.$el)

//   console.log(app)
// })


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
import TurbolinksAdapter from 'vue-turbolinks';
import '@mdi/font/css/materialdesignicons.css';
import '@fortawesome/fontawesome-free/css/all.css';
import Vue from 'vue/dist/vue.esm';
import Vuetify from 'vuetify';
import "vuetify/dist/vuetify.min.css";
import App from '../app.vue';

Vue.use(TurbolinksAdapter);
Vue.use(Vuetify);
const vuetify = new Vuetify({
  icons: {
    iconfont: 'mdi', // default - only for display purposes
    iconfont: 'fa',
  },
});

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    vuetify,
    el: '#vue-app',
    data: () => {
      return {
        message: "Can you say hello?",
        hum: false,
        time: '11:15',
        timeStep: '10:10',
        users: [
          { name:'マイページ', 
            icon: 'fa-user',
          },
          {name: '設定',icon: 'fa-cog'},
          {name: 'ブックマーク一覧',icon: 'fa-bookmark'},
          {name: ""},
          {name: 'ログアウト',icon: 'fa-sign-out-alt'},
        ],
        nav_lists:[
          {
            name: '日報',
            icon: 'mdi-vuetify',
            lists: ['Quick Start', 'Pre-made layouts']
          },
          {
            name: 'つぶやき',
            icon: 'mdi-cogs' 
          },
          {
            name: 'Styles & animations',
            icon: 'mdi-palette',
            lists:['Colors','Content','Display']
          },
          {
            name: 'UI Components',
            icon: 'mdi-view-dashboard',
            lists:['API explorer','Alerts']
          },
          {
            name: 'Directives',
            icon: 'mdi-function'
          },
          {
            name: 'Preminum themes',
            icon: 'mdi-vuetify'
          },
        ]
      };
    },
    components: { App }
  });
});

require("../src/pages/vue_index");