<template>
  <div class="user">
    <div class="row">
      <div class="d-flex col-12 mb-3 justify-content-between flex-wrap">
        <div class="d-flex">
          <h2>目標</h2>
          <div class="tab1">
            <div class="tab-list term ml-3">
              <button class="tab-item tab-active btn">長期</button>
              <button class="tab-item btn">月間</button>
              
              <button class="btn" data-toggle="dropdown"><i class="fas fa-ellipsis-h"></i></button>
              <div class="dropdown-menu">
                <router-link to="/" class="dropdown-item">
                  <i class="far fa-edit"></i> 長期目標を編集
                </router-link>
                <router-link to="/" class="dropdown-item">
                  <i class="fas fa-plus mr-1"></i>  月間目標を新規作成
                </router-link>
                <router-link to="/" class="dropdown-item">
                  <i class="far fa-edit"></i> 月間目標を編集
                </router-link>
              </div>
            </div>
          </div>
        </div>
        <tnav></tnav>
      </div>
    </div>
    <!--<div class="tab1-content row">-->
    <!--  <div class="tab-box box-show col-12">-->
    <!--    <div class="row">-->
    <!--      <%= render partial: 'users/goal_tab', locals: { goal: @goal } %>-->
    <!--    </div>-->
    <!--  </div>-->
    <!--  <div class="tab-box col-12">-->
    <!--    <div class="row">-->
    <!--      <%= render partial: 'users/monthly_goal_tab', locals: { monthly_goal: @monthly_goal } %>-->
    <!--    </div>-->
    <!--  </div>-->
    <!--</div>-->
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
              <a href="/" class="btn btn-outline-primary">プロフィールを編集する</a>
              <!--<%= link_to "プロフィールを編集する", edit_user_path(@user), class: "btn btn-outline-primary" %>-->
            </div>
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
                    <button class="tab-item btn bg-btn-gray">月間</button>
                    <button class="tab-item btn bg-btn-gray">週間</button>
                    <button class="tab-item btn bg-btn-gray">日間</button>
                    <a href="">
                      <button class="btn"><i class="far fa-edit"></i></button>
                    </a>
                    <!--<%= link_to edit_monthly_goal_path(@user), class: "" do %>-->
                  </div>
                </div>
              </div>
            </div>
            <div class="card-body">
              <div class="tab2-content">
                <div class="tab-box box-show">
                  <%= render 'users/monthly_action' %>
                </div>
                <div class="tab-box">
                  <%= render 'users/weekly_action' %>
                </div>
                <div class="tab-box">
                  <%= render 'users/daily_action' %>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
/* global location */
  import axios from 'axios';
  import Tnav from './Tnav'
  
  export default {
    data: function() {
      return {
        data: this.$store.state.data,
        user: this.$store.state.user
      }
    },
    created() {
      this.$store.dispatch('getData')
    },
    components: {
      Tnav
    }
  }
</script>