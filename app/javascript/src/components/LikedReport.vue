<template>
  <div>
    <div class="user">
      <div class="row">
        <div class="d-flex col-12 mb-3 justify-content-between flex-wrap">
          <div class="d-flex">
            <h2>日報</h2>
            <div class="term ml-3">
              <router-link to="/report" class="term-link">
                <button class="tab-item btn">日報</button>
              </router-link>
              <router-link to="/liked_report" class="term-link">
                <button class="tab-item btn">いいねした日報</button>
              </router-link>
              <a v-if="monthly_goals[0]" href="/reports" class="term-link">
                <button class="btn"><i class="fas fa-plus"></i></button>
              </a>
              <a v-else 
                 href="/monthly_goals/new" 
                 class="term-link"
                 @mouseover="mouseOverAction" 
                 @mouseleave="mouseLeaveAction"
              >
                <button class="btn"><i class="fas fa-plus"></i></button>
              </a>
              <p v-show="hoverBtn" class="require-report">日報を投稿するには、月間目標の設定が必要です</p>
            </div>
          </div>
          <tnav></tnav>
        </div>
      </div>
    </div>
    
    <template v-if="liked_reports[0]">
      <ul class="reports row">
        <report-item
          v-for="(report,index) in liked_reports"
          :key="report.id"
          :report="report"
          :user_id="report.user_id"
          :user_obj="userObj(report)"
          :report_actions="liked_report_actions_array[index]"
          :report_images="liked_report_images_array[index]"
          :monthly_goal="filterMGoal(report)"
          :commentCount="commentCount(report)"
        ></report-item>
      </ul>
      <!--<%= paginate @reports %>-->
    </template>
    <template v-else>
      <div class="reports row">
        <div class="col-xl-6">
          <div class="card mb-4">
            <div class="card-body">
              <p>いいねした日報がありません</p>
            </div>
          </div>
        </div>
      </div>
    </template>
  </div>
</template>

<script>
  import Tnav from './Tnav';
  import ReportItem from './ReportItem';
  import { mapGetters } from 'vuex';
  
  export default {
    data: function() {
      return {
        hoverBtn: false,
      };
    },
    computed: {
      ...mapGetters([
        'data',
        'liked_reports',
        'liked_report_users_obj',
        'liked_report_actions_array',
        'liked_report_images_array',
        'monthly_goals',
        'report_comments',
        'liked_report_monthly_goals',
      ]),
    },
    methods: {
      filterMGoal(report) {
        let monthlyGoal = this.liked_report_monthly_goals.filter(mGoal => mGoal.id === report.monthly_goal_id);
        return monthlyGoal.shift();
      },
      commentCount(report) {
        let repComments = this.report_comments.filter(comment => comment.report_id === report.id);
        return repComments.length;
      },
      userObj(report) {
        let userObj = this.liked_report_users_obj.filter(user => user.id === report.user_id);
        return userObj.shift();
      },
      mouseOverAction() {
        this.hoverBtn = true;
      },
      mouseLeaveAction() {
        this.hoverBtn = false;
      }
    },
    components: {
      Tnav,
      ReportItem
    },
    mounted() {
    }
  };
</script>

<style scoped>
  .require-report {
    position: absolute;
    top: -0.2rem;
    left: 23rem;
    color: #7E8299;
    background-color: rgba(236,64,108, 0.1);
    padding: 10px;
    border-radius: 1rem;
  }
</style>