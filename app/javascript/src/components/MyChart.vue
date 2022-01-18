<script>
  import { Bar } from 'vue-chartjs';
  import { mapGetters } from 'vuex';
  
  export default {
    extends: Bar,
    name: 'myChart',
    data() {
      let ratios = this.$store.getters.chart_data.monthly_ratios;
      return {
        data: {
          labels: ['1ヶ月目', '2ヶ月目', '3ヶ月目', '4ヶ月目', '5ヶ月目', '6ヶ月目', '7ヶ月目'],
          datasets: [
            {
              label: '達成',
              data: ratios,
              backgroundColor: "rgba(97,213,138, 1)"
              // backgroundColor: "rgba(219,39,91,0.5)"
              // backgroundColor: "rgba(227,253,244, 1)"
              // backgroundColor: "rgba(130,201,169,0.5)"
              // backgroundColor: "rgba(255,183,76,0.5)"
            }
          ]
        },
        options: {
          title: {
            display: true,
            text: '達成度'
          },
          scales: {
            yAxes: [{
              ticks: {
                suggestedMax: 100,
                suggestedMin: 0,
                stepSize: 10,
                callback: function(value, index, values){
                  return  value +  '%';
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