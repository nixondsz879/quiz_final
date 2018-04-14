var csrf = "";
$(function(){
  csrf = $('meta[name="csrf-token"]').attr('content');

  
});



function startQuiz() {
  var valid=true;
  $(".form-control").removeClass("has-error");
  $(".error").hide();
  if($("#name").val() == "") {
    $("#name").addClass("has-error");
    valid = false;
  }
  if($("#number").val() == "") {
    $("#number").addClass("has-error");
    valid = false;
  }
  if($("#email").val() == "") {
    $("#email").addClass("has-error");
    valid = false;
  }
  if($("#quiz").val() == "") {
    $("#quiz").addClass("has-error");
    valid = false;
  }

  if(!valid) {
    $(".error").html("Please enter the fields marked in red.");
    $(".error").show();
    return false;
  } else {

    if($("#quiz").val() != "") {
      $("#details-block").hide();
      $.ajax({
         type:'POST',
         url:'/getQuizQuestions',
         data:{
              "_token": csrf,
              "quiz_id": $("#quiz").val()
         },
         success:function(data){
            var list = "<ol class='question-list'>";
            $.each(data.options, function(i, val){
              
              list += "<li><div>"+val.question+"</div>";
                list += "<div><ul class='option-list'>";
                
              var c=0;
              $.each(val.options, function(j, rows){

                if(c==0){
                  list += "<li style='display:none;'><input type='radio' value='"+j+"|0' name='answer["+i+"]'  checked/></li>";
                }

                list += "<li><div class='radio'>"+
                          "<label><input type='radio' value='"+j+"|"+rows.option_order+"' name='answer["+i+"]' id='answer_"+j+"' /> "+rows.option+"</label>"+
                        "</div></li>";
                c++;
              });
              list += "</ul></div>";
              list +="</li>";
            });
            list += "</ol>";
            list += '<button id="submitQuize" type="submit" class="btn col-md-2" onClick="submitQuiz();">Submit Quiz</button>';
            //console.log(val.question)
            $("#questions-block").html(list);
            $(".timer").show();
            timer(data.quiz.time_limit);
         }
      });
    }
  }
  
}

function timer(timer2) {
  var timer2 = timer2+":01";
  var interval = setInterval(function() {
    var timer = timer2.split(':');
    //by parsing integer, I avoid all extra string processing
    var minutes = parseInt(timer[0], 10);
    var seconds = parseInt(timer[1], 10);
    --seconds;
    minutes = (seconds < 0) ? --minutes : minutes;
    if (minutes < 0){
      $(".timer").html("0:0");
      $(".suspend-quize").show();
      setTimeout(function(){ $("#quizForm").submit(); }, 1000)
      clearInterval(interval);
    } 
    seconds = (seconds < 0) ? 59 : seconds;
    seconds = (seconds < 10) ? '0' + seconds : seconds;
    //minutes = (minutes < 10) ?  minutes : minutes;
    $('.timer').html(minutes + ':' + seconds);
    timer2 = minutes + ':' + seconds;
  }, 1000);
}