Food = function( params ){
	GameObject.call( this, params);
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