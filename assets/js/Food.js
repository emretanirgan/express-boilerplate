Food = function( params ){
	GameObject.call( this, params);
	this.time = params.time
	this.bounds.x-=40;
	this.bounds.z+=40;
}

Food.prototype = clone(GameObject.prototype);
Food.prototype.constructor = Food

Food.prototype.isEaten = false;
