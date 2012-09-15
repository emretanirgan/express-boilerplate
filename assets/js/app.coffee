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

    console.log(personOne.dropOffPos);

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
        vx: 0, vy:0, vz:0
        w: jean.hunger * 20, h:60

    meanRat = new Rat
        x: -500, y: -50, z: 0
        vx: 5, vy:0, vz:0
        w: 60, h: 100

    scene.add game.mesh 
    scene.add jean.mesh
    scene.add personOne.mesh
    scene.add platformOne.mesh
    scene.add platformTwo.mesh
    scene.add hotDog.mesh
    scene.add hungerLevel.mesh
    scene.add meanRat.mesh


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

        #The squirrel - eating interaction
        directionEat = jean.intersect hotDog
        if ( directionEat != 'NONE' & !hotDog.isEaten)
            #console.log(directionEat)
            hotDog.isEaten = true
            scene.remove hotDog.mesh
            jean.hunger += 20
            console.log(jean.hunger)

        if toast != undefined
            directionToastEat = jean.intersect toast
            if ( directionEat != 'NONE' & !toast.isEaten)
                #console.log(directionEat)
                toast.isEaten = true
                scene.remove toast.mesh
                jean.hunger += 20
                console.log(jean.hunger)

        #Person - squirrel collision
        directionCrash = jean.intersect personOne

        if ( directionCrash != 'NONE' && !jean.invincible)
            jean.hunger -= 50
            console.log(jean.hunger)
            jean.invincible = true
                
        #Rat - food interaction
        directionRatEat = meanRat.intersect hotDog
        if ( directionRatEat != 'NONE' & !hotDog.isEaten)
            hotDog.isEaten = true
            scene.remove hotDog.mesh

        #Rat - squirrel interaction
        directionRatCrash = jean.intersect meanRat
        if ( directionRatCrash != 'NONE' && !jean.invincible)
            jean.hunger -= 20
            console.log(jean.hunger)
            jean.invincible = true

        if jean.invincible
            countdown -= 1
            #console.log('I am invincible!')
        
        if countdown <= 0
            jean.invincible = false
            console.log ('Not anymore:(')
            countdown = 100

        #Food dropping
        if (personOne.dropOffPos = personOne.position.x)
            console.log('Im here!')
            toast = new Food
                x: personOne.x, y:0, z:0
                vx: 0, vy:0 , vz: 0
                w: 50, h: 50
            scene.add toast.mesh


        #Represent hunger level as the width of the hungerLevel object
        #hungerLevel.size.x = jean.hunger * 20
        #console.log(hungerLevel.size.x)
        #console.log(jean.hunger)


        #test objects moving
        do game.move
        do jean.move
        do personOne.move
        do meanRat.move

        renderer.render scene, camera

    do animate

    { animate, scene, camera, jean, hungerLevel }
