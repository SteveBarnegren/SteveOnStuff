import Foundation
import UIKit

class Animator {
    
    let callback: (CGPoint, Lazy<CGFloat>) -> Void
    
    init(callback: @escaping (CGPoint, Lazy<CGFloat>) -> Void) {
        self.callback = callback
    }
    
    func triggerCallback() {
        
        let position = CGPoint(x: 5, y: 6)
        let lazyRotation = Lazy<CGFloat> {
            print("Calculating rotation")
            return 100 + 60
        }
        
        callback(position, lazyRotation)
    }
}


// Without Rotation
/*
let animator = Animator(callback: { position, rotation in
    print("position: \(position)")
})

animator.triggerCallback()
*/

// With Rotation
let animator = Animator(callback: { position, rotation in
    print("position: \(position)")
    print("rotation: \(rotation.value)")
})

animator.triggerCallback()

