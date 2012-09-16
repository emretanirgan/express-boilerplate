Food = function( params ){
	GameObject.call( this, params);
}

Food.prototype = clone(GameObject.prototype);
Food.prototype.constructor = Food

Food.prototype.isEaten = false;