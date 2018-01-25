//
//  CGRect+SwipeAdditions.swift
//  f-HOOD-z
//
//  Created by Weston Gibler on 1/25/18.
//  Copyright © 2018 Weston Gibler. All rights reserved.
//

import CoreGraphics

typealias CGLine = (start: CGPoint, end: CGPoint)

extension CGRect {
    
    var topLine: CGLine {
        return (SwipeDirection.topLeft.point, SwipeDirection.topRight.point)
    }
    var leftLine: CGLine {
        return (SwipeDirection.topLeft.point, SwipeDirection.bottomLeft.point)
    }
    var bottomLine: CGLine {
        return (SwipeDirection.bottomLeft.point, SwipeDirection.bottomRight.point)
    }
    var rightLine: CGLine {
        return (SwipeDirection.topRight.point, SwipeDirection.bottomRight.point)
    }
    
    var perimeterLines: [CGLine] {
        return [topLine, leftLine, bottomLine, rightLine]
    }
    
}

