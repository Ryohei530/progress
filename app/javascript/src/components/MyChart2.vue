<script>
  import { Bar } from 'vue-chartjs';
  import { mapGetters } from 'vuex';
  
  export default {
    extends: Bar,
    name: 'myChart2',
    data() {
      let storeData = this.$store.getters.chart_data;
      let mAct1stNum = storeData.monthly_actions[0].number;
      let daysOfWeek = storeData.days_of_week;
      let dayDate = storeData.day_date.reverse();
      let dayDone = storeData.day_done.reverse();
      let dayIndicator = Array(daysOfWeek).fill(mAct1stNum, 0, daysOfWeek);
      return {
        data: {
          labels: dayDate,
          datasets: [
            {
              label: '達成値',
              data: dayDone,
              backgroundColor: "rgba(97,213,138, 1)"
            },{
              label: '目標値',
              data: dayIndicator,
              backgroundColor: "rgba(130,201,169,0.5)"
            }
          ]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                suggestedMax: 100,
                suggestedMin: 0,
                stepSize: 10,
                callback: function(value, index, values){
                  return  value +  ''
                }
              }
            }]
          },
        },
      }
    },
    mounted() {
      this.renderChart(this.data, this.options);
    }
  };
</script>