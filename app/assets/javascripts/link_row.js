// JQuery for placing a link onto table rows with the class "clickableRow".
// Upon clicking these rows, the browser will follow the data-href link.

jQuery(document).ready(function($) {
    $(".clickableRow").click(function() {
        window.document.location = $(this).data("href");
    });
});