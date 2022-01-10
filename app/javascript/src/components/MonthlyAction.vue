<template>
  <div>
    <div v-if="data.monthly_goal" class="action-month">
      <p class="action-tit">月間</p>
      <ul class="action-list">
        <template v-for="(m_act, index) in monthly_actions">
          <li class="action-item">
            <div class="action-inner row">
              <div class="action-wrap col-5">
                {{ m_act.content }}
              </div>
              <div class="action-box col-2">
                {{ sums[index] }} / {{ m_act.number }}
              </div>
              <div class="action-progress col-5">
                <div class="progress">
                  <div class="progress-bar" role="progressbar" :style="`width: ${ratios[index]}%`" :aria-valuenow="ratios[index]" aria-valuemin="0" aria-valuemax="100">{{ ratios[index] }}%</div>
                </div>
              </div>
            </div>
          </li>
        </template>
      </ul>
    </div>
    <div v-else class="action-month">
      <p class="action-tit">月間</p>
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
        sums: this.$store.state.data.sums.reverse(),
      };
    },
    computed: {
      ratios() {
        return this.actionRatio();
      }
    },
    methods: {
      roundSecondDecimal(num) {
        return Math.round(num * 10) / 10;
      },
      actionRatio() {
        let ratios = [];
        let sums = this.sums.reverse();
        let monthlyActions = this.monthly_actions;
        for (let index = 0; index < sums.length; index++) {
          let ratioValue = (sums[index] / monthlyActions[index].number) * 100;
          let ratio = this.roundSecondDecimal(ratioValue);
          ratios.push(ratio);
        }
        return ratios;
      }
    },
    mounted() {
    },
  };
</script>