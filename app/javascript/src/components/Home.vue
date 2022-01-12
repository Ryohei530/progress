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
              <!--<%= month_calendar do |date| %>-->
              <!--  <%= date.day %>-->
                
              <!--  <% if @rday_dates.any? { |rday_date| rday_date == date } %>-->
              <!--    <%= image_tag 'mark_sumi.png', size: '30x30' %>-->
              <!--  <% end %>-->
                
              <!--  <% if date == @goal.term_end %>-->
              <!--  <div class="calendar-wrap">-->
              <!--    <i class="fas fa-hourglass-end"></i>-->
              <!--    <span>目標締切日</span>-->
              <!--  </div>-->
              <!--  <% end %>-->
                
              <!--  <% if @monthly_goal.present? && date == @monthly_goal.term_end %>-->
              <!--    <div class="calendar-wrap">-->
              <!--      <i class="fas fa-hourglass-end"></i>-->
              <!--      <span>今月の目標締切日</span>-->
              <!--    </div>-->
              <!--  <% end %>-->
                
              <!--<% end %>-->
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
                  <button class="tab-item tab-active btn">月間</button>
                  <button class="tab-item btn">週間</button>
                </div>
              </div>
            </div>
          </div>
          <div class="card-body">
            <div class="d-flex flex-wrap flex-md-nowrap justify-content-center justify-content-md-start">
              <div class="chart-wrap mr-3">
                <ul class="chnav nav flex-md-column nav-pills">
                  <li class="nav-item mb-3">
                    <a class="nav-link">
                      アクション１
                    </a>
                  </li>
                  <li class="nav-item mb-3">
                    <a class="nav-link">
                      アクション２
                    </a>
                  </li>
                  <li class="nav-item mb-3">
                    <a class="nav-link">
                      アクション３
                    </a>
                  </li>
                  <li class="nav-item mb-5">
                    <a class="nav-link">
                      アクション４
                    </a>
                  </li>
                </ul>
              </div>
              <div class="tab-content chart-content">
                <div class="tab-box box-show">
                  <div class="d-flex justify-content-center mb-5">
                    <div class="px-3">
                      <span class="text-muted">平均</span>
                      <span class="d-block">
                        {{ weekAve }}
                      </span>
                    </div>
                    <div class="px-3">
                      <span class="text-muted">達成</span>
                      <span class="d-block">
                        {{ data.week_sums[0] }}
                        <!--<%= @week_sums.first %>-->
                      </span>
                    </div>
                    <div class="px-3">
                      <span class="text-muted">目標</span>
                      <span class="d-block">
                        {{ weekActNumber }}
                      </span>
                    </div>
                    <div class="px-3">
                      <span class="text-muted">不足</span>
                      <span class="d-block">
                        <template v-if="lack > 0">
                          +{{ lack }}
                        </template>
                        <template v-else>
                          {{ lack }}
                        </template>
                      </span>
                    </div>
                  </div>
                  <div class="tab-chart">
                    <my-chart2></my-chart2>
                  </div>
                </div>
                <div class="tab-box"></div>
                <div class="tab-box"></div>
                <div class="tab-box"></div>
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
                  <div class="card-text"> {{ data.post.content }}</div>
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
  import MyChart2 from './MyChart2';
  import PostLikes from './PostLikes';
  
  export default {
    data: function() {
      // let stateData = this.$store.state.data;
      return {
        // data: stateData,
        // user: stateData.user,
        tabIsActive: '1',
        tab2IsActive: '1',
      };
    },
    computed: {
      ...mapGetters([
        'data',
        'user', 
        'weekAve',
        'cardLink',
        'weekActNumber',
        'lack'
      ]),
      // user() {
      //   return this.$store.getters.user;
      // },
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
    },
    methods: {
      changeTab(num) {
        this.tabIsActive = num;
      },
      changeTab2(num) {
        this.tab2IsActive = num;
      },
    },
    mounted() {
      // this.$store.dispatch('getData')
      //   .then(response => {
      //     this.$store.commit('setData', response.data);
      //     this.data = response.data;
      //     this.user = response.data.user;
      //     console.log(response);
      //     console.log(response.data);
      //   });
      console.log("mounted");
      console.log(this.data.goal);
      console.log(this.data.monthly_goal);
      console.log(this.user);
      console.log(this.data.post);
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
      MyChart2,
      PostLikes,
    }
  };
</script>