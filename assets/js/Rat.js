Rat = function( params ) {
	GameObject.call( this, params );
	if (this.velocity.x < 0) {
		this.mesh.rotation.y = Math.PI;
	}
}
Rat.prototype = clone(GameObject.prototype);
Rat.prototype.constructor = Rat;