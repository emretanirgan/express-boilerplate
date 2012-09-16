Food = function( params ){
	GameObject.call( this, params);
	this.time = params.time
	this.bounds.x-=40;
	this.bounds.z+=40;
}

Food.prototype = clone(GameObject.prototype);
Food.prototype.constructor = Food

Food.prototype.isEaten = false;


FoodTextures = []
FoodTextures.push(Textures['hotdog'].map)
FoodTextures.push(Textures['cheesesteak'].map)
FoodTextures.push(Textures['chicken'].map)
FoodTextures.push(Textures['toast'].map)
FoodTextures.push(Textures['pizza'].map)