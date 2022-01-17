<template>
  <div>
    <div v-if="data.monthly_goal" class="action-day">
      <p class="action-tit">日間</p>
      <ul class="action-list">
        <template v-if="report[0]">
          <template v-for="(m_act, index) in monthly_actions">
            <li class="action-item">
              <div class="action-inner row">
                <div class="action-wrap col-5">
                  {{ m_act.content }}
                </div>
                <div class="action-box col-4 col-lg-2">
                  {{ reportActs[index].number }} / {{ dayActNumbers[index] }}
                </div>
                <div class="action-progress col-lg-5 mb-2 mb-lg-0">
                  <div class="progress">
                    <div class="progress-bar" role="progressbar" :style="`width: ${ratios[index]}%`" :aria-valuenow="ratios[index]" aria-valuemin="0" aria-valuemax="100">{{ ratios[index] }}%</div>
                  </div>
                </div>
              </div>
            </li>
          </template>
        </template>
        <template v-else>
          <li class="action-item" v-for="(m_act, index) in monthly_actions">
            <div class="action-inner row">
              <div class="action-wrap col-5">
                {{ m_act.content }}
              </div>
              <div class="action-box col-4 col-lg-2">
                0 / {{ dayActNumbers[index] }}
              </div>
              <div class="action-progress col-lg-5 mb-2 mb-lg-0">
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
  import { mapGetters } from 'vuex';
  export default {
    data() {
      return {
      };
    },
    computed: {
      ...mapGetters([
        'data',
        'monthly_actions', 
        'days_of_month',
      ]),
      report() {
        return this.$store.getters.latest_report;
      },
      reportActs() {
        return this.$store.getters.latest_report_actions;
      },
      dayActNumbers() {
        let dayActNums = [];
        let monthlyActions = this.monthly_actions;
        let daysOfMonth = parseInt(this.days_of_month);
        for(let i = 0; i < monthlyActions.length; i++) {
          let dayActNum = monthlyActions[i].number / daysOfMonth;
          dayActNums.push(Math.ceil(dayActNum));
        }
        return dayActNums;
      },
      ratios() {
        let ratios = [];
        let repActs = this.reportActs; 
        let dayActNums = this.dayActNumbers;
        for (let index = 0; index < repActs.length; index++) {
          let ratioValue = (repActs[index].number / dayActNums[index] ) * 100;
          let ratio = this.roundSecondDecimal(ratioValue);
          ratios.push(ratio);
        }
        return ratios;
      },
    },
    methods: {
      roundSecondDecimal(num) {
        return Math.round(num * 10) / 10;
      },
      mounted() {
      }
    }
  };
</script>