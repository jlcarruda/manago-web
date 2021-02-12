var MtgCards = {
	setup: function() {
		$(".tooltiped").mouseover(function(e) {
			let html_injected = `<img src='${$(e.target).closest('.mtg-card').data("imagetooltip")}' class='img-tooltiped'/>`
			$(e.target).tooltip({
				html: true,
				title: html_injected,
				placement: 'auto'
			})
		})
	}
}

$(document).ready(function() {
	MtgCards.setup()
})