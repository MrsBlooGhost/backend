// application.js

$(function() {

  $("form.delete").submit(function(event) {
    event.preventDefault();
    event.stopPropagation();

    var ok = confirm("Are you sure? This cannot be undone!");
    if (ok) {

      var form = $(this);
      
      $.ajax({
				url: form.attr("action"),
				method: form.attr("method")
			});
    }
  });

});
