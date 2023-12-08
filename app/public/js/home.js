$.ajax({
        url: 'http://localhost:8888/api/parcoure', // Replace with your PHP route that returns JSON data
        type: 'POST', // Use GET method to retrieve data
        dataType: 'json', // Expected data type is JSON
        success: function(response) {
            // The 'response' variable holds the JSON data returned by the server
            console.log("response"); // Log the response to the console
            
            // You can handle the received data here, for example:
            // Loop through the data and do something
            $.each(response, function(index, item) {
                // Access each item in the JSON data and do something with it
                console.log(item); // Log each item to the console
                // Perform actions using the 'item' data
            });
        },
        error: function(xhr, status, error) {
            // Handle errors here
            console.error(xhr.responseText);
        }
    });