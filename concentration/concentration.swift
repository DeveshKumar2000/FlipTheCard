//
//  concentration.swift
//  concentration
//
//  Created by Devesh Kumar Singh on 03/02/22.
//

import Foundation
import UIKit


class Concentration{//captialize
    private var card = [Cards]()
    private var arrayOfSelectedCards : [Cards] = []
    func choose(at index:Int) -> Bool{
        if card[index].getStatusOfCardFlip() == false{
            card[index].makeFlipToTrue()
        }
        return card[index].getStatusOfCardFlip()
    }
    private var autoIncrementIdentifier=0
    func allFlipped()->Bool{ //need to refactor
        for cardInstances in card{
            if cardInstances.getStatusOfCardFlip() == false{
                return false
            }
        }
        return true
    }
    func cardAtIndex(_ index : Int) -> Cards{
        return card[index]
    }
    func addCard(_ card : Cards){
        arrayOfSelectedCards.append(card)
    }
    func lastCardOfSelectedDeck() -> Cards?{
        return arrayOfSelectedCards.last
    }
    func makeAllCardMatched(){
        for cards in arrayOfSelectedCards{
            cards.makeMatchToTrue()
            cards.makeFlipToTrue()
        }
    }
    func makeArrayOfSelectedCardEmpty(){
        arrayOfSelectedCards = []
    }
    func makeAllCardFlipToFalse(){
        for cards in arrayOfSelectedCards{
            cards.makeFlipToFalse()
        }
    }
    func getIdentifier(_ index : Int) -> Int {
       return arrayOfSelectedCards[index].getIdentifier()
    }
    init(_ noOfCards:Int){
        for _ in 0...noOfCards{
            autoIncrementIdentifier += 1
            let card1 = Cards(autoIncrementIdentifier)
            card.append(card1)
            card.append(card1)
        }
    }
    
}
