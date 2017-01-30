
function buttonClick() {
  document.getElementById("fetch-data").innerHTML = "Loading..." 
}


$( function() {
  $( "#datepicker" ).datepicker({
    dateFormat: "yy-mm-dd"
  });
} );

$( "#datepicker" ).datepicker( "option", "dateFormat", "yy-mm-dd" );

