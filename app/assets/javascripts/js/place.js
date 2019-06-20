function getPlace(position) {
	let lat = position.coords.latitude;
	let lng = position.coords.longitude;
	$.ajax({
		type: 'POST',
		url: '/places',
		data: {
			place: {
				lat: lat,
				lng: lng
			}
		},
		dataType: 'json'
	})
	.done(function (data) {
		console.log(data)
	});
}
let opt = {
	"enableHighAccuracy": true,
	"timeout": 10000,
	"maximumAge": 0,
}
if (navigator.geolocation) {
	navigator.geolocation.watchPosition(
		getPlace,
		(error) => { console.log(error) },
		opt
	);
}