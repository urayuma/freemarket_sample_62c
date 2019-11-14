window.addEventListener('load', function(){
    $('.active').click(function(){
    
        $('.report-area-info').show();
        $('.report-area-todo').hide();
        $(".active-line").css("background-color","#ea532d");
        $(".past-line").css("background-color","#EEE");
        $(".active").css("background-color","#fff");
        $(".past").css("background-color","#EEE");
      });
        
      $('.past').click(function(){
        
        $('.report-area-todo').show();
        $('.report-area-info').hide();
        $(".active-line").css("background-color","#EEE");
        $(".past-line").css("background-color","#ea532d");
        $(".past").css("background-color","#fff");
        $(".active").css("background-color","#EEE");
      });
    });