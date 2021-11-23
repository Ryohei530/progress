/* global Chart */
window.my_chart2 = function() {
  document.addEventListener('turbolinks:load', () => {
    var ctx = document.getElementById("myChart2");
    var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ['1ヶ月目', '2ヶ月目', '3ヶ月目', '4ヶ月目', '5ヶ月目', '6ヶ月目', '7ヶ月目'],
        datasets: [
          {
            label: '達成',
            data: [62, 65, 93, 85, 51, 66, 47],
            backgroundColor: "rgba(97,213,138, 1)"
          },{
            label: '目標',
            data: [55, 45, 73, 75, 41, 45, 58],
            backgroundColor: "rgba(130,201,169,0.5)"
          }
        ]
      },
      options: {
        plugins: {
          title: {
            display: true,
            text: '実績'
          }
        },
        scales: {
          y: {
            ticks: {
              suggestedMax: 100,
              suggestedMin: 0,
              stepSize: 10,
              callback: function(value, index, values){
                return  value +  '回'
              }
            }
          }
        },
      }
    });
  });
}


