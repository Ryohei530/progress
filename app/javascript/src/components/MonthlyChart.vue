<script>
  import { Bar, mixins } from 'vue-chartjs';
  const { reactiveProp } = mixins;
  import { mapGetters } from 'vuex';
  
  export default {
    extends: Bar,
    name: 'monthlyChart',
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
    },
    methods: {
    },
    mounted() {
      this.renderChart(this.chartData, this.options);
    },
    // watch: {
    //   chartData2() {
    //     this.chartData2.update();
    //   }
    // },
  };
</script>