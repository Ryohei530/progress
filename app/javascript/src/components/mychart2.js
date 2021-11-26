/* global Chart */
window.my_chart2 = function() {
  document.addEventListener('turbolinks:load', () => {
    var ctx = document.getElementById("myChart2");
    var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: dayDate,
        datasets: [
          {
            label: '達成値',
            data: dayDone,
            backgroundColor: "rgba(97,213,138, 1)"
          },{
            label: '目標値',
            data: dayIndicator,
            backgroundColor: "rgba(130,201,169,0.5)"
          }
        ]
      },
      options: {
        scales: {
          y: {
            ticks: {
              suggestedMax: 100,
              suggestedMin: 0,
              stepSize: 10,
              callback: function(value, index, values){
                return  value +  ''
              }
            }
          }
        },
      }
    });
  });
}


