//
//  ViewController.swift
//  f-HOOD-z
//
//  Created by Weston Gibler on 1/25/18.
//  Copyright © 2018 Weston Gibler. All rights reserved.
//

import UIKit

class ViewController: UIViewController, SwipeableCardViewDataSource {
    
    @IBOutlet private weak var swipeableCardView: SwipeableCardViewContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        swipeableCardView.dataSource = self
    }
    
}

// MARK: - SwipeableCardViewDataSource

extension ViewController {
    
    func numberOfCards() -> Int {
        return viewModels.count
    }
    
    func card(forItemAtIndex index: Int) -> SwipeableCardViewCard {
        let viewModel = viewModels[index]
        let cardView = SampleSwipeableCard()
        cardView.viewModel = viewModel
        return cardView
    }
    
    func viewForEmptyCards() -> UIView? {
        return nil
    }
    
}

extension ViewController {
    
    var viewModels: [SampleSwipeableCellViewModel] {
        
        let Brider = SampleSwipeableCellViewModel(title: "Brider?",
                                                  subtitle: "Distance: 0.1 Miles",
                                                     color: UIColor(red:0.69, green:0.65, blue:0.89, alpha:1.0),
                                                     image: #imageLiteral(resourceName: "brider"))

        let PokeHouse = SampleSwipeableCellViewModel(title: "Poke House?",
                                                 subtitle: "Distance: 0.1 Miles",
                                                 color: UIColor(red:0.69, green:0.65, blue:0.89, alpha:1.0),
                                                 image: #imageLiteral(resourceName: "pokeHouse2"))
        
        let DenverPokeCompany = SampleSwipeableCellViewModel(title: "Denver Poke Company?",
                                                 subtitle: "Distance: 0.2 Miles",
                                                 color: UIColor(red:0.69, green:0.65, blue:0.89, alpha:1.0),
                                                 image: #imageLiteral(resourceName: "DenverPokeCom"))
        
        let ColtGray = SampleSwipeableCellViewModel(title: "Colt & Gray?",
                                                subtitle: "Distance: 0.2 Miles",
                                                color: UIColor(red:0.69, green:0.65, blue:0.89, alpha:1.0),
                                                image: #imageLiteral(resourceName: "coltgrey"))
       
        let SuperfoodBar = SampleSwipeableCellViewModel(title: "Superfood Bar?",
                                                 subtitle: "Distance: 0.3 Miles",
                                                 color: UIColor(red:0.69, green:0.65, blue:0.89, alpha:1.0),
                                                 image: #imageLiteral(resourceName: "superfoods"))
        
        let InsideScoopCreamery = SampleSwipeableCellViewModel(title: "Inside Scoop Creamery",
                                                 subtitle: "Distance: 0.3 Miles",
                                                 color: UIColor(red:0.69, green:0.65, blue:0.89, alpha:1.0),
                                                 image: #imageLiteral(resourceName: "InsideScoopCreamery"))
        
        let SteEllie = SampleSwipeableCellViewModel(title: "Ste. Ellie?",
                                            subtitle: "Distance: 0.3 Miles",
                                            color: UIColor(red:0.69, green:0.65, blue:0.89, alpha:1.0),
                                            image: #imageLiteral(resourceName: "SteEllie"))
        
        return [Brider, PokeHouse, DenverPokeCompany, ColtGray, SuperfoodBar, InsideScoopCreamery, SteEllie]
    }
    
}
