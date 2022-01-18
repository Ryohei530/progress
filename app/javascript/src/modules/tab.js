/* global $ */

$(document).on('turbolinks:load', function() {
  $(function() {
    // .tabがクリックされたときを指定
    $('.tab-item').click(function(){
      // 今ある.tab-activeを削除
      $('.tab-active').removeClass('tab-active');
      // クリックされた.tabに.tab-activeを追加
      $(this).addClass('tab-active');
      // tab1やtab2といったクラス名を取得
      var className = $(this).parent().parent().attr('class');
      // 今ある.box-showを削除
      $(`.${className}-content`).find('.box-show').removeClass('box-show');
      // indexに.tabのindex番号を代入
      const index = $(this).index();
      // .tabboxとindexの番号が同じ要素に.box-showを追加
      $(`.${className}-content`).find('.tab-box').eq(index).addClass('box-show');
    });
  });
});