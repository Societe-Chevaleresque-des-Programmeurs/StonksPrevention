$.ajax("app/src/Controllers/HomeController.php", {
    url: PHP_AJAX_HANDLER_URI,
    type: 'POST',
    data: {
        which
    }
})