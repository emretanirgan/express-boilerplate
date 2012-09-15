//Defines new Game Object
GameObject = function( params ) {
	this.position = new THREE.Vector3 ( params.x, params.y, params.z );
	this.velocity = new THREE.Vector3 ( params.vx, params.vy, params.vz );
	this.size = new THREE.Vector2 ( params.w, params.h );
	this.bounds = new THREE.Vector4 ( params.x, params.y, params.x + params.w, params.y - params.h);
	//var material = new THREE.MeshLambertMaterial ({ map : params.map, transparent : true });
	var material = new THREE.MeshLambertMaterial ({color:0xFF0000, transparent : true });
	var geom = new THREE.PlaneGeometry ( params.w, params.h );
	this.mesh = new THREE.Mesh ( geom, material );
	this.mesh.position.set(this.position.x /*+ params.w / 2*/, this.position.y /*+ params.h / 2*/, this.position.z);
	//console.log("made a gameobject!!!!!!!!!!!!!!");
}

GameObject.prototype = {
	move : function() {
		this.position.addSelf(this.velocity);
		this.mesh.position.addSelf(this.velocity);
		this.bounds.x += this.velocity.x;
		this.bounds.y += this.velocity.y;
		this.bounds.z += this.velocity.x;
		this.bounds.w += this.velocity.y;
	}
}

clone = function( object ) {
	function tempConstructor(){};
	tempConstructor.prototype = object;
	return new tempConstructor;
}