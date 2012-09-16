app.add_module 'three_test', ->
   
    camera = new THREE.PerspectiveCamera 75, window.innerWidth / window.innerHeight, 1, 10000
    camera.position.z = 1000

    scene = new THREE.Scene()

    #Test GameObject

    preLoadTextures()

    countdown = 100
    people = []
    people.push new Person
        x: -500, y:0, z: 0
        vx: 2, vy: 0, vz: 0
        w: 200, h: 600

    platforms = []

    platforms.push new GameObject
        x: 0, y: -500, z: 0
        vx: 0, vy: 0, vz: 0
        w: 3000, h: 500

    platforms.push new GameObject
        x: -1000, y: 450, z: 0
        vx: 0, vy:0, vz:0
        w: 400, h: 150

    platforms.push new GameObject
        x: 700, y: 600, z: 0
        vx: 0, vy:0, vz:0
        w: 500, h: 150

    jean = new Squirrel
        x: 0, y: 500, z: 0
        vx: 0, vy: 0, vz: 0
        w: 200*1.42604501608, h: 200
        map: THREE.ImageUtils.loadTexture '/img/squirrelimg.png'


    rats = []
    rats.push new Rat
        x: -2000, y: -50, z: 0
        vx: 5, vy:0, vz:0
        w: 3.23272*100, h: 100
        map: Textures['rat'].map

    foods = []


    for plat in platforms 
        scene.add plat.mesh

    for peeps in people
        scene.add peeps.mesh

    for rat in rats 
        scene.add rat.mesh

    ###
    scene.add game.mesh 
    
    scene.add personOne.mesh
    scene.add platformOne.mesh
    scene.add platformTwo.mesh
    scene.add meanRat.mesh
    ###
    scene.add jean.mesh

    light = new THREE.PointLight( 0xFFFFFF, 1, 0);
    light.position.z = 2000;
    scene.add(light);


    geometry = new THREE.CubeGeometry 200, 200, 200
    material = new THREE.MeshBasicMaterial
        color: 0xFF6699 #0xff0000
        wireframe: true 
    
    mesh = new THREE.Mesh geometry, material
    scene.add mesh
   
    renderer = new THREE.WebGLRenderer()
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
        for plat in platforms
            direction = jean.intersectPlatform plat
            if ( direction == 'DOWN' || direction == 'MIDDLE')
                jean.velocity.y = 0
                jean.intersected = true
                jean.setPosition plat.bounds.y
                jean.jumps = 0;
        

        

        #The squirrel - eating interaction
        for nibbles in foods
            directionEat = jean.intersect nibbles
            if ( directionEat != 'NONE' & !nibbles.isEaten)
                nibbles.isEaten = true
                scene.remove nibbles.mesh
                jean.hunger += 20

        #Person - squirrel collision
        
        for peeps in people
            directionCrash = jean.intersect peeps
            if ( directionCrash != 'NONE' && !jean.invincible)
                jean.hunger -= 50
                jean.invincible = true
                
        #Rat - foods interaction
        for meanRat in rats
            for bytes in foods
                directionRatEat = meanRat.intersect bytes
                if ( directionRatEat != 'NONE' & !bytes.isEaten)
                  bytes.isEaten = true
                  scene.remove bytes.mesh

        #Rat - squirrel interaction

        for meanRat in rats
            directionRatCrash = jean.intersect meanRat
            if ( directionRatCrash != 'NONE' && !jean.invincible)
                jean.hunger -= 20
                jean.invincible = true

        if jean.invincible
            countdown -= 1
        
        if countdown <= 0
            jean.invincible = false
            countdown = 100

        #Food dropping
            
        for peeps in people
            if (peeps.foodNumber>0 && peeps.foodTime[peeps.foodNumber]<peeps.position.x)
                foodItem = new Food
                    x: peeps.position.x, y:0, z:0
                    vx:0, vy:0, vz:0
                    w:50, h:50
                    map: Textures['hotdog'].map
                scene.add foodItem.mesh 
                foods.push foodItem
                peeps.foodNumber--

        


        #Represent hunger level as the width of the hungerLevel object
        #hungerLevel.size.x = jean.hunger * 20
        #console.log(hungerLevel.size.x)
        #console.log(jean.hunger)


        #test objects moving
        for plat in platforms 
            do plat.move

        for peeps in people
            do peeps.move

        for rat in rats 
            do rat.move

        do jean.move

        

        renderer.render scene, camera

    do animate

    { animate, scene, camera, jean }
