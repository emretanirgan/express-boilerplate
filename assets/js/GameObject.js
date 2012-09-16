//Defines new Game Object
GameObject = function( params ) {
	this.position = new THREE.Vector3 ( params.x, params.y, params.z );
	this.velocity = new THREE.Vector3 ( params.vx, params.vy, params.vz );
	this.size = new THREE.Vector2 ( params.w, params.h );
	this.bounds = new THREE.Vector4 ( params.x-params.w/2, params.y+params.h/2, params.x + params.w/2, params.y - params.h/2);
	//var material = new THREE.MeshLambertMaterial ({ map : params.map, transparent : true });
	var material = new THREE.MeshLambertMaterial ({color:0xFF0000, transparent : true, side:THREE.DoubleSide });
	if (params.map) {
		material.map = params.map;
		material.color.setHex(0xFFFFFF);
		//console.log('mapped');
		//debugger;
	} 
	var geom = new THREE.PlaneGeometry ( params.w, params.h,0,0 );
	this.mesh = new THREE.Mesh ( geom, material);
	//this.mesh.doublesided = true;
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
	},
	
	intersect : function( object ) {
		
		if (this.bounds.z + this.velocity.x<object.bounds.x + object.velocity.x||
			this.bounds.w + this.velocity.y>object.bounds.y + object.velocity.y||
			this.bounds.x + this.velocity.x>object.bounds.z + object.velocity.x||
			this.bounds.y + this.velocity.y<object.bounds.w + object.velocity.y) {
			return 'NONE';
		} else if ( this.bounds.z < object.bounds.x && this.bounds.z + this.velocity.x >= object.bounds.x + object.velocity.x ) {
			return 'RIGHT';
		} else if ( this.bounds.w > object.bounds.y && this.bounds.w + this.velocity.y <= object.bounds.y + object.velocity.y ){
			return 'DOWN';
		} else if ( this.bounds.x > object.bounds.z && this.bounds.x + this.velocity.x <= object.bounds.z + object.velocity.x ){
			return 'LEFT';
		} else if ( this.bounds.y < object.bounds.w && this.bounds.y + this.velocity.y >= object.bounds.w + object.velocity.y ){
			return 'TOP';
		} else {
			return 'MIDDLE';
		}

		/*var dx = object.position.x + object.size.x / 2 - ( this.position.x + this.size.x / 2 );
		var dy = object.position.y + object.size.y / 2 - ( this.position.y + this.size.y / 2 );
		var theta = Math.atan( dx, dy );
		var disTheta = Math.atan( this.size.x, this.size.y );

		if ( -disTheta <= theta && theta <= disTheta ) {
			return 'RIGHT';
		}
		if ( disTheta <= theta && theta <= Math.PI - disTheta ) {
			return 'DOWN';
		}
		if ( Math.PI - disTheta <= theta || theta <= disTheta - Math.PI ) {
			return 'LEFT';
		}
		if ( disTheta - Math.PI <= theta && theta <= disTheta ) {
			return 'UP';
		}*/
	}
}


clone = function( object ) {
	function tempConstructor(){};
	tempConstructor.prototype = object;
	return new tempConstructor;
}