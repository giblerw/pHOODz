//
//  SwipeableViewDelegate.swift
//  f-HOOD-z
//
//  Created by Weston Gibler on 1/25/18.
//  Copyright © 2018 Weston Gibler. All rights reserved.
//

import Foundation

protocol SwipeableViewDelegate: class {
    
    func didTap(view: SwipeableView)
    
    func didBeginSwipe(onView view: SwipeableView)
    
    func didEndSwipe(onView view: SwipeableView)
    
}
