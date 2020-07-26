$(function () {
  // 画面遷移を検知
  $(document).on('turbolinks:load', function () {
      if ($('#calendar').length) {

          function Calendar() {
              return $('#calendar').fullCalendar({
              });
          }
          function clearCalendar() {
              $('#calendar').html('');
          }

          $(document).on('turbolinks:load', function () {
              Calendar();
          });
          $(document).on('turbolinks:before-cache', clearCalendar);

          //events: '/events.json', 以下に追加
          $('#calendar').fullCalendar({
              events: '/events.json',
              //カレンダー上部を年月で表示させる
              titleFormat: 'YYYY. M',
              //曜日を日本語表示
              dayNamesShort: ['SUN', 'MON', 'TUE', 'WED', 'THR', 'FRI', 'SAT'],
              //ボタンのレイアウト
              header: {
                  left: '',
                  center: 'title',
                  right: 'today prev,next'
              },
              defaultView: 'month',
              //終了時刻がないイベントの表示間隔
              defaultTimedEventDuration: '03:00:00',
              buttonText: {
                  prev: '<',
                  next: '>',
                  prevYear: '前年',
                  nextYear: '翌年',
                  today: '今日',
                  month: '月',
                  week: '週',
                  day: '日'
              },
              // Drag & Drop & Resize
              editable: true,
              //イベントの時間表示を２４時間に
              timeFormat: "HH:mm",
              //イベントの色を変える
              eventColor: '#87cefa',
              //イベントの文字色を変える
              eventTextColor: '#000000',
              eventRender: function(event, element) {
                  element.css("font-size", "0.8em");
                  element.css("padding", "5px");
              }
          });
      }
  });
});