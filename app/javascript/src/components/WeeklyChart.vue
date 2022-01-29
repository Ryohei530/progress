<script>
  import { Bar, mixins } from 'vue-chartjs';
  const { reactiveProp } = mixins;
  import { mapGetters } from 'vuex';
  
  export default {
    extends: Bar,
    name: 'weeklyChart',
    mixins: [reactiveProp],
    props: ['options'],
    data() {
      return {
        
      };
    },
    computed: {
      ...mapGetters([
        'data',
        'user', 
        'days_of_week',
        'days_of_month',
        'day_date',
        'day_done',
        'day_dones',
      ]),
      // options() {
      //   let axisMax = this.axisMax;
      //   return {
      //     scales: {
      //       yAxes: [{
      //         ticks: {
      //           suggestedMax: axisMax,
      //           suggestedMin: 0,
      //           stepSize: axisMax / 10,
      //           // suggestedMax: 100,
      //           // suggestedMin: 0,
      //           // stepSize: 10,
      //           callback: function(value, index, values){
      //             return  value +  ''
      //           }
      //         }
      //       }]
      //     },
      //   };
      // },
    },
    methods: {
      // ceilTensPlace(val) {
      //   return Math.ceil(val * 2 / 10) * 10;
      // },
    },
    mounted() {
      this.renderChart(this.chartData, this.options);
    },
  };
</script>