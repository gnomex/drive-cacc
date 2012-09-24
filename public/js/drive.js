// Add a new disciplone
$("#btn-add-discipline").click(function() {
	name = $("#new-discipline").val();

	$.ajax({
	  type: "POST",
	  url: "/discipline",
	  data: { name: name },
	  success: function(data){
	  	// Append a new table row at the end with new discipline
	  	$("#table-disciplines").find("tbody")
				.append($("<tr>")
					.attr("id", data._id)
					.append($("<td>")
						.text(data.name)
					)
					.append($("<td>")
						.append($("<button>")
							.attr("class", "btn btn-mini btn-danger btn-rm-discipline")
							.attr("id", data.id)
							.text("Deletar")
						)
					)
				);

			// Clean input value
			$("#new-discipline").val("");
	  }
	});
});

// Remove a discipline by id
$(".btn-rm-discipline").live("click",function() {
	id = $(this).closest("tr").attr("id");

	$.ajax({
		type: "DELETE",
		url: "/discipline",
		data: { id: id },
		success: function(data){
			$("#" + data._id).remove();
		}
	});
});

// Add a new disciplone
$("#btn-add-teacher").click(function() {
	name = $("#new-teacher").val();

	$.ajax({
	  type: "POST",
	  url: "/teacher",
	  data: { name: name },
	  success: function(data){
	  	// Append a new table row at the end with new discipline
	  	$("#table-teachers").find("tbody")
				.append($("<tr>")
					.attr("id", data._id)
					.append($("<td>")
						.text(data.name)
					)
					.append($("<td>")
						.append($("<button>")
							.attr("class", "btn btn-mini btn-danger btn-rm-teacher")
							.attr("id", data.id)
							.text("Deletar")
						)
					)
				);

			// Clean input value
			$("#new-teacher").val("");
	  }
	});
});


// Remove a discipline by id
$(".btn-rm-teacher").live("click",function() {
	id = $(this).closest("tr").attr("id");

	$.ajax({
		type: "DELETE",
		url: "/teacher",
		data: { id: id },
		success: function(data){
			$("#" + data._id).remove();
		}
	});
});