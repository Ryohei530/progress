<template>
  <div class="user">
    <div class="row">
      <div class="d-flex col-12 mb-3 justify-content-between">
        <div class="d-flex">
          <h2>1ヶ月の目標一覧</h2>
          <div class="utab ml-3">
            <a href="/" class="btn">
              <i class="fas fa-plus"></i>
              <!--new_monthly_goal_path-->
            </a>
          </div>
        </div>
        <tnav></tnav>
      </div>
    </div>
    
    
    <!--<% if @user.monthly_goals.any? %>-->
    <template v-if="data.monthly_goal">
      <ul class="goals row justify-content-center justify-content-xl-start">
        <monthly-goal-item></monthly-goal-item>
      </ul>
    </template>
  </div>
  
  
</template>

<script>
  import Tnav from './Tnav';
  import MonthlyGoalItem from './MonthlyGoalItem';
  
  export default {
    data: function() {
      return {
        data: this.$store.state.data
      };
    },
    components: {
      Tnav,
      MonthlyGoalItem
    }
  };
</script>