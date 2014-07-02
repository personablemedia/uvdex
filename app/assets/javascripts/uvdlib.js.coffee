window.UvdLib = {}
UvdLib.numberWithCommas = (x) ->
	x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
