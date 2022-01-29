<template>
  <div class="user">
    <div class="row">
      <div class="d-flex col-12 mb-3 justify-content-between flex-wrap">
        <div class="d-flex">
          <h2>目標</h2>
          <div class="tab1">
            <div class="tab-list term ml-3">
              <button @click="changeTab('1')" class="tab-item btn" :class="tabActive1">長期</button>
              <button @click="changeTab('2')" class="tab-item btn" :class="tabActive2">月間</button>
              
              <button class="btn" data-toggle="dropdown"><i class="fas fa-ellipsis-h"></i></button>
              <div class="dropdown-menu">
                <a :href="`/goals/${data.goal.id}/edit`" class="dropdown-item">
                  <i class="far fa-edit"></i> 長期目標を編集
                </a>
                <a href="/monthly_goals/new" class="dropdown-item">
                  <i class="fas fa-plus mr-1"></i>  月間目標を新規作成
                </a>
                <a :href="`/monthly_goals/${data.monthly_goal.id}/edit`" class="dropdown-item">
                  <i class="far fa-edit"></i> 月間目標を編集
                </a>
              </div>
            </div>
          </div>
        </div>
        <tnav></tnav>
      </div>
    </div>
    <div class="tab1-content row">
      <div v-show="tabIsActive === '1'" class="col-12">
        <goal-tab></goal-tab>
      </div>
      <div v-show="tabIsActive === '2'" class="col-12">
        <monthly-goal-tab></monthly-goal-tab>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-4 mb-5">
        <div class="card">
          <div class="card-body">
            <div class="user-avatar">
              <router-link to="/">
                <img :src="data.avatar_url70" alt="" class="_rounded">
              </router-link>
            </div>
            <h1 class="text-center">{{ user.name }}</h1>
            <p class="user-txt">{{ user.bio }}</p>
            <div class="user-edit">
              <a :href="`/users/${user.id}/edit`" class="btn btn-outline-primary">プロフィールを編集する</a>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-8 mb-5">
        <div class="card">
          <div class="card-body">
            <section class="calendar">
              <calendar></calendar>
            </section>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-12 mb-5">
        <div class="card">
          <div class="action">
            <div class="card-header">
              <div class="d-flex justify-content-between">
                <div class="action-title"><i class="fas fa-clipboard-list"></i> アクション</div>
                <div class="tab2">
                  <div class="tab-list term ml-3">
                    <button @click="changeTab2('1')" class="tab-item btn bg-btn-gray" :class="tab2Active1">月間</button>
                    <button @click="changeTab2('2')" class="tab-item btn bg-btn-gray" :class="tab2Active2">週間</button>
                    <button @click="changeTab2('3')" class="tab-item btn bg-btn-gray" :class="tab2Active3">日間</button>
                    <a :href="`/monthly_goals/${data.monthly_goal.id}/edit`">
                      <button class="btn"><i class="far fa-edit"></i></button>
                    </a>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-body">
              <div class="tab2-content">
                <div v-show="tab2IsActive === '1'">
                  <monthly-action></monthly-action>
                </div>
                <div v-show="tab2IsActive === '2'">
                  <weekly-action></weekly-action>
                </div>
                <div v-show="tab2IsActive === '3'">
                  <daily-action></daily-action>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row chart">
      <div class="col-lg-6 mb-5">
        <div class="card">
          <div class="card-header chart-header">
            <h4 class="m-0"><i class="far fa-check-circle"></i> 達成度</h4>
          </div>
          <div class="card-body">
            <my-chart></my-chart>
          </div>
        </div>
      </div>
      <div class="col-lg-6 mb-5">
        <div class="card">
          <div class="card-header chart-header">
            <div class="d-flex align-items-center">
              <h4 class="m-0"><i class="fas fa-trophy"></i> 実績</h4>
              <div class="tab3">
                <div class="tab-list term ml-3">
                  <button @click="changeTab3('1')" class="tab-item btn" :class="tab3Active1">月間</button>
                  <button @click="changeTab3('2')" class="tab-item btn" :class="tab3Active2">週間</button>
                </div>
              </div>
            </div>
          </div>
          <div class="card-body">
            <div class="d-flex flex-wrap flex-md-nowrap justify-content-center justify-content-md-start">
              <div class="chart-wrap mr-3">
                <ul class="chnav nav flex-md-column nav-pills">
                  <li v-for="n in week_sums.length" class="nav-item mb-3">
                    <a @click="getActIndex(n)" class="nav-link">
                      アクション {{ n }}
                    </a>
                  </li>
                </ul>
              </div>
              <div class="tab-content chart-content">
                <div v-show="tab3IsActive === '1'" >
                  <div class="d-flex justify-content-center mb-5">
                    <div class="px-3">
                      <span class="text-muted">平均</span>
                      <span class="d-block">
                        {{ weekAve ? weekAve : 0 }}
                      </span>
                    </div>
                    <div class="px-3">
                      <span class="text-muted">達成</span>
                      <span class="d-block">
                        {{ sums[actionIndex] ? sums[actionIndex] : 0 }}
                        <!--<%= @week_sums.first %>-->
                      </span>
                    </div>
                    <div class="px-3">
                      <span class="text-muted">目標</span>
                      <span class="d-block">
                        {{ mActNumber ? mActNumber : 0 }}
                      </span>
                    </div>
                    <div class="px-3">
                      <span class="text-muted">不足</span>
                      <span class="d-block">
                        <template v-if="lack > 0">
                          +{{ mLack }}
                        </template>
                        <template v-else>
                          {{ mLack ? mLack : 0 }}
                        </template>
                      </span>
                    </div>
                  </div>
                  <div class="tab-chart">
                    <monthly-chart :chart-data="datacollection2"></monthly-chart>
                  </div>
                </div>
                <div v-show="tab3IsActive === '2'">
                  <div class="d-flex justify-content-center mb-5">
                    <div class="px-3">
                      <span class="text-muted">平均</span>
                      <span class="d-block">
                        {{ dayAve ? dayAve : 0 }}
                      </span>
                    </div>
                    <div class="px-3">
                      <span class="text-muted">達成</span>
                      <span class="d-block">
                        {{ week_sums[actionIndex] ? week_sums[actionIndex] : 0 }}
                        <!--<%= @week_sums.first %>-->
                      </span>
                    </div>
                    <div class="px-3">
                      <span class="text-muted">目標</span>
                      <span class="d-block">
                        {{ weekActNumber ? weekActNumber : 0 }}
                      </span>
                    </div>
                    <div class="px-3">
                      <span class="text-muted">不足</span>
                      <span class="d-block">
                        <template v-if="lack > 0">
                          +{{ lack }}
                        </template>
                        <template v-else>
                          {{ lack ? lack : 0 }}
                        </template>
                      </span>
                    </div>
                  </div>
                  <div class="tab-chart">
                    <weekly-chart :chart-data="datacollection"></weekly-chart>
                  </div>
                </div>
                <!--<div class="tab-box"></div>-->
                <!--<div class="tab-box"></div>-->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-6 mb-5 posts">
        <div class="card">
          <template v-if="data.posts">
            <div class="card-header">
              <div class="card-title">最新のつぶやき</div>
            </div>
            <div class="card-body">
              <div class="card-wrap d-flex">
                <div class="card-avatar">
                  <router-link to="/">
                    <img :src="data.avatar_url60" alt="" class="_rounded">
                  </router-link>
                </div>
                <div class="card-title">
                  <router-link to="/">
                    {{ user.name }}
                  </router-link>
                </div>
              </div>
              <a :href="`/posts/${data.post.id}`" class="card-link " :class="cardLink">
                <div class="card-inner">
                  <div class="card-text" v-html="$sanitize(textFormat(data.post.content))"></div>
                  <div class="images">
                    <template v-if="data.post_images">
                      <div class="row">
                        <template v-for="image in data.post_images">
                          <div class="col-6">
                            <img :src="image" alt="">
                          </div>
                        </template>
                      </div>
                    </template>
                  </div>
                </div>
              </a>
              <div class="card-box">
                <div class="row">
                  <div class="col d-flex">
                    <span class="card-timestamp">
                      {{ data.post.created_at | moment }}
                    </span>
                  </div>
                  <div class="col d-flex justify-content-end">
                    <div class="card-comment">
                      <a :href="`/posts/${data.post.id}`">
                        <i class="far fa-comment"></i>
                        <span>{{ data.post_comment_count }}</span>
                      </a>
                    </div>
                    <post-likes :post="data.post"></post-likes>
                  </div>
                </div>
              </div>
            </div>
          </template>
          <template v-else>
            <div class="card-body">
              つぶやきがありません
            </div>
          </template>
        </div>
      </div>
      <div class="col-lg-6 mb-5">
        <div class="card ">
          <div class="card-body">
            coming soon
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
/* global location */
  import axios from 'axios';
  import moment from 'moment';
  import { mapGetters } from 'vuex';
  import Tnav from './Tnav';
  import GoalTab from './GoalTab';
  import MonthlyGoalTab from './MonthlyGoalTab';
  import MonthlyAction from './MonthlyAction';
  import WeeklyAction from './WeeklyAction';
  import DailyAction from './DailyAction';
  import Calendar from './Calendar';
  import MyChart from './MyChart';
  import WeeklyChart from './WeeklyChart';
  import MonthlyChart from './MonthlyChart';
  
  import PostLikes from './PostLikes';
  
  export default {
    data: function() {
      // let stateData = this.$store.state.data;
      return {
        // data: stateData,
        // user: stateData.user,
        tabIsActive: '1',
        tab2IsActive: '1',
        tab3IsActive: '1',
        actionIndex: '0',
      };
    },
    computed: {
      ...mapGetters([
        'data',
        'user', 
        'sums',
        'week_sums',
        'cardLink',
        'weekActNumber',
        'days_of_month',
        'days_of_week',
        'day_date',
        'day_done',
        'day_dones',
        'week_terms',
        'week_dones',
        'monthly_actions',
        'report_actions_array',
      ]),
      // dayActNum() {
      //   return Math.ceil(this.weekActNumber / this.days_of_week);
      // },
      // user() {
      //   return this.$store.getters.user;
      // },
      dayAve() {
        return parseInt(this.week_sums[this.actionIndex] / this.day_done.length);
      },
      weekAve() {
        return parseInt(this.sums[this.actionIndex] / this.report_actions_array.length);
      },
      weekActNumber() {
        let mAct = this.data.monthly_actions[this.actionIndex];
        let daysOfMonth = this.days_of_month;
        let daysOfWeek = this.days_of_week;
        return parseInt((mAct.number / daysOfMonth ) * daysOfWeek);
      },
      mActNumber() {
        return this.monthly_actions[this.actionIndex].number;
      },
      lack() {
        return parseInt(this.week_sums[this.actionIndex] - this.weekActNumber);
      },
      mLack() {
        return parseInt(this.sums[this.actionIndex] - this.mActNumber);
      },
      tabActive1() {
        return {
          'tab-active': this.tabIsActive === '1'
        };
      },
      tabActive2() {
        return {
          'tab-active': this.tabIsActive === '2'
        };
      },
      tab2Active1() {
        return {
          'tab-active': this.tab2IsActive === '1'
        };
      },
      tab2Active2() {
        return {
          'tab-active': this.tab2IsActive === '2'
        };
      },
      tab2Active3() {
        return {
          'tab-active': this.tab2IsActive === '3'
        };
      },
      tab3Active1() {
        return {
          'tab-active': this.tab3IsActive === '1'
        };
      },
      tab3Active2() {
        return {
          'tab-active': this.tab3IsActive === '2'
        };
      },
      mAct1stNum() {
        return this.data.monthly_actions[this.actionIndex].number;
      },
      dayIndicator() {
        return Math.ceil(this.mAct1stNum / this.days_of_month);
      },
      weekIndicator() {
        return this.weekActNumber
      },
      dayIndicators() {
        return Array(this.days_of_week).fill(this.dayIndicator, 0, this.days_of_week);
      },
      weekIndicators() {
        return Array(this.week_terms.length).fill(this.weekIndicator, 0, this.week_terms.length);
      },
      axisMax() {
        return this.ceilTensPlace(this.dayIndicator);
      },
      datacollection() {
        return {
         labels: this.day_date,
          datasets: [
            {
              label: '達成値',
              data: this.day_dones[this.actionIndex],
              backgroundColor: "rgba(97,213,138, 1)"
            },{
              label: '目標値',
              data: this.dayIndicators,
              backgroundColor: "rgba(130,201,169,0.5)"
            }
          ] 
        };
      },
      datacollection2() {
        return {
         labels: this.week_terms,
          datasets: [
            {
              label: '達成値',
              data: this.week_dones[this.actionIndex],
              backgroundColor: "rgba(97,213,138, 1)"
            },{
              label: '目標値',
              data: this.weekIndicators,
              backgroundColor: "rgba(130,201,169,0.5)"
            }
          ] 
        };
      },
    },
    methods: {
      changeTab(num) {
        this.tabIsActive = num;
      },
      changeTab2(num) {
        this.tab2IsActive = num;
      },
      changeTab3(num) {
        this.tab3IsActive = num;
      },
      getActIndex(n) {
        this.actionIndex = (n - 1).toString();
        // console.log("click")
        // console.log(this.actionIndex)
      },
    },
    mounted() {
      console.log("mounted");
      this.$store.state.dateToday = moment(new Date).format('YYYY-MM-DD');
      
    },
    watch: {
      
    },
    filters: {
      moment: function(date) {
        moment.locale("ja");
        return moment(date).fromNow();
      },
    },
    components: {
      Tnav,
      GoalTab,
      MonthlyGoalTab,
      MonthlyAction,
      WeeklyAction,
      DailyAction,
      Calendar,
      MyChart,
      WeeklyChart,
      MonthlyChart,
      PostLikes,
    }
  };
</script>