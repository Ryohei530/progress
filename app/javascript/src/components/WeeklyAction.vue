<template>
  <div>
    <div v-if="data.monthly_goal" class="action-week">
      <p class="action-tit">週間</p>
      <p>{{ nth_week }}</p>
      <ul class="action-list">
        <template v-for="(m_act, index) in monthly_actions">
          <li class="action-item">
            <div class="action-inner row">
              <div class="action-wrap col-4">
                {{ m_act.content }}
              </div>
              <div class="action-box col-2">
                {{ week_sums[index] }} / {{ weekActNums[index] }}
              </div>
              <div class="action-progress col-6">
                <div class="progress">
                  <div class="progress-bar" role="progressbar" style="`width: ${ratios[index]}%`" aria-valuenow="<%= ratios[index] %>" aria-valuemin="0" aria-valuemax="100">{{ ratios[index] }}%</div>
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
  export default {
    data() {
      return {
        data: this.$store.state.data,
        monthly_actions: this.$store.state.data.monthly_actions,
        nth_week: this.$store.state.data.nth_week,
        week_sums: this.$store.state.data.week_sums.reverse(),
        days_of_week: this.$store.state.data.days_of_week,
        days_of_month: this.$store.state.data.days_of_month
      }
    },
    computed: {
      weekActNums() {
        return this.weekActNumbers();
      },
      ratios() {
        return this.actionRatio();
      }
    },
    methods: {
      weekActNumbers() {
        let weekActNums = [];
        let monthlyActions = this.monthly_actions;
        let daysOfMonth = parseInt(this.days_of_month);
        for (let i = 0; i < monthlyActions.length; i++) {
          let weekActNum = (monthlyActions[i].number / daysOfMonth) * this.days_of_week;
          weekActNums.push(Math.round(weekActNum));
        }
        return weekActNums;
      },
      roundSecondDecimal(num) {
        return Math.round(num * 10) / 10;
      },
      actionRatio() {
        let ratios = [];
        let sums = this.week_sums.reverse();
        let weekActNums = this.weekActNumbers();
        
        for (let index = 0; index < sums.length; index++) {
          let ratioValue = (sums[index] / weekActNums[index] ) * 100;
          let ratio = this.roundSecondDecimal(ratioValue);
          ratios.push(ratio);
        }
        return ratios;
      }
    },
    mounted() {
    }
  };
</script>