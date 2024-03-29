import SpriteKit

class Obstacle: SKSpriteNode {
    
    /* Living neighbor counter */
    var hitPoints = 5
    
    var exists: Bool = false {
        didSet {
            /* Visibility */
            hidden = !exists
        }
    }
    
    init() {
        /* Initialize with 'bubble' asset */
        let texture = SKTexture(imageNamed: "Square")
        super.init(texture: texture, color: UIColor.clearColor(), size: CGSize(width: 64, height: 64))
        
        /* Set Z-Position, ensure it's on top of grid */
        zPosition = 1
        
        /* Set anchor point to bottom-left */
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
    }
    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
