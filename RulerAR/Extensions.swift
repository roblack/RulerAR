//
//  Extensions.swift
//  RulerAR
//
//  Created by Emin Roblack on 8/21/18.
//  Copyright © 2018 emiN Roblack. All rights reserved.
//

import Foundation
import ARKit

extension SCNVector3: Equatable {
  
  static func positionFromTransform(_ transform: matrix_float4x4) -> SCNVector3 {
    return SCNVector3Make(transform.columns.3.x, transform.columns.3.y, transform.columns.3.z)
  }
  
  func distance(from vector: SCNVector3) -> Float {
    let distanceX = self.x - vector.x
    let distanceY = self.y - vector.y
    let distanceZ = self.z - vector.z
    
    return sqrtf( (distanceX * distanceX) + (distanceY * distanceY) + (distanceZ * distanceZ) )
  }
  
  public static func == (lhs: SCNVector3, rhs: SCNVector3) -> Bool {
    return (lhs.x == rhs.x) && (lhs.y == rhs.y) && (lhs.z == rhs.z)
  }
  
}

//MARK: Converting a CGPoint to SCNVector3
extension ARSCNView {
  func realWorldVector(screenPos: CGPoint) -> SCNVector3? {
    let hitTestResult = self.hitTest(screenPos, types: [.featurePoint])
    
    if let result = hitTestResult.first {
      return SCNVector3.positionFromTransform(result.worldTransform)
    }
    return nil
  }
 
  
}
