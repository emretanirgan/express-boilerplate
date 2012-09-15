Textures = {
	'squirrel' : {src:'img/squirrelimg.png', map:undefined},
	/*'squirrel' : {src:'img/squirrelimg.png', map:undefined},
	'squirrel' : {src:'img/squirrelimg.png', map:undefined},
	'squirrel' : {src:'img/squirrelimg.png', map:undefined},
	'squirrel' : {src:'img/squirrelimg.png', map:undefined},
	'squirrel' : {src:'img/squirrelimg.png', map:undefined},
	'squirrel' : {src:'img/squirrelimg.png', map:undefined},*/
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