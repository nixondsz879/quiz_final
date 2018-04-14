function validate() {
  var valid=true;
  $(".form-control").removeClass("has-error");
  $(".error").hide();
  if($("#question").val() == "") {
    $("#question").addClass("has-error");
    valid = false;
  }
  if($("#option1").val() == "") {
    $("#option1").addClass("has-error");
    valid = false;
  }
  if($("#option2").val() == "") {
    $("#option2").addClass("has-error");
    valid = false;
  }
  if($("#option3").val() == "") {
    $("#option3").addClass("has-error");
    valid = false;
  }
  if($("#option4").val() == "") {
    $("#option4").addClass("has-error");
    valid = false;
  }

  if(!valid) {
    $(".error").html("Please enter the fields marked in red.");
    $(".error").show();
    return false;
  }
}