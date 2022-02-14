//
//  concentration.swift
//  concentration
//
//  Created by Devesh Kumar Singh on 03/02/22.
//

import Foundation
import UIKit


class Concentration{//captialize
    var card = [Cards]()
    var arrayOfSelectedCards : [Cards] = []
    func choose(at index:Int) -> Bool{
        if card[index].isFlip == false{
            card[index].isFlip = true
        }
        return card[index].isFlip
    }
    func allFlipped()->Bool{ //need to refactor
        for cardInstances in card{
            if cardInstances.isFlip == false{
                return false
            }
        }
        return true
    }
    init(_ noOfCards:Int){
        for _ in 0...noOfCards{
            let card1 = Cards()
            card.append(card1)// add identifier property here : cannot add
            card.append(card1)
        }
    }
    
}
