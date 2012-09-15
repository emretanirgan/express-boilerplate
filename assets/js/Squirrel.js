//Creates Squirrel (main player)
Squirrel = function( params ) {
	GameObject.call( this, params );
}

Squirrel.prototype = clone(GameObject.prototype);
Squirrel.prototype.constructor = Squirrel;

Squirrel.prototype.hunger = 50;
Squirrel.prototype.lives = 3;
Squirrel.prototype.intersected = false;
Squirrel.prototype.move = function() {
		if (!this.intersected){
			this.velocity.y -= 2;
		}
		this.position.addSelf(this.velocity);
		this.mesh.position.addSelf(this.velocity);
		this.bounds.x += this.velocity.x;
		this.bounds.y += this.velocity.y;
		this.bounds.z += this.velocity.x;
		this.bounds.w += this.velocity.y;
	}