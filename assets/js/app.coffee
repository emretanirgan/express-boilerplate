app.add_module 'three_test', ->
   
    camera = new THREE.PerspectiveCamera 75, window.innerWidth / window.innerHeight, 1, 10000
    camera.position.z = 800

    scene = new THREE.Scene()

    

    #Test GameObject

    preLoadTextures()
    eatting = document.createElement('audio')
    eatting.setAttribute('src', 'img/eat.wav')
    eatting.setAttribute('crossorigin', 'anonymous')
    eatting.load();
    intro = document.createElement('audio')
    intro.setAttribute('src', 'img/intro.wav')
    intro.setAttribute('crossorigin', 'anonymous')
    intro.load()
    intro.play()
    startButton = new THREE.Mesh(new THREE.PlaneGeometry(700,350,0,0), new THREE.MeshBasicMaterial({transparent:true}))
    startButton.position.set(375,-350,48)
    scene.add(startButton)

    startMenu = new THREE.Mesh(new THREE.PlaneGeometry(1600,1200,0,0), new THREE.MeshLambertMaterial({map:Textures['start'].map}))
    startMenu.position.set(0,0,50)
    scene.add(startMenu)
    black = new THREE.Mesh(new THREE.PlaneGeometry(3000,3000,0,0), new THREE.MeshBasicMaterial({color:0x000000}))
    black.position.set(0,0,49)
    scene.add(black)
    timer = 0
    countdown = 100
    overMenu = new THREE.Mesh(new THREE.PlaneGeometry(1600,1200,0,0), new THREE.MeshLambertMaterial({map:Textures['over'].map}))
    people = []

    Theos = []
    

    Emres = []

    Maxs = []

    blue = (new THREE.Mesh(new THREE.PlaneGeometry(4000,4000,0,0), new THREE.MeshLambertMaterial({color:0x73C8EC,emissive:0x666666 })))
    blue.position.set(0,0,-500)
    scene.add(blue)

    platforms = []

    platforms.push new GameObject
        x: 0, y: -950, z: -70000
        vx: 0, vy: 0, vz: 0
        w: 3000, h: 500

    platforms.push new GameObject
        x: 0, y: 0, z: -10
        vx: 0, vy: 0, vz: 0
        w: 1700*1.6668, h: 1700
        map: Textures['background'].map
    platforms.push new GameObject
        x: 0, y: 150, z: -400
        vx: 0, vy: 0, vz: 0
        w: 1300*2.7347, h: 1400
        map: Textures['collegehall'].map

    platforms.push new GameObject
        x: -725, y: 0, z: -800
        vx: 0, vy:0, vz:0
        w: 300, h: 150

    platforms.push new GameObject
        x: 675, y: -50, z: -500
        vx: 0, vy:0, vz:0
        w: 300, h: 150

    platforms.push new GameObject
        x: -75, y: 375, z: -600
        vx: 0, vy: 0, vz: 0
        w: 25, h: 100

    jean = new Squirrel
        x: 0, y: 350, z: 0
        vx: 0, vy: 0, vz: 0
        w: 200*1.42604501608, h: 200
        map: THREE.ImageUtils.loadTexture '/img/squirrelimg.png'

    livesLeft = []
    livesLeft.push new GameObject
        x: -1050, y: -580, z: 10
        vx: 0, vy: 0, vz: 0
        w: 40*1.42604501608, h: 40
        map: THREE.ImageUtils.loadTexture '/img/squirrelimg.png'

    livesLeft.push new GameObject
        x: -950, y: -580, z: 10
        vx: 0, vy: 0, vz: 0
        w: 40*1.42604501608, h: 40
        map: THREE.ImageUtils.loadTexture '/img/squirrelimg.png'

    livesLeft.push new GameObject
        x: -850, y: -580, z: 10
        vx: 0, vy: 0, vz: 0
        w: 40*1.42604501608, h: 40
        map: THREE.ImageUtils.loadTexture '/img/squirrelimg.png'

    for life in livesLeft
        scene.add(life.mesh)


    rats = []
    

    foods = []
    FoodTextures = []
    FoodTextures.push(Textures['hotdog'].map)
    FoodTextures.push(Textures['cheesesteak'].map)
    FoodTextures.push(Textures['chicken'].map)
    FoodTextures.push(Textures['toast'].map)
    FoodTextures.push(Textures['pizza'].map)

    TheoStates = []
    TheoStates.push(Textures['theo1'].map)
    TheoStates.push(Textures['theo2'].map)
    TheoStates.push(Textures['theo3'].map)
    TheoStates.push(Textures['theo4'].map)
    
    EmreStates = []
    EmreStates.push(Textures['emre1'].map)
    EmreStates.push(Textures['emre2'].map)
    EmreStates.push(Textures['emre3'].map)
    EmreStates.push(Textures['emre4'].map)
    
    MaxStates = []
    MaxStates.push(Textures['max1'].map)
    MaxStates.push(Textures['max2'].map)
    MaxStates.push(Textures['max3'].map)
    MaxStates.push(Textures['max4'].map)

    for peeps in Theos
        people.push(peeps)
    for peeps in Emres
        people.push(peeps)
    for peeps in Maxs
        people.push(peeps)

    for plat in platforms 
        #if plat.mesh.material.map
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

    ###
    geometry = new THREE.CubeGeometry 200, 200, 200
    material = new THREE.MeshBasicMaterial
        color: 0xFF6699 #0xff0000
        wireframe: true 

    
    mesh = new THREE.Mesh geometry, material
    scene.add mesh
    ###
   
    renderer = new THREE.WebGLRenderer()
    renderer.setSize window.innerWidth, window.innerHeight

    canvas = document.createElement("canvas")
    canvasMat = new THREE.MeshBasicMaterial({ map: new THREE.Texture(canvas), transparent: true });
    canvas.width = 75
    canvas.height = 50       
    canvasContext = canvas.getContext("2d")
    canvasContext.font = '30px "Tekton Pro" bold'
    canvasContext.fillStyle = "rgba( 255, 255, 255, 1 )"
    canvasContext.fillText(0, 15 ,40 )
                
    canvasMat.map.needsUpdate = true
    p = new THREE.PlaneGeometry(canvas.width, canvas.height, 1, 1)
    text = new THREE.Mesh(p, canvasMat)
    text.position.set(-750,-580, 10)
    scene.add(text)

    
    hungerBar = document.createElement("canvas")
    hungerBarMat = new THREE.MeshBasicMaterial({ map: new THREE.Texture(hungerBar), transparent: true });
    hungerBar.width = 800
    hungerBar.height = 40       
    hungerBarContext = hungerBar.getContext("2d")
    hungerBarContext.fillStyle = "rgba( 255, 255, 255, 1 )"
    hungerBarContext.fillRect( 0,0,800 ,40 )
                
    hungerBarMat.map.needsUpdate = true
    hungerBarMesh = new THREE.Mesh(new THREE.PlaneGeometry(hungerBar.width, hungerBar.height, 1, 1), hungerBarMat)
    hungerBarMesh.position.set(650,-580, 10)
    scene.add(hungerBarMesh)
    
    document.body.appendChild renderer.domElement

    document.addEventListener( 'mousemove', onDocumentMouseMove, true );
    document.addEventListener( 'mousedown', onDocumentMouseDown, true );
    document.addEventListener( 'keydown', onkeydown, true );
    document.addEventListener( 'keyup', onkeyup, true );

    animate = ->
        # note: three.js includes requestAnimationFrame shim
        requestAnimationFrame animate


        if (jean.started)
            if (!jean.startRemoved) 
                scene.remove(startMenu)
                scene.remove(black)
                intro.pause()
            timer++
            divisor = Math.pow(timer,1/6)
            if(divisor > 200) 
                divsor = 200
            
            if (1 > Math.random()*450/divisor) 
                hacker = Math.floor(Math.random()*3)
                veloc = 3 + Math.random()
                xPos = -1000 -200*Math.random()
                yPos = -400 - 100*Math.random()
                if (Math.round(Math.random()) == 0)
                    veloc*=-1
                    xPos*=-1
                if (hacker == 0)
                    temp = new Person
                        x: xPos, y:yPos, z: 4
                        vx: veloc, vy: 0, vz: 0
                        w: 600*.68133, h: 600
                        map: Textures['theo1'].map
                    Theos.push temp
                    people.push temp
                    scene.add(temp.mesh)
                    console.log hacker
                else if (hacker == 1)
                    temp = new Person
                        x: xPos, y:yPos, z: 4
                        vx: veloc, vy: 0, vz: 0
                        w: 600*.68133, h: 600
                        map: Textures['emre1'].map
                    Emres.push temp
                    people.push temp
                    scene.add(temp.mesh)
                    console.log hacker
                else if (hacker == 2) 
                    temp =  new Person
                        x: xPos, y:yPos, z: 4
                        vx: veloc, vy: 0, vz: 0
                        w: 600*.68133, h: 600
                        map: Textures['max1'].map
                    Maxs.push temp
                    people.push temp
                    scene.add(temp.mesh)
                    console.log hacker

            if (1 > Math.random()*900) 
                veloc = 3 + Math.random()*2
                xPos = -1700 - Math.random()*200
                yPos = -600 - 150 * Math.random()
                if (Math.round(Math.random()) == 0)
                    veloc*=-1
                    xPos*=-1

                temp = new Rat
                    x: xPos, y: yPos, z: 6
                    vx: veloc, vy:0, vz:0
                    w: 3.23272*100, h: 100
                    map: Textures['rat'].map
                rats.push temp
                scene.add(temp.mesh)
            

                
            
            ###
            mesh.rotation.x += 0.01
            mesh.rotation.y += 0.02
            ###
            
            #test intersection
            jean.intersected = false
            for plat in platforms
                direction = jean.intersectPlatform plat
                if ( !plat.mesh.material.map)
                    if ( direction == 'DOWN' || direction == 'MIDDLE')
                        jean.velocity.y = 0
                        jean.intersected = true
                        jean.setPosition plat.bounds.y
                        jean.jumps = 0;
            

            

            #The squirrel - eating interaction
            for nibbles in foods
                directionEat = jean.intersect nibbles
                nibbles.mesh.material.opacity = (nibbles.time+600 - timer)/200
                if timer - nibbles.time >600 
                    nibbles.isEaten = true
                    scene.remove nibbles.mesh
                else if ( directionEat != 'NONE' & !nibbles.isEaten)
                    eatting.play()
                    nibbles.isEaten = true
                    scene.remove nibbles.mesh
                    jean.hunger += 5
                    jean.points += 10;

            #Person - squirrel collision
            
            for peeps in people
                if Math.abs(peeps.position.x) > 2000
                    scene.remove(peeps.mesh)
                directionCrash = jean.intersect peeps
                if ( directionCrash != 'NONE' && !jean.invincible)
                    jean.hunger -= 30
                    jean.invincible = true
                    if ( jean.velocity.x>0)
                        jean.red = 1
                    else
                        jean.red = 1

                    
            #Rat - foods interaction
            for meanRat in rats
                if Math.abs(meanRat.position.x) > 2000
                    scene.remove(meanRat.mesh)
                for bytes in foods
                    directionRatEat = meanRat.intersect bytes
                    if ( directionRatEat != 'NONE' & !bytes.isEaten)
                      bytes.isEaten = true
                      scene.remove bytes.mesh

            #Rat - squirrel interaction

            for meanRat in rats
                directionRatCrash = jean.intersect meanRat
                if ( directionRatCrash != 'NONE' && !jean.invincible)
                    jean.hunger -= 15
                    jean.invincible = true
                    if ( jean.velocity.x>0)
                        jean.red = 1
                    else
                        jean.red = 1

            if jean.invincible
                countdown -= 1
            
            if countdown <= 0
                jean.invincible = false
                countdown = 100

            #Food dropping
                
            for peeps in people
                dropNow = false
                if (peeps.right)
                    dropNow = peeps.foodTime[peeps.foodNumber]<peeps.position.x
                else 
                    dropNow = peeps.foodTime[peeps.foodNumber]>peeps.position.x
                foodNum = Math.floor(Math.random()*5)
                if (peeps.foodNumber>0 && dropNow)
                    yPos = -600 - 100*Math.random()
                    foodItem = new Food
                        x: peeps.position.x, y:-550, z: 2
                        vx:0, vy:0, vz:0
                        w:50, h:50
                        map: FoodTextures[foodNum]
                        time: timer
                    scene.add foodItem.mesh 
                    foods.push foodItem
                    peeps.foodNumber--

            


            
            


            #test objects moving
            for plat in platforms 
                do plat.move

            for peeps in Theos
                do peeps.move
                peeps.state++
                if (peeps.state%60 == 0)
                    peeps.mesh.material.map = TheoStates[0]
                else if (peeps.state%60 == 15)
                    peeps.mesh.material.map = TheoStates[1]
                else if (peeps.state%60 == 30)
                    peeps.mesh.material.map = TheoStates[2]
                else if (peeps.state%60 == 45)
                    peeps.mesh.material.map = TheoStates[3]

            for peeps in Emres
                do peeps.move
                peeps.state++
                if (peeps.state%60 == 0)
                    peeps.mesh.material.map = EmreStates[0]
                else if (peeps.state%60 == 15)
                    peeps.mesh.material.map = EmreStates[1]
                else if (peeps.state%60 == 30)
                    peeps.mesh.material.map = EmreStates[2]
                else if (peeps.state%60 == 45)
                    peeps.mesh.material.map = EmreStates[3]

            for peeps in Maxs
                do peeps.move
                peeps.state++
                if (peeps.state%60 == 0)
                    peeps.mesh.material.map = MaxStates[0]
                else if (peeps.state%60 == 15)
                    peeps.mesh.material.map = MaxStates[1]
                else if (peeps.state%60 == 30)
                    peeps.mesh.material.map = MaxStates[2]
                else if (peeps.state%60 == 45)
                    peeps.mesh.material.map = MaxStates[3]

                 

            for rat in rats 
                do rat.move

            do jean.move

            #Represent hunger level as the width of the hungerLevel object
            #hungerLevel.size.x = jean.hunger * 20
            #console.log(hungerLevel.size.x)
            #console.log(jean.hunger)

            canvasContext.clearRect(0, 0, canvas.width, canvas.height);
            canvasContext.fillText(jean.points, 15 ,40 )
            canvasMat.map.needsUpdate = true
            if (jean.hunger<=0) 
                jean.lives--
                if (jean.lives <0)
                    
                    overMenu.position.set(0,0,51)
                    scene.add(overMenu)
                    camera.position.x = 0;
                    camera.position.y=0;
                    scene.add(black)
                    jean.started = false;
                    jean.red = 0;
                    jean.lives = 3
                    jean.points = 0
                    timer = 0
                    jean.setPosition(0)
                    for life in livesLeft
                        scene.add(life.mesh)
                    for peeps in people
                        scene.remove(peeps.mesh)
                    for meanRat in rats
                        scene.remove(meanRat.mesh)
                    for bits in foods
                        scene.remove(bits.mesh)

                    people = []
                    rats = []
                    foods = []
                    Theos = []
                    Emres = []
                    Maxs = []
                else
                    scene.remove(livesLeft[jean.lives].mesh)
                jean.hunger = 80

            if (jean.hunger>80) 
                jean.hunger = 80


            jean.hunger-=.025
            hungerBarContext.clearRect( 0,0,800 ,40 )
            hungerBarContext.fillRect( 0,0,jean.hunger*10 ,40 )
            hungerBarMat.map.needsUpdate = true

            if(jean.red>0) 
                jean.red -=.02
            jean.mesh.material.color.setRGB(1, 1-jean.red, 1-jean.red)

            camera.position.x += (jean.position.x/16- camera.position.x)*.05;
            text.position.x = -750+camera.position.x;
            hungerBarMesh.position.x = 650+camera.position.x;
            livesLeft[0].mesh.position.x = -1050 + camera.position.x
            livesLeft[1].mesh.position.x = -950 + camera.position.x
            livesLeft[2].mesh.position.x = -850 + camera.position.x
            camera.position.y += (jean.position.y/4- camera.position.y)*.02;
            text.position.y = -580+camera.position.y;
            hungerBarMesh.position.y = -580+camera.position.y;
            livesLeft[0].mesh.position.y = -580 + camera.position.y
            livesLeft[1].mesh.position.y = -580 + camera.position.y
            livesLeft[2].mesh.position.y = -580 + camera.position.y

        

        renderer.render scene, camera

    do animate

    { animate, scene, camera, jean, startButton, overMenu}
