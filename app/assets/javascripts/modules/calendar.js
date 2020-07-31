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
            dayClick: function(date, allDay, jsEvent, view){
                $(this).blur() ;	//ボタンからフォーカスを外す
                if($("#modal-overlay")[0]) return false ;
                
                $("body").append('<div id="modal-overlay"></div>');
      
                $("#modal-overlay").fadeIn("normal");
                $("#event-dialog").fadeIn("normal");
                function centeringModalSyncer(){

                    //画面(ウィンドウ)の幅を取得し、変数[w]に格納
                    var w = $(window).width();
                
                    //画面(ウィンドウ)の高さを取得し、変数[h]に格納
                    var h = $(window).height();
                
                    //コンテンツ(#modal-content)の幅を取得し、変数[cw]に格納
                    var cw = $("#event-dialog").outerWidth({margin:true});
                
                    //コンテンツ(#modal-content)の高さを取得し、変数[ch]に格納
                    var ch = $("#event-dialog").outerHeight({margin:true});
                
                    //コンテンツ(#modal-content)を真ん中に配置するのに、左端から何ピクセル離せばいいか？を計算して、変数[pxleft]に格納
                    var dialogleft = ((w - cw)/2);
                
                    //コンテンツ(#modal-content)を真ん中に配置するのに、上部から何ピクセル離せばいいか？を計算して、変数[pxtop]に格納
                    var dialogright = ((h - ch)/2);
                
                    //[#modal-content]のCSSに[left]の値(pxleft)を設定
                    $("#event-dialog").css({"left": pxleft + "px"});
                
                    //[#modal-content]のCSSに[top]の値(pxtop)を設定
                    $("#event-dialog").css({"top": pxtop + "px"});
                }
                $("#modal-overlay,#dialog-close").unbind().click(function(){
                    $("#event-dialog,#modal-overlay").fadeOut("slow",function(){
                      $("#modal-overlay").remove();
                    });
                });
            },
            
            eventClick: function(event) {

                //console.dir(event); オブジェクトの中身をチェック。
                
              var title = prompt('予定を更新してください:');
                
                if(title && title!=""){
                  event.title = title;
                //イベント（予定）の修正
                $('#calendar').fullCalendar('updateEvent', event);
                  }else{
                //イベント（予定）の削除  idを指定して削除。
                $('#calendar').fullCalendar("removeEvents", event.id);
                }
                },
              events: '/events.json',
              //カレンダー上部を年月で表示させる
              titleFormat: 'M YYYY',
              //曜日を日本語表示
              dayNamesShort: ['SUN', 'MON', 'TUE', 'WED', 'THR', 'FRI', 'SAT'],
              //ボタンのレイアウト
              header: {
                  left: 'title',
                  center: '',
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