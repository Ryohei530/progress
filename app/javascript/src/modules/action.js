/* global $ */

document.addEventListener("turbolinks:load", function() {
  $(function() {
    var index = $('.js-file-group').length;
    $('.add-form-btn').on('click', function() {
      var input =
         `<div class="js-file-group" id="goal_action_${index}">
            <div class="row">
              <div class="col-8">
                <label class="action-tit my-3" for="monthly_goal_goal_actions_attributes_${index}_content">
                  <i class="fas fa-clipboard-list"></i> 月間アクション
                </label>          
              </div>  
              <div class="col-3">
                <label class="action-tit my-3" for="monthly_goal_goal_actions_attributes_${index}_number">
                  <i class="fas fa-sort-numeric-up-alt"></i> 数値
                </label>            
              </div>
            </div>
            
            <div class="row">
              <div class="col-8">
                <input class="form-control" type="text" name="monthly_goal[goal_actions_attributes][${index}][content]" id="monthly_goal_goal_actions_attributes_${index}_content">
              </div>
              <div class="col-3">
                <input class="form-control" type="number" name="monthly_goal[goal_actions_attributes][${index}][number]" id="monthly_goal_goal_actions_attributes_${index}_number">
              </div>
              <div class="col-1 px-0 pt-1">
                <span class="btn btn-outline-danger delete-form-btn" data-id="${index}" data-default="default">
                  <i class="fas fa-times"></i>
                </span>
              </div>
            </div>
          </div>`;
          
      $('.action').append(input);
      index ++;
    });
  
    $('.action').on('click', '.delete-form-btn', function() {
      var inputId = $(this).data('id');
      var defaultData = $(this).data('default');
      if (defaultData == 'default') {
        $(this).prev().prop('checked', true);
        $('#goal_action_' + inputId).hide();
      }else{
        $('#goal_action_' + inputId).remove();
      }
    });
  });
});
