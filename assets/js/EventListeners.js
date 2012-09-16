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
        projector = new THREE.Projector()
        //Creates new vector where the mouse is
        var vector = new THREE.Vector3( ( event.clientX / window.innerWidth ) * 2 - 1,
        					-  ( event.clientY / window.innerHeight ) * 2 + 1, 0.5 );
        projector.unprojectVector( vector, app.three_test.camera );
        //Normalizes it, thanks Max
        var ray = new THREE.Ray( app.three_test.camera.position, vector.subSelf( app.three_test.camera.position ).
        	normalize() );

        var intersects1 = ray.intersectObjects( [app.three_test.startButton]);

        if ( intersects1.length > 0 ) {
        	if (app.three_test.jean.startRemoved === false) {
        		app.three_test.jean.started = true;
		    	app.three_test.scene.remove(app.three_test.overMenu);
		} else {
			app.three_test.jean.started = true;
		    app.three_test.jean.startRemoved = false;
		    app.three_test.scene.remove(app.three_test.startButton);
		}
        	
        }
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