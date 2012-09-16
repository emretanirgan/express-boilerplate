Textures = {
	'squirrel' : {src:'img/squirrelimg.png', map:undefined},
	'flyingsquirrel' : {src:'img/flyingsquirrel.png', map:undefined},
	'cheesesteak' : {src:'img/cheesesteak.png', map:undefined},
	'chicken' : {src:'img/chicken.png', map:undefined},
	'hotdog' : {src:'img/hotdog.png', map:undefined},
	'pizza' : {src:'img/pizza.png', map:undefined},
	'toast' : {src:'img/toast.png', map:undefined},
	'rat' : {src:'img/rat.png', map:undefined}
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