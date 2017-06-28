$(document).ready(function () {
    $('#Cuit').on('focusout', function () {
        $('#Cuit').mask('00-00000000-0');
    });
});