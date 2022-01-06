<template>
  <div>
    <div class="user">
      <div class="row">
        <div class="d-flex col-12 mb-3 justify-content-between flex-wrap">
          <div class="d-flex">
            <h2>日報</h2>
            <div class="term ml-3">
              <!--<%= link_to  report_user_path(@user), class: "term-link" do %>-->
              <a href="" class="term-link">
                <button class="btn">日報</button>
              </a>
              <!--<%= link_to  liked_reports_user_path(@user), class: "term-link" do %>-->
              <a href="" class="term-link">
                <button class="btn">いいねした日報</button>
              </a>
              <!--<%= link_to  reports_path, class: "term-link" do %>-->
              <a href="" class="term-link">
                <button class="btn"><i class="fas fa-plus"></i></button>
              </a>
            </div>
          </div>
          <tnav></tnav>
        </div>
      </div>
    </div>
    
    <!--<% if @user.reports.any? %>-->
    <template v-if="data.reports">
      <ul class="reports row">
        <report-item></report-item>
        <!--<%= render partial: 'users/report', collection: @reports %>-->
      </ul>
      <!--<%= paginate @reports %>-->
    </template>
    
    <!--<%= link_to "日報を作成する", new_report_path, class: 'btn btn-outline-primary ml-4' %>-->

  </div>
</template>

<script>
  import Tnav from './Tnav';
  import ReportItem from './ReportItem';
  
  export default {
    data: function() {
      return {
        data: this.$store.state.data
      };
    },
    components: {
      Tnav,
      ReportItem
    }
  };
</script>