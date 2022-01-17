<template>
  <div>
    <div v-if="data.monthly_goal" class="action-week">
      <p class="action-tit">週間</p>
      <p>{{ nth_week }}</p>
      <ul class="action-list">
        <template v-for="(m_act, index) in monthly_actions">
          <li class="action-item">
            <div class="action-inner row">
              <div class="action-wrap col-5">
                {{ m_act.content }}
              </div>
              <div class="action-box col-4 col-lg-2">
                {{ week_sums[index] }} / {{ weekActNumbers[index] }}
              </div>
              <div class="action-progress col-lg-5 mb-2 mb-lg-0">
                <div class="progress">
                  <div class="progress-bar" role="progressbar" :style="`width: ${ratios[index]}%`" :aria-valuenow="ratios[index]" aria-valuemin="0" aria-valuemax="100">{{ ratios[index] }}%</div>
                </div>
              </div>
            </div>
          </li>
        </template>
      </ul>
    </div>
    <div v-else class="action-week">
      <p class="action-tit">週間</p>
      <p>未設定</p>
    </div>
  </div>
</template>

<script>
  import { mapGetters } from 'vuex';
  export default {
    data() {
      return {
      }
    },
    computed: {
      ...mapGetters([
        'data',
        'monthly_actions', 
        'nth_week',
        'week_sums',
        'days_of_week',
        'days_of_month',
        
      ]),
      weekActNumbers() {
        let weekActNums = [];
        let monthlyActions = this.monthly_actions;
        let daysOfMonth = parseInt(this.days_of_month);
        let daysOfWeek = parseInt(this.days_of_week);
        for (let i = 0; i < monthlyActions.length; i++) {
          let weekActNum = (monthlyActions[i].number / daysOfMonth) * daysOfWeek;
          weekActNums.push(Math.round(weekActNum));
        }
        return weekActNums;
      },
      ratios() {
        let ratios = [];
        let sums = this.week_sums;
        let weekActNums = this.weekActNumbers;
        
        for (let index = 0; index < sums.length; index++) {
          let ratioValue = (sums[index] / weekActNums[index] ) * 100;
          let ratio = this.roundSecondDecimal(ratioValue);
          ratios.push(ratio);
        }
        return ratios;
      }
    },
    methods: {
      roundSecondDecimal(num) {
        return Math.round(num * 10) / 10;
      },
    },
    mounted() {

    }
  };
</script>