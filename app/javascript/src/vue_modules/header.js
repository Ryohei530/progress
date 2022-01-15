import Vue from 'vue';

document.addEventListener('DOMContentLoaded', () => {
  const app2 = new Vue({
    el: "#vue-header",
    components: {
    },
    data: () => { 
      return {
        message: "Hello World mypage",
        activeBtn: false,
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
    },
    methods: {
    },
  });
  console.log(app2);
});
