Rat = function( params ) {
	GameObject.call( this, params );
}
Rat.prototype = clone(GameObject.prototype);
Rat.prototype.constructor = Rat;