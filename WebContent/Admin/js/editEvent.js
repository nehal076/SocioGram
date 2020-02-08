$( document ).ready(function() {
  $('#editableTable').SetEditable({
	  columnsEd: "0,1,2",
	  onEdit: function(columnsEd) {
        var empId = columnsEd[0].childNodes[1].innerHTML;
        var empName = columnsEd[0].childNodes[3].innerHTML;
        var gender = columnsEd[0].childNodes[5].innerHTML;
        var age = columnsEd[0].childNodes[7].innerHTML;
        var skills = columnsEd[0].childNodes[9].innerHTML;
		var address = columnsEd[0].childNodes[11].innerHTML;
		$.ajax({
			type: 'POST',			
			url : "action.php",	
			dataType: "json",					
			data: {id:empId, name:empName, gender:gender, age:age, skills:skills, address:address, action:'edit'},			
			success: function (response) {
				if(response.status) {
				}						
			}
		});
	  },
	  onBeforeDelete: function(columnsEd) {
	  var empId = columnsEd[0].childNodes[1].innerHTML;
	  $.ajax({
			type: 'POST',			
			url : "action.php",
			dataType: "json",					
			data: {id:empId, action:'delete'},			
			success: function (response) {
				if(response.status) {
				}			
			}
		});
	  },
	});
});