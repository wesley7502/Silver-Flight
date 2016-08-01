import SpriteKit

class TrapezoidBullet: EnemyBullet {
    
    init() {
        /* Initialize with 'bubble' asset */
        let texture = SKTexture(imageNamed: "TrapezoidBullet")
        super.init(texture: texture, color: UIColor.clearColor(), size: CGSize(width: 25, height: 32), d: 0.01)
        
        /* Set Z-Position, ensure it's on top of grid */
        zPosition = 1
        
        /* Set anchor point to bottom-left */
        anchorPoint = CGPoint(x: 0.5, y: 1)
    }
    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func bulletAction(){
        self.position.y -= 6
        
    }
}