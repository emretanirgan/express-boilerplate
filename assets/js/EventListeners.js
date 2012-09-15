//Adding Event Listeners and Gravity
    var mousemoveX = 0;
    var mousemoveY = 0;
    var windowHalfX = window.innerWidth / 2;
    var windowHalfY = window.innerHeight / 2;

    onDocumentMouseMove = function ( event ) {
        mouseX = ( event.clientX - windowHalfX );
        mouseY = ( windowHalfY - event.clientY );
	}

	onDocumentMouseDown = function ( event ) {
        event.preventDefault();
        //Creates new vector where the mouse is
        //var vector = new THREE.Vector3( ( event.clientX / window.innerWidth ) * 2 - 1,
        //					-  ( event.clientY / window.innerHeight ) * 2 + 1, 0.5 );
        //projector.unprojectVector( vector, camera );
        //Normalizes it, thanks Max
        //var ray = new THREE.Ray( camera.position, vector.subSelf( camera.position ).
        //	normalize() );

        //if ( intersects1.length > 0 ) {}
	}

	onkeydown = function ( event ) {
		event.preventDefault();
		//Right key clicked
		if ( event.keyCode === 39 ) {
			app.three_test.jean.moveRight();
		}
		if ( event.keyCode === 37 ) {
			app.three_test.jean.moveLeft();
		}
		if ( event.keyCode === 32 ) {
			app.three_test.jean.jump();
		}
	}

	onkeyup = function ( event ) {
		event.preventDefault();
		//Right key clicked
		if ( event.keyCode === 39 ) {
			app.three_test.jean.velocity.x = 0;
		}
		if ( event.keyCode === 37 ) {
			app.three_test.jean.velocity.x = 0;
		}
		if ( event.keyCode === 32 ) {
		//	app.three_test.jean.velocity.y = ;
		}
	}