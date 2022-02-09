<template>
  <div class="row">
    <div class="col-lg-4 mb-5">
      <div class="card">
        <div class="card-body">
          <div class="d-flex">
            <!--<div class="symbol"></div>-->
            <h4><i class="far fa-calendar-alt"></i> 期間</h4>
          </div>
          <template v-if="data.monthly_goal">
            <p v-if="data.monthly_goal.term_start">{{ data.monthly_goal.term_start | moment('YYYY年MM月DD日') }} から</p>
            <p v-if="data.monthly_goal.term_end">{{ data.monthly_goal.term_end | moment('YYYY年MM月DD日') }} <br>までに目標を達成する</p>
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
          </template>
          <template v-else>
            未設定
          </template>
        </div>
      </div>
    </div>
    <div class="col-lg-4 mb-5">
      <div v-if="data.monthly_goal" class="card">
        <div class="card-body">
          <h4 class="card-title"><i class="fas fa-crosshairs"></i> 今月の目的</h4>
          <template v-if="data.monthly_goal.monthly_aim">
            <p class="ugoal-txt" v-html="$sanitize(textFormat(data.monthly_goal.monthly_aim))"></p>
          </template>
          <template v-else>
            <p class="ugoal-txt">未設定</p>
          </template>
        </div>
      </div>
      <div v-else class="card">
        <div class="card-body">
          <h4 class="card-title"><i class="fas fa-crosshairs"></i> 今月の目的</h4>
          <p class="ugoal-txt">未設定</p>
        </div>
      </div>
    </div>
    <div class="col-lg-4 mb-5">
      <div v-if="data.monthly_goal" class="card">
        <div class="card-body">
          <h4 class="card-title"><i class="fas fa-tachometer-alt"></i> 今月の目標数値</h4>
          <template v-if="data.monthly_goal.monthly_indicator">
            <p class="ugoal-txt" v-html="$sanitize(textFormat(data.monthly_goal.monthly_indicator))"></p>
          </template>
          <template v-else>
            <p class="ugoal-txt">未設定</p>
          </template>
        </div>
      </div>
      <div v-else class="card">
        <div class="card-body">
          <h4 class="card-title"><i class="fas fa-tachometer-alt"></i> 今月の目標数値</h4>
          <p class="ugoal-txt">未設定</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import moment from 'moment';
  import { mapGetters } from 'vuex';
  
  export default {
    moment,
    data: function() {
      return {
        dateToday: ''
      }
    },
    computed: {
      ...mapGetters([
        'data',
      ]),
      // parseDate(date) {
      //   return this.$store.getters.parseDate(date)
      // },
      remain() {
        let date = this.data.monthly_goal.term_end
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