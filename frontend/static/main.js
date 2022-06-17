
$(document).ready(function(){

    $("#spotify").click(function() {
        $.get("http://localhost:8000/backend/get-auth-url", function(data, status) {
            console.log("status: " + status);

            window.location.replace(data.url);
        });
    });
  
  });
