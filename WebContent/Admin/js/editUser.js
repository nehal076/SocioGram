$(document).ready(function(){
$("#mytable #checkall").click(function () {
        if ($("#mytable #checkall").is(':checked')) {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", true);
            });

        } else {
            $("#mytable input[type=checkbox]").each(function () {
                $(this).prop("checked", false);
            });
        }
    });
    
    $("[data-toggle=tooltip]").tooltip();
});
$(document).on("click", ".open", function () {
     var userid= $(this).data('id');
     var uid=userid.substring(0,userid.indexOf("name"));
      var fname=userid.substring(userid.indexOf("name"),userid.indexOf("lname"));
      var lname=userid.substring(userid.indexOf("lname"),userid.indexOf("email"));
     var email=userid.substring(userid.indexOf("email"),userid.indexOf("dob"));
      var dob=userid.substring(userid.indexOf("dob"),userid.indexOf("loc"));
       var loc=userid.substring(userid.indexOf("loc"),userid.indexOf("pass"));
       var pass=userid.substring(userid.indexOf("pass"));
    $(".modal-body #uid").val( uid );
    $(".modal-body #fname").val( fname.substr(4) );
     $(".modal-body #lname").val( lname.substr(5) );
      $(".modal-body #email").val( email.substr(5) );
        $(".modal-body #loc").val( loc.substr(3) );
       $(".modal-body #dob").val( dob.substr(3) );
         $(".modal-body #pass").val( pass.substr(4) );
         
         
     // As pointed out in comments, 
     // it is unnecessary to have to manually call the modal.
     // $('#addBookDialog').modal('show');
});
$(document).on("click", ".del", function () {
     var userid= $(this).data('id');
      $(".modal-footer #uid").val( userid );
    
});
