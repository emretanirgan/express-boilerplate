//Creates a Person
Person = function( params ) {
	GameObject.call( this, params );
}
Person.prototype = clone(GameObject.prototype);
Person.prototype.constructor = Squirrel;