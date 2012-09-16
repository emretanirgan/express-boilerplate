//Creates a Person
Person = function( params ) {
	GameObject.call( this, params );
}
Person.prototype = clone(GameObject.prototype);
Person.prototype.constructor = Person;
Person.prototype.dropOffPos = Math.random() * 300;
/*Person.prototype.dropFood = function(){
	time = Math.random() * 10000;
	dropOffDelay = new TWEEN.Tween({})
	.to({}, time)
	.onComplete(function() {
		    toast = new Food({x: this.position.x, y:0, z:0, vx: 0, vy:0 , vz: 0, w: 50, h: 50});
            scene.add(toast.mesh);
	})*/
Person.prototype.walksRight = true;
Person.prototype.xPos = this.call(position.x);



