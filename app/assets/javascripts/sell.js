$(function() {
 
  //セレクトボックスが切り替わったら発動
  $('.drop-area').change(function() {
 
    //選択したvalue値を変数に格納
    var val = $(this).val();
 
    //選択したvalue値をp要素に出力
    $('.drop-area__text').text(val);
  });
});