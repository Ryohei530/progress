<template>
  <div class="col-xl-6">
    <li id="`report-${report.id}`" class="card mb-4">
      <div class="card-body">
        <div class="card-wrap">
          <div class="card-ubox">
            <div class="card-avatar">
              <router-link to="/">
                <img :src="data.avatar_url60" alt="" class="_rounded">
              </router-link>
            </div>
            <span class="card-user">
              <router-link to="/">
                {{ user.name }}
              </router-link>
            </span>
          </div>
          <button class="card-rdays btn btn-success">{{ report.r_days }}日目</button>
        </div>
        
        <a :href="`/reports/${report.id}`" class="card-link">
          <div class="card-inner">
            <div class="card-content">
              <div class="aim">
                <p class="aim-tit"><i class="fas fa-crosshairs"></i> 今月の目的</p>
                <p class="aim-txt">{{ monthly_goal.monthly_aim }}</p>
                <p class="aim-tit"><i class="fas fa-tachometer-alt"></i> 今月の目標指標</p>
                <p class="aim-txt">{{ monthly_goal.monthly_indicator }}</p>
              </div>
            
              <div class="action">
                <p class="action-tit"><i class="far fa-star"></i> 今日達成したアクション</p>
                <ul class="action-list">
                  <!--<% rep_acts = report.report_actions %>-->
                  <!--<% actions = report.monthly_goal.goal_actions %>-->
                  <!--<%= actions.zip(rep_acts) do |action, rep_act| %>-->
                  <template v-for="(report_action,index) in report_actions">
                    <li class="action-item">
                      <div class="action-inner">
                        <div class="action-wrap">
                          {{ monthlyActions[index].content }}
                        </div>
                        <div class="action-box">
                          {{ report_action.number }} / {{ monthlyActions[index].number }}
                        </div>
                      </div>
                    </li>
                  </template>
                </ul>
              </div>
              <div class="realize">
                <p class="realize-tit"><i class="far fa-lightbulb"></i> 感想、気付き</p>
                <p>{{ report.content }}</p>
              </div>
              <div class="images">
                <template v-if="report_images">
                  <div class="row">
                    <template v-for="image in report_images">
                      <div class="col-6">
                        <img :src="image" alt="">
                      </div>
                    </template>
                  </div>
                </template>
              </div>
            </div>
          </div>
        </a>
        <div class="card-box">
          <div class="row">
            <div class="col d-flex">
              <span class="card-timestamp">
                <i class="far fa-clock"></i>
                {{ report.created_at | moment }}
              </span>
            </div>
            <div class="col d-flex justify-content-end">
              <div class="card-comment">
                <a href="`/reports/${report.id}`">
                  <i class="far fa-comment"></i>
                  <span>{{ commentCount }}</span>
                </a>
              </div>
              
              <report-likes :report="report"></report-likes>
            </div>
          </div>
        </div>
      </div>
    </li>
  </div>
</template>

<script>
  import moment from 'moment';
  import ReportLikes from './ReportLikes';
  import { mapGetters } from 'vuex';
  export default {
    moment,
    props: ['report', 'report_actions', 'report_images', 'monthly_goal','commentCount',],
    data() {
      return {
      };
    },
    computed: {
      ...mapGetters([
        'data',
        'user', 
        'current_user',
        'monthly_actions_array',
      ]),
      
      monthlyActions() {
        return this.findMonthlyActions(this.monthly_goal);
      },
    },
    methods: {
      findMonthlyActions(monthly_goal) {
        let monthlyActions = this.monthly_actions_array.filter(mArray => {
          return mArray[0].monthly_goal_id == monthly_goal.id;
        });
        return monthlyActions.shift();
      },
    },
    filters: {
      moment: function(date) {
        moment.locale("ja");
        return moment(date).fromNow();
      },
    },
    mounted() {
    },
    components: {
      ReportLikes,
    }
  };
</script>