//Creates Squirrel (main player)
Squirrel = function( params ) {
	GameObject.call( this, params );
}

Squirrel.prototype = clone(GameObject.prototype);
Squirrel.prototype.constructor = Squirrel;

Squirrel.prototype.invincible = false;
Squirrel.prototype.hunger = 80;
Squirrel.prototype.lives = 3;
Squirrel.prototype.points = 0;

Squirrel.prototype.intersected = false;
Squirrel.prototype.jumps = 0;
Squirrel.prototype.switchedMap = true;
Squirrel.prototype.jump = function(){
    if(this.jumps < 4){
    this.velocity.y = 30;
    }
    this.jumps++;
    this.mesh.material.map = Textures['flyingsquirrel'].map
    //console.log('one')
}
Squirrel.prototype.moveRight = function(){
    this.velocity.x = 12;
    this.mesh.rotation.y = 0;
    //console.log('one')
}
Squirrel.prototype.moveLeft = function(){
    this.velocity.x = -12;
    this.mesh.rotation.y = Math.PI;

    //console.log('one')
}
Squirrel.prototype.move = function() {
		if (!this.intersected){
			this.velocity.y -= 1;
            if(this.switchedMap){
                this.mesh.material.map = Textures['flyingsquirrel'].map
                this.mesh.scale.x*=1.2;
                this.mesh.scale.y*=1.2;
                this.switchedMap = false;
            }
		} else {
            if(!this.switchedMap){
                this.mesh.material.map = Textures['squirrel'].map
                this.mesh.scale.x/=1.2;
                this.mesh.scale.y/=1.2;
                this.switchedMap=true;
            }
        }
		this.position.addSelf(this.velocity);
		this.mesh.position.addSelf(this.velocity);
		this.bounds.x += this.velocity.x;
		this.bounds.y += this.velocity.y;
		this.bounds.z += this.velocity.x;
		this.bounds.w += this.velocity.y;
	};
Squirrel.prototype.intersectPlatform = function(object) {
    //console.log('why');
    if(this.velocity.y>0){   //object.platform
        return 'NONE';
    }else if (this.bounds.w - this.velocity.y < object.bounds.y + object.velocity.y){
        return 'NONE';
    }else if (this.bounds.z + this.velocity.x<object.bounds.x + object.velocity.x||
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
};
Squirrel.prototype.setPosition = function(y) {
    this.position.y = y + this.size.y/2;
    this.mesh.position.y = y + this.size.y/2;
    this.bounds.y = y+this.size.y;
    this.bounds.w = y;
}

