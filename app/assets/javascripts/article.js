$(document).ready(function() {
	var table_height = $("#exif table").height();
	$("#toggle-exif-data").click(function() {
		if ($('#exif').data('open')) {
			$("#exif").animate({
				height: 0
			},1).data("open", false)
		} else {
			$("#exif").animate({
				height: table_height
			},1).data("open", true)
		}
	})
})