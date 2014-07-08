UvdV1.ApplicationView = Ember.View.extend(
	didInsertElement: ->
		$("button.filter").click( ->
			console.log "JKL"
			$(this).parents('.row').first().find('button').removeClass('active')
			$(this).addClass('active')
		)
		$(".menu_link").click( ->
			$(".mobile_nav").toggle()
		)
		$("#sticker").sticky({topSpacing:0})
)

UvdV1.VehicleView = Ember.View.extend(
	attributeBindings: ["rstmb"]
	didInsertElement: ->
		Ember.run( ->
			$(".royalSlider").empty()
			$("gallery_image").each( ->
				dom_elm = "<img src=#{$(this).attr('src')} data-rsTmb=#{$(this).attr('rstmb')} class='rsImg'>"
				$(".royalSlider").append(dom_elm)
			)
			$(".royalSlider").royalSlider(
				controlNavigation: 'thumbnails'
				imageScaleMode: 'fit-if-smaller'
				navigateByClick: true
				arrowsNav:true
				arrowsNavAutoHide: true
				arrowsNavHideOnTouch: true
				keyboardNavEnabled: true
				fadeinLoadedSlide: true
				imageScalePadding: 4
				thumbs:
					appendSpan: true
					firstMargin: true
					paddingBottom: 4
				fullscreen:
					enabled: true
					nativeFS: true
			)
		)
)
