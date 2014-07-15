$(document).ready(function() {
	$("#toggle-exif-data").click(function() {
		var table_height = $("#exif table").height();
		if ($('#exif').data('open')) {
			$("#exif").animate({
				height: 0
			},500).data("open", false)
		} else {
			$("#exif").animate({
				height: table_height
			},500).data("open", true)
		}
	})
})