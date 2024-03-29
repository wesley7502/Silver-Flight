import SpriteKit

class Boss4: Enemy{  //The Runner
    
    var enemyMovementTimer: Double = 0.0
    var shooterTimer: Double = 0.0
    var shots: Int = 0
    var targetLane: Int = 0
    var di = true
    var squareLane = 0

    
    var turns = true  //go right if true go left if false
    
    var theScene: GameScene?
    
    init(lane: Int, scene: GameScene) {
        
        theScene = scene
        
        let texture = SKTexture(imageNamed: "Boss4")
        super.init(texture: texture, color: UIColor.clearColor(), size: CGSize(width: 53.33, height: 75), givenName: "boss4", points: 120, bd : 0.003, dif: 75, sp: 6, ty : "boss", la: lane)
        
        
        /* Set Z-Position, ensure it's on top of grid */
        zPosition = 3
        
        hitPoints += Double(theScene!.bossLevel) * 80.0
        
        maxHitPoints = hitPoints
        
        squareLane = lane
        
        /* Set anchor point to bottom-left */
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        let enter = SKAction(named: "EpicEnterance")!
        self.runAction(enter)
        
        
    }
    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func enemyAction(currentTime: CFTimeInterval){
        if(enemyMovementTimer == 0.0){
            enemyMovementTimer = currentTime
        }
        if(shooterTimer == 0.0){
            shooterTimer = currentTime
        }
        if self.position.y >= 410{
            self.position.y -= 0.85
        }
        else{
            self.position.y -= 7
        }
        
        if self.position.y <= -25{
            let newPos = Int(arc4random_uniform(6) + 1)
            self.position = CGPoint(x: (Double)(newPos) * 53.33 - 26.665, y: 510)
            if hitPoints <= (maxHitPoints * 2)/3{
                enemyShoot()
            }
        }
        if currentTime - shooterTimer > 1 && hitPoints <= maxHitPoints / 3{
            enemyShoot2()
            shooterTimer = 0.0
        }
        
       
    }
    
    func enemyShoot(){
        let enemyBullet = Boss4Bullet()
        enemyBullet.position = self.position
        enemyBullet.position.x -= 53.33
        theScene?.addChild(enemyBullet)
        theScene?.enemyBulletArray.append(enemyBullet)
        
        let enemyBullet2 = Boss4Bullet()
        enemyBullet2.position = self.position
        enemyBullet2.position.x += 53.33
        theScene?.addChild(enemyBullet2)
        theScene?.enemyBulletArray.append(enemyBullet2)

    }
    
    
    func enemyShoot2(){
        let triangle = Square(lane: 0)
        let enemyPos = Int(arc4random_uniform(6) + 1)
        triangle.position = CGPoint(x: (Double)(enemyPos) * 53.33 - 26.655, y: 600)
        theScene?.addChild(triangle)
        theScene?.enemyArray.append(triangle)
        
    }
    
}