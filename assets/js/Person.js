//Creates a Person
Person = function( params ) {
	GameObject.call( this, params );
}
Person.prototype = clone(GameObject.prototype);
Person.prototype.constructor = Person;
Person.prototype.dropOffPos = Math.random() * 300;
Person.prototype.foodNumber = Math.floor(3*Math.random()+1);
Person.prototype.foodTime ={1:Math.floor(700*Math.random()),2:Math.floor(100*Math.random()),3:Math.floor(-700*Math.random())}
/*Person.prototype.dropFood = function () {
	var foodItem = new Food ({ x:this.position.x, y:0, z:0, vx:0, vy:0, vz:0, w:50, h:50, map:Textures['hotdog'].map});
	app.three_test.scene.add(foodItem);
}*/
