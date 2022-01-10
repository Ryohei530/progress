<template>
  <div>
    <div class="user">
      <div class="row">
        <div class="d-flex col-12 col-md-10 col-lg-8 offset-md-1 offset-lg-2  mb-3 justify-content-between">
          <div class="d-flex">
            <h2>長期目標</h2>
            <div class="utab ml-3">
              <a href="`/goals/${data.user.id}/edit`" class="btn">
                <i class="far fa-edit ml-1"></i>
                <!--edit_goal_path(@user)-->
              </a>
            </div>
          </div>
          <tnav></tnav>
        </div>
      </div>
    </div>
    
    <template v-if="data.goal.aim">
      <ul class="goals row justify-content-center">
        <goal-item></goal-item>
      </ul>
    </template>
  </div>
</template>

<script>
  import Tnav from './Tnav';
  import GoalItem from './GoalItem';
  
  export default {
    data: function() {
      return {
        data: this.$store.state.data
      };
    },
    components: {
      Tnav,
      GoalItem
    },
  };
</script>