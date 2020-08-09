//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require toastr
//= require turbolinks
//= require admin/bootstrap
//= require admin/datatables
//= require jquery_nested_form
//= require select2
//= require_tree .

$(document).on('turbolinks:load', function() {
	$('.select2').select2();
	$('#day_delivery_field').hide();
	$('#product_day_delivery').change(function() {
		var checkboxVal = $(this).is(':checked');
		$('#day_delivery_field').toggle(checkboxVal);
	});
})