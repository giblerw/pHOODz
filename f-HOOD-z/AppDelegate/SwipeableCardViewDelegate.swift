//
//  SwipeableCardViewDelegate.swift
//  f-HOOD-z
//
//  Created by Weston Gibler on 1/25/18.
//  Copyright © 2018 Weston Gibler. All rights reserved.
//

import Foundation

protocol SwipeableCardViewDelegate: class {
    
    func didSelect(card: SwipeableCardViewCard, atIndex index: Int)
    
}

