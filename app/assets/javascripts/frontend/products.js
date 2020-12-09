$(document).ready(function() {
	$('.pin-enter').keyup(function() {
		var pincode = $('.pin-enter').val();
		if (pincode.length == 6) {
			return $.ajax('/products/get_location', {
				type: 'GET',
				dataType: 'script',
				data: { pincode: pincode },
				success: function(data) {
					var returnedData = JSON.parse(data)
					var address = pincode + ", " + returnedData.state + ", " + returnedData.district
					$('.pin-enter').val(address)
				},
				error: function(data) { }
			});
		} //Condition
	})

	// $("#calendar").fullCalendar({
	// 	header: {
	// 		left: 'prev',
	// 		center: 'title',
	// 		right: 'next'
	// 	},
	// });

	// $('#myModal').on('shown.bs.modal', function() {
	// 	$("#calendar").fullCalendar('render');
	// });
	// $('.popover__content').show()
	$('body').click(function(){
		// $('.popover__content').hide()
	})
	$(".popover__title").hover(function() {
		$('.popover__content').show()
	});
	$("#close_cart_container").click(function() {
		$('.popover__content').hide()
	});
	$('.productUpgrade').click(function(){
		// debugger
		$('.productUpgrade').css('border', 'none');
		$(this).css('border', '3px solid #009d43')
		var selectedPrice = $(this).attr('data-upgrade-price')
		var upgradeID = $(this).attr('data-upgrade-id')
		$('.product-price').text(selectedPrice)
		$('#upgradeID').attr('data-upgrade-id', upgradeID)
	})
	$('.extra_field').click(function(){
		var extra_field_id = $(this).val();
		$('#selectedExtraFieldID').attr('data-extra-field-id', extra_field_id)
	})
	$('.imageGalleryThumb').click(function(){
		$('.imageGalleryThumb').css('border', 'none');
		var imgUrl = this.src;
		$('.productBanner').attr('src', imgUrl);
		$(this).css('border', '3px solid #009d43')
	})

	$('.checkout').click(function() {
		var selectedDate = $('.datepicker').val();
		// var timeSlotId = $('.time-slot')
		var pincode = $('.pin-enter').val();
		var upgradeID = $('#upgradeID').attr('data-upgrade-id');
		var extra_field_id = $('#selectedExtraFieldID').attr('data-extra-field-id');
		var checkout_url = $('.checkout').attr('href');
		var new_url = checkout_url + upgradeID + '&' + 'pincode=' + pincode + '&' + 'date=' + selectedDate + '&' + 'extra_field_id=' + extra_field_id
		$('.checkout').attr('href', new_url);
	})

	// // Filters functions
	// $('#gift_type').click(function(){
	// 	var type = $(this).val();
	// 	call_controller('gift_type', type);
	// })

	// $('#filterBycity').click(function() {
	// 	var city = $(this).val();
	// 	call_controller("city", city);
	// })

	// $('#filterByOccasion').click(function() {
	// 	var occasion = $(this).val();
	// 	call_controller('occasion', occasion);
	// })

	$('[id^=price_]').click(function() {
		var price = parseInt($(this).val());
		var gift_type_id = $('#gift-type-id').data('id');
		call_controller(price, gift_type_id);
	})

	window.review_star = function(star_id){
    $("#stars_id").val(star_id)
    $("#review_star_1").css("color", "#f5bb1b");
      $("#review_star_2").css("color", "black");
      $("#review_star_3").css("color", "black");
      $("#review_star_4").css("color", "black");
      $("#review_star_5").css("color", "black");
    if(star_id == 1){
      $("#review_star_1").css("color", "#f5bb1b");
      $("#review_star_2").css("color", "black");
      $("#review_star_3").css("color", "black");
      $("#review_star_4").css("color", "black");
      $("#review_star_5").css("color", "black");
    }else if (star_id == 2){
      $("#review_star_1").css("color", "#f5bb1b");
      $("#review_star_2").css("color", "#f5bb1b");
      $("#review_star_3").css("color", "black");
      $("#review_star_4").css("color", "black");
      $("#review_star_5").css("color", "black");
    }else if(star_id == 3){
      $("#review_star_1").css("color", "#f5bb1b");
      $("#review_star_2").css("color", "#f5bb1b");
      $("#review_star_3").css("color", "#f5bb1b");
      $("#review_star_4").css("color", "black");
      $("#review_star_5").css("color", "black");
    }else if(star_id == 4)
    {
      $("#review_star_1").css("color", "#f5bb1b");
      $("#review_star_2").css("color", "#f5bb1b");
      $("#review_star_3").css("color", "#f5bb1b");
      $("#review_star_4").css("color", "#f5bb1b");
      $("#review_star_5").css("color", "black");

    }else if (star_id == 5){
      $("#review_star_1").css("color", "#f5bb1b");
      $("#review_star_2").css("color", "#f5bb1b");
      $("#review_star_3").css("color", "#f5bb1b");
      $("#review_star_4").css("color", "#f5bb1b");
      $("#review_star_5").css("color", "#f5bb1b");
    }
  }

  window.submit_review= function(){
  	window.location.href= '/my-account/orders'
  	window.setTimeout(function(){location.reload()},2000)
  }

});

// Filter Ajax call function
function call_controller(price, gift_type_id) {
	return $.ajax('/gift_types/sorting', {
		type: 'GET',
		dataType: 'script',
		data: { 
			price: price,
			gift_type_id: gift_type_id
		},
		success: function(data) {
			console.log("DATA:", data)
		},
		error: function(data) { }
	});
}








