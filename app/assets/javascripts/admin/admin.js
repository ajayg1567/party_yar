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

	window.selectVariation = function(){
		var value = $("#variation_category").val()
		if(value == "weight" || value == "size") {
          	$('#product_price').val(null)
          	element = document.getElementById("price_variation")
          	element.classList.add("display-none")

		}else{
			element = document.getElementById("price_variation")
          	element.classList.remove("display-none")
		}
	}
})