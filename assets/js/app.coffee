app.add_module 'three_test', ->
   
    camera = new THREE.PerspectiveCamera 75, window.innerWidth / window.innerHeight, 1, 10000
    camera.position.z = 1000

    scene = new THREE.Scene()

    #Test GameObject

    countdown = 100

    personOne = new Person
        x: -500, y:0, z: 0
        vx: 2, vy: 0, vz: 0
        w: 200, h: 600

    game = new GameObject
        x: 0, y: -500, z: 0
        vx: 0, vy: 0, vz: 0
        w: 3000, h: 500

    platformOne = new GameObject
        x: -1000, y: 450, z: 0
        vx: 0, vy:0, vz:0
        w: 400, h: 150

    platformTwo = new GameObject
        x: 700, y: 600, z: 0
        vx: 0, vy:0, vz:0
        w: 500, h: 150

    jean = new Squirrel
        x: 0, y: 500, z: 0
        vx: 0, vy: 0, vz: 0
        w: 200, h: 200

    hotDog = new Food
        x: 600, y:0, z:0
        vx: 0, vy:0 , vz: 0
        w: 50, h: 50

    hungerLevel = new GameObject
        x: -1000, y: 700, z:0
        vx: 0, vvy:0, vz:0
        w: jean.hunger * 20, h:60

    scene.add game.mesh 
    scene.add jean.mesh
    scene.add personOne.mesh
    scene.add platformOne.mesh
    scene.add platformTwo.mesh
    scene.add hotDog.mesh
    scene.add hungerLevel.mesh


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
        direction = jean.intersectPlatform game
        if ( direction == 'DOWN' || direction == 'MIDDLE')
            jean.velocity.y = 0
            jean.intersected = true
            jean.setPosition game.bounds.y
            jean.jumps = 0;


        directionPlatformOne = jean.intersectPlatform platformOne
        if ( directionPlatformOne == 'DOWN' || directionPlatformOne == 'MIDDLE')
            jean.velocity.y = 0
            jean.intersected = true
            jean.setPosition platformOne.bounds.y
            jean.jumps = 0;

        directionPlatformTwo = jean.intersectPlatform platformTwo
        if ( directionPlatformTwo == 'DOWN' || directionPlatformTwo == 'MIDDLE')
            jean.velocity.y = 0
            jean.intersected = true
            jean.setPosition platformTwo.bounds.y
            jean.jumps = 0;

        #The eating interaction
        directionEat = jean.intersect hotDog
        if ( directionEat != 'NONE' & !hotDog.isEaten)
            #console.log(directionEat)
            hotDog.isEaten = true
            scene.remove hotDog.mesh
            jean.hunger += 20
            console.log(jean.hunger)

        #Person - squirrel collision
        directionCrash = jean.intersect personOne

        if ( directionCrash != 'NONE' && !jean.invincible)
            jean.hunger -= 50
            console.log(jean.hunger)
            jean.invincible = true

        if jean.invincible
            countdown -= 1
            console.log('I am invincible!')
        
        if countdown <= 0
            jean.invincible = false
            console.log ('Not anymore:(')
            countdown = 100
                

        #Represent hunger level as the width of the hungerLevel object
        #hungerLevel.size.x = jean.hunger * 20
        #console.log(hungerLevel.size.x)
        #console.log(jean.hunger)


        #test objects moving
        do game.move
        do jean.move
        do personOne.move

        renderer.render scene, camera

    do animate

    { animate, scene, camera, jean, hungerLevel }
