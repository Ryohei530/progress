<template>
  <div>
    <div class="user">
      <div class="row">
        <div class="d-flex col-12 mb-3 justify-content-between">
          <div class="d-flex">
            <h2>1ヶ月の目標一覧</h2>
            <div class="utab ml-3">
              <a href="/monthly_goals/new" class="btn">
                <i class="fas fa-plus"></i>
              </a>
            </div>
          </div>
          <tnav></tnav>
        </div>
      </div>
    </div>
    
    <template v-if="monthly_goals[0]">
      <ul class="goals row justify-content-center justify-content-xl-start">
        <monthly-goal-item 
          v-for="(monthly_goal, index) in monthly_goals" 
          :key="monthly_goal.id"
          :monthly_goal="monthly_goal"
          :monthly_actions="monthly_actions_array[index]"
          ></monthly-goal-item>
      </ul>
    </template>
    <template v-else>
      <div class="goals row justify-content-center justify-content-xl-start">
        <div class="col-md-10 col-xl-6 mb-3 justify-content-center">
          <div class="card">
            <div class="card-body">
              <p>月間目標が未設定です</p>
            </div>
          </div>
        </div>
      </div>
    </template>
  </div>
</template>

<script>
  import Tnav from './Tnav';
  import MonthlyGoalItem from './MonthlyGoalItem';
  import { mapGetters } from 'vuex';
  
  export default {
    data: function() {
      return {
        
      };
    },
    computed: {
      ...mapGetters([
        'data',
        'monthly_goals', 
        'monthly_actions_array', 
      ]),
    },
    components: {
      Tnav,
      MonthlyGoalItem
    }
  };
</script>