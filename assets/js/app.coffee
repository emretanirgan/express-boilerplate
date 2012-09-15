app.add_module 'three_test', ->
   
    camera = new THREE.PerspectiveCamera 75, window.innerWidth / window.innerHeight, 1, 10000
    camera.position.z = 1000

    scene = new THREE.Scene()

    #Test GameObject
    game = new GameObject
        x: 0, y: -500, z: 0
        vx: 0, vy: 0, vz: 0
        w: 500, h: 500

    jean = new Squirrel
        x: 0, y: 500, z: 0
        vx: 0, vy: 0, vz: 0
        w: 500, h: 500

    scene.add game.mesh 
    scene.add jean.mesh


    geometry = new THREE.CubeGeometry 200, 200, 200
    material = new THREE.MeshBasicMaterial
        color: 0xFF6699 #0xff0000
        wireframe: true 

    mesh = new THREE.Mesh geometry, material
    scene.add mesh

    renderer = new THREE.CanvasRenderer()
    renderer.setSize window.innerWidth, window.innerHeight

    document.body.appendChild renderer.domElement

    document.addEventListener( 'mousemove', onDocumentMouseMove, true );
    document.addEventListener( 'mousedown', onDocumentMouseDown, true );
    document.addEventListener( 'keydown', onkeydown, true );
    document.addEventListener( 'keyup', onkeyup, true );

    animate = ->
        # note: three.js includes requestAnimationFrame shim
        requestAnimationFrame animate

        mesh.rotation.x += 0.01
        mesh.rotation.y += 0.02

        #test intersection
        jean.intersected = false
        direction = jean.intersect( game )
        console.log( direction )
        if ( direction == 'DOWN' || direction == 'MIDDLE')
            jean.velocity.y = 0
            jean.intersected = true

        #test objects moving
        do game.move
        do jean.move

        renderer.render scene, camera

    do animate

    { animate, scene, camera, jean }
