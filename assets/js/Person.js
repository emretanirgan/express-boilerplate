//Creates a Person
Person = function( params ) {
	GameObject.call( this, params );
	this.right = true;
	if (this.velocity.x < 0) {
		this.right = false;
	}
	if(this.right){
		this.foodTime ={1:Math.floor(700*Math.random()),2:Math.floor(100*Math.random()),3:Math.floor(-700*Math.random())}
	} else {
		this.foodTime ={1:Math.floor(-700*Math.random()),2:Math.floor(100*Math.random()),3:Math.floor(700*Math.random())}
		this.mesh.rotation.y = Math.PI;
	}
}
Person.prototype = clone(GameObject.prototype);
Person.prototype.constructor = Person;
Person.prototype.dropOffPos = Math.random() * 300;
Person.prototype.foodNumber = 3;//Math.floor(3*Math.random()+1);
Person.prototype.state = 0;
Person.prototype.maps = {'0':Textures['theo1'].map,
						'1':Textures['theo2'].map,
						'2':Textures['theo3'].map,
						'3':Textures['theo4'].map,}


/*Person.prototype.dropFood = function () {
	var foodItem = new Food ({ x:this.position.x, y:0, z:0, vx:0, vy:0, vz:0, w:50, h:50, map:Textures['hotdog'].map});
	app.three_test.scene.add(foodItem);
}*/
