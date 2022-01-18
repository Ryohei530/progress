import { mapState } from 'vuex';

export default {
  created() {
    
  },
  methods: {
    textFormat(value) {
      return value.replace(/\n/g, '<br/>');
    },
  },
  // computed: mapState({
  //   data: state => state.data
  // })
};