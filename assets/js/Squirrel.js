//Creates Squirrel (main player)
Squirrel = function( params ) {
	GameObject.call( this, params );
}

Squirrel.prototype = clone(GameObject.prototype);
Squirrel.prototype.constructor = Squirrel;