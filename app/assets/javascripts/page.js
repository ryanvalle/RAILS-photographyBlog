$(function() {
	$('.tile').hover(function() {
		$(this).find($('.darken')).animate({
			opacity: 0
		},1000)
	}, function() {
		$(this).find($('.darken')).animate({
			opacity: 1
		}, 1000)
	})
})