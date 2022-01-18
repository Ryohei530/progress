<script>
  import { Bar } from 'vue-chartjs';
  import { mapGetters } from 'vuex';
  
  export default {
    extends: Bar,
    name: 'myChart2',
    data() {
      let storeData = this.$store.getters.chart_data;
      let daysOfWeek = storeData.days_of_week;
      let daysOfMonth = storeData.days_of_month;
      let mAct1stNum = storeData.monthly_actions[0].number;
      let dayIndicator = Math.ceil(mAct1stNum / daysOfMonth)
      let dayDate = storeData.day_date;
      let dayDones = storeData.day_done.reverse();
      let dayIndicators = Array(daysOfWeek).fill(dayIndicator, 0, daysOfWeek);
      let axisMax = Math.ceil(dayIndicator * 2 / 10) * 10
      return {
        data: {
          labels: dayDate,
          datasets: [
            {
              label: '達成値',
              data: dayDones,
              backgroundColor: "rgba(97,213,138, 1)"
            },{
              label: '目標値',
              data: dayIndicators,
              backgroundColor: "rgba(130,201,169,0.5)"
            }
          ]
        },
        options: {
          scales: {
            yAxes: [{
              ticks: {
                suggestedMax: axisMax,
                suggestedMin: 0,
                stepSize: axisMax / 10,
                // suggestedMax: 100,
                // suggestedMin: 0,
                // stepSize: 10,
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
    },
    computed: {
      
    },
  };
</script>