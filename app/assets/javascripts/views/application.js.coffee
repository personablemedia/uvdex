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

UvdV1.VehiclesView = Ember.View.extend(
	didInsertElement: ->
		$("#footer_toggle_favorites_filter").click() if window.favoritesFilterEngaged
		$("#footer_back_link").attr('href', "http://rostmotor.com/")
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
		$("#footer_back_link").attr('href', "/#/")
)

UvdV1.GalleryView = Ember.View.extend(
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
		$(".rsFullscreenIcn").click()
		$("#footer_back_link").attr('href', "/#/")
)
