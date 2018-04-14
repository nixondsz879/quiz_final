var csrf = "";
$(function(){
  //$("#questions").select2();
  csrf = $('meta[name="csrf-token"]').attr('content');
  $("#questions").on("change", function() {
    $("#option_preview").hide();

    var question_id = $("#questions").val();
    if(question_id != "") {
      var answer=$("#answer_"+question_id).val();

      var html = "<ol>";
      $(".option_"+question_id).each(function(){
        var temp = this.id.split("_");
        var option_order = temp[1];
        var option = $(this).val();
        var correct = "";
        if(answer == option_order) {
          correct = " (Answer)";
        }
        html += "<li>"+option+correct+"</li>"
      });
      html += "</ol>";

      $("#options").html(html);
      $("#option_preview").show();
    }
  });

  $("#quiz").on("blur", function(){
    if($(this).val() != "") {
      $.ajax({
           type:'POST',
           url:'/validateQuizName',
           data:{
                "_token": csrf,
                "quiz": $("#quiz").val()
           },
           success:function(data){
              if(data > 0) {
                $("#quiz").val("");
                $("#quiz").addClass("has-error");
                $(".error").html("Quiz name already exists");
                $(".error").show();
              }
           }
        });
    }
  });

  $("#no_question, #time_limit").keydown(function (e) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ($.inArray(e.keyCode, [46, 8, 9, 27, 13, 110, 190]) !== -1 ||
             // Allow: Ctrl+A, Command+A
            (e.keyCode === 65 && (e.ctrlKey === true || e.metaKey === true)) || 
             // Allow: home, end, left, right, down, up
            (e.keyCode >= 35 && e.keyCode <= 40)) {
                 // let it happen, don't do anything
                 return;
        }
        // Ensure that it is a number and stop the keypress
        if ((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) {
            e.preventDefault();
        }
    });
});

function addQuestion() {
  

  if($("#noData").length > 0) {
    var sr = 1;
    var list = questionRow(sr)
    $("#questionTable tbody").html(list);
  } else {
    var sr = $("#questionTable tbody tr").length + 1;
    var list = questionRow(sr)
    $("#questionTable tbody").append(list);
  }
}

function questionRow(sr) {
  var question_id = $("#questions").val();
  var question = $("#questions option:selected").text();
  var list = "<tr id='questionTd_"+sr+"'>"+
                  "<td>"+sr+"</td>"+
                  "<td>"+question+"</td>"+
                  "<td><button type='button' onclick='removeQuestion("+sr+");'>Remove</buton><input type='hidden' class='questionId' id='questionId_"+sr+"' name='questionId[]' value='"+question_id+"' /></td>"+
                "</tr>";
  return list;
}

function removeQuestion(sr) {
  $("#questionTd_"+sr).remove();
  if($(".questionId").length == 0) {
    $("#questionTable tbody").html('<tr id="noData"><td colspan="3">No questions added</td></tr>');
  } else {
    var list="";
    var sr = 1;
    $("#questionTable tbody tr").each(function() {
      var id = this.id.split("_")[1];
      var question_id = $("#questionId_"+id).val();
      var question = $("#questions option[value='"+question_id+"']").text();
      list += "<tr id='questionTd_"+sr+"'>"+
                  "<td>"+sr+"</td>"+
                  "<td>"+question+"</td>"+
                  "<td><button type='button' onclick='removeQuestion("+sr+");'>Remove</buton><input type='hidden' class='questionId' id='questionId_"+sr+"' name='questionId[]' value='"+question_id+"' /></td>"+
                "</tr>";
      sr++;          
    });
    $("#questionTable tbody").html(list);
  }
}

function validate() {
  var valid=true;
  $(".form-control").removeClass("has-error");
  $(".error").hide();
  if($("#quiz").val() == "") {
    $("#quiz").addClass("has-error");
    valid = false;
  }
  if($("#no_question").val() == "") {
    $("#no_question").addClass("has-error");
    valid = false;
  }
  if($("#time_limit").val() == "") {
    $("#time_limit").addClass("has-error");
    valid = false;
  }


  
  if(!valid) {
    $(".error").html("Please enter the fields marked in red.");
    $(".error").show();
    return false;
  } else {
    if($("#no_question").val() < 5) {
      $("#no_question").addClass("has-error");
      $(".error").html("Ther should be at least 5 number questions");
      $(".error").show();
      return false;
    }

    if($(".questionId").length > $("#no_question").val()) {
      $(".error").html("Selected question count exceeds the Number of Questions");
      $(".error").show();
      return false;
    } else if($(".questionId").length < $("#no_question").val()) {
      $(".error").html("Selected question count is less then Number of Questions");
      $(".error").show();
      return false;
    }
  }
}