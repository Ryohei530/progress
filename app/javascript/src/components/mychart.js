/* global Chart */
window.my_chart = function() {
  document.addEventListener('turbolinks:load', () => {
    var ctx = document.getElementById("myChart");
    var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ['1ヶ月目', '2ヶ月目', '3ヶ月目', '4ヶ月目', '5ヶ月目', '6ヶ月目', '7ヶ月目'],
        datasets: [
          {
            label: '達成',
            data: ratios,
            backgroundColor: "rgba(97,213,138, 1)"
            // backgroundColor: "rgba(219,39,91,0.5)"
            // backgroundColor: "rgba(227,253,244, 1)"
            // backgroundColor: "rgba(130,201,169,0.5)"
            // backgroundColor: "rgba(255,183,76,0.5)"
          }
        ]
      },
      options: {
        plugins: {
          title: {
            display: true,
            text: '達成度'
          }
        },
        scales: {
          y: {
            ticks: {
              suggestedMax: 100,
              suggestedMin: 0,
              stepSize: 10,
              callback: function(value, index, values){
                return  value +  '%';
              }
            }
          }
        },
      }
    });
  });
}


