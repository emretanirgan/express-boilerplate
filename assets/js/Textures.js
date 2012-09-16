Textures = {
	'squirrel' : {src:'img/squirrelimg.png', map:undefined},
	'flyingsquirrel' : {src:'img/flyingsquirrel.png', map:undefined},
	'cheesesteak' : {src:'img/cheesesteak.png', map:undefined},
	'chicken' : {src:'img/chicken.png', map:undefined},
	'hotdog' : {src:'img/hotdog.png', map:undefined},
	'pizza' : {src:'img/pizza.png', map:undefined},
	'toast' : {src:'img/toast.png', map:undefined},
	'rat' : {src:'img/rat.png', map:undefined}
	'theoone' : {src: 'img/theo1.png', map:undefined},
	'theotwo' : {src: 'img/theo2.png', map:undefined},
	'theothree' : {src: 'img/theo3.png', map:undefined},
	'theofour' : {src: 'img/theo4.png', map:undefined},
    /*'maxone' : {src: '', map:undefined},
	'maxtwo' : {src: '', map:undefined},
	'maxthree' : {src: '', map:undefined},
	'maxfour' : {src: '', map:undefined},
	'emreone' : {src: '', map:undefined},
	'emretwo' : {src: '', map:undefined},
	'emrethree' : {src: '', map:undefined},
	'emrefour' : {src: '', map:undefined},
	'background' : {src: '', map:undefined},
	'tree1' : {src: '', map:undefined},
	'tree2' : {src: '', map:undefined}*/

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