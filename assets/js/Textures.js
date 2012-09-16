Textures = {
	'squirrel' : {src:'img/squirrelimg.png', map:undefined},
	'flyingsquirrel' : {src:'img/flyingsquirrel.png', map:undefined},
	'cheesesteak' : {src:'img/cheesesteak.png', map:undefined},
	'chicken' : {src:'img/chicken.png', map:undefined},
	'hotdog' : {src:'img/hotdog.png', map:undefined},
	'pizza' : {src:'img/pizza.png', map:undefined},
	'toast' : {src:'img/toast.png', map:undefined},
	'rat' : {src:'img/rat.png', map:undefined},
	'background' : {src:'img/background.png', map:undefined},
	'collegehall' : {src:'img/collegehall.png', map:undefined},
	'emre1' : {src:'img/emre1.png', map:undefined},
	'emre2' : {src:'img/emre2.png', map:undefined},
	'emre3' : {src:'img/emre3.png', map:undefined},
	'emre4' : {src:'img/emre4.png', map:undefined},
	'theo1' : {src:'img/theo1.png', map:undefined},
	'theo2' : {src:'img/theo2.png', map:undefined},
	'theo3' : {src:'img/theo3.png', map:undefined},
	'theo4' : {src:'img/theo4.png', map:undefined},
	'max1' : {src:'img/max1.png', map:undefined},
	'max1' : {src:'img/max1.png', map:undefined},
	'max1' : {src:'img/max1.png', map:undefined},
	'max1' : {src:'img/max1.png', map:undefined}
}

preLoadTextures = function() {
	var loadCount = 0;
	for (var t in Textures) {
		loadCount++;
	}
	for (var t in Textures) {
		loadCount--;
		Textures[t].map = THREE.ImageUtils.loadTexture(Textures[t].src,{},function(){});
	}
}