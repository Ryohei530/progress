<template>
  <div class="row">
    <div class="col-lg-4 mb-5">
      <div class="card">
        <div class="card-body">
          <div class="d-flex">
            <!--<div class="symbol"></div>-->
            <h4><i class="far fa-calendar-alt"></i> 期間</h4>
          </div>
          <p v-if="data.goal.term_start">{{ data.goal.term_start | moment('YYYY年MM月DD日') }} から</p>
          <p v-if="data.goal.term_end">{{ data.goal.term_end | moment('YYYY年MM月DD日') }} <br>までに目標を達成する</p>
          <div class="remaining">
            <i class="fas fa-hourglass-half"></i> 
            残り日数　
            <template v-if="remain < 0">
              0日
            </template>
            <template v-else>
              {{ remain }}日
            </template>
          </div>
        </div>
      </div>
    </div>
    <div class="col-lg-4 mb-5">
      <div class="card">
        <div class="card-body">
          <h4 class="card-title"><i class="far fa-flag"></i> 目的</h4>
          <template v-if="data.goal.aim">
            <p class="ugoal-txt" v-html="$sanitize(textFormat(data.goal.aim))"></p>
          </template>
          <template v-else>
            <p class="ugoal-txt">未設定</p>
          </template>
        </div>
      </div>
    </div>
    <div class="col-lg-4 mb-5">
      <div class="card">
        <div class="card-body">
          <h4 class="card-title"><i class="far fa-chart-bar"></i> 目標数値</h4>
          <template v-if="data.goal.indicator">
            <p class="ugoal-txt" v-html="$sanitize(textFormat(data.goal.indicator))"></p>
          </template>
          <template v-else>
            <p class="ugoal-txt">未設定</p>
          </template>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import moment from 'moment';
  
  export default {
    moment,
    data: function() {
      return {
        data: this.$store.state.data,
        dateToday: ''
      };
    },
    computed: {
      // parseDate(date) {
      //   return this.$store.getters.parseDate(date)
      // },
      remain() {
        let date = this.data.goal.term_end
        let today = this.data.dateToday
        return moment(date).diff(today, 'days')
      },
    },
    methods: {
      textFormat(value) {
        return value.replace(/\n/g, '<br/>');
      }
    },
    filters: {
      moment(value, format) {
        return moment(value).format(format)
      },
    }
  }
</script>