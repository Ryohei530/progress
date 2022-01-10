<template>
  <div>
    <div v-if="data.monthly_goal" class="action-day">
      <p class="action-tit">日間</p>
      <ul class="action-list">
        <template v-if="report">
          <template v-for="(m_act, index) in monthly_actions">
            <li class="action-item">
              <div class="action-inner row">
                <div class="action-wrap col-4">
                  {{ m_act.content }}
                </div>
                <div class="action-box col-2">
                  {{ report_actions[index].number }} / {{ dayActNumbers[index] }}
                </div>
                <div class="action-progress col-6">
                  <div class="progress">
                    <div class="progress-bar" role="progressbar" style="`width: ${ratios[index]}%`" aria-valuenow="<%= ratios[index] %>" aria-valuemin="0" aria-valuemax="100">{{ ratios[index] }}%</div>
                  </div>
                </div>
              </div>
            </li>
          </template>
        </template>
        <template v-else>
          <li class="action-item" v-for="(m_act, index) in monthly_actions">
            <div class="action-inner row">
              <div class="action-wrap col-4">
                {{ m_act.content }}
              </div>
              <div class="action-box col-2">
                0 / {{ dayActNumber[index] }}
              </div>
              <div class="action-progress col-6">
                <div class="progress">
                  <div class="progress-bar" role="progressbar" style="width: 0%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100">0%</div>
                </div>
              </div>
            </div>
          </li>
        </template>
      </ul>
    </div>
    <div v-else class="action-day">
      <p class="action-tit">日間</p>
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
        report: this.$store.state.data.latest_report,
        report_actions: this.$store.state.data.latest_report_actions,
        days_of_month: this.$store.state.data.days_of_month
      };
    },
    computed: {
      dayActNumber() {
       return this.dayActNumbers();
      },
      ratios() {
        return this.actionRatio();
      }
    },
    methods: {
      dayActNumbers() {
        let dayActNums = [];
        let monthlyActions = this.monthly_actions;
        let daysOfMonth = parseInt(this.days_of_month);
        for(let i = 0; i < monthlyActions.length; i++) {
          let dayActNum = monthlyActions[i].number / daysOfMonth;
          dayActNums.push(Math.round(dayActNum));
        }
        return dayActNums;
      },
      actionRatio() {
        let ratios = [];
        let repActs = this.report_actions; 
        let dayActNums = this.dayActNumbers();
        for (let index = 0; index < repActs.length; index++) {
          let ratioValue = (repActs[index].number / dayActNums[index] ) * 100;
          let ratio = this.roundSecondDecimal(ratioValue);
          ratios.push(ratio);
        }
        return ratios;
      },
    }
  };
</script>