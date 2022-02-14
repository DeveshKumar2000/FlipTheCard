//
//  ViewController.swift
//  concentration
//
//  Created by Devesh Kumar Singh on 01/02/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var flipCount : UILabel!
    @IBOutlet var cardButtons : [UIButton]!
    private lazy var noOfCardsPair : Int = (cardButtons.count+1)/2// make it pair from withoutPair
  
    @IBOutlet weak var GameOver: UILabel!
    private var arrayOfSelectedButtons : [UIButton] = []
    private var emojiString = ["👻","🎃","👻","🎃","🦇","🎃","🐵","💀","👻","🎃","👻","🦅","🦇","🎃","🐵","💀"]
    private var emojiChoiceString = ["🐢","🎃","👻","🦅","🦇","🎃","🧑🏻‍🎤","💀"]
    private lazy var game = Concentration(noOfCardsPair)// capitalize
    private var flips = 0 {
        didSet {
            flipCount.text = "Flips: \(flips)"
        }
    }
    private lazy var countOfCards = cardButtons.count
    @IBAction func flipTheCards(_ sender: UIButton) {//make use camel case
        if let cardNumber = cardButtons.firstIndex(of: sender){
            let needToUpdateView = game.choose(at: cardNumber)// return bool from choose
            if countOfCards <= 1{
                GameOver.text="Game Over"
            }
            if needToUpdateView{
                updateViewFromModel(cardNumber)
                flips += 1
            }else {
                GameOver.text="Game Over"
            }
        }else{
            
            print("wrong buttons")
        }
        if game.allFlipped(){
            GameOver.text="Game Over"
        }
       
    }
    private func updateViewFromModel(_ index:Int){
     
            let button = cardButtons[index]
            let card = game.cardAtIndex(index)// use access controls
            if card.getStatusOfCardFlip() == true {
                let emojiChoose = emojiSelection(card)
                button.setTitle(emojiChoose, for: UIControl.State.normal)
                button.backgroundColor = UIColor.white
                if arrayOfSelectedButtons.count<2{
                    arrayOfSelectedButtons.append(button)
                    game.addCard(card)
                }else{
                    // 2condition
                    let allSameButton = areAllSameCard()
                    if allSameButton{
                        if let prev = game.lastCardOfSelectedDeck(){
                            if emojiString[prev.getIdentifier()] !=
                                emojiString[card.getIdentifier()]{
                                for but in arrayOfSelectedButtons{
                                    but.setTitle("", for: UIControl.State.normal)
                                    but.backgroundColor = UIColor.clear
                                    countOfCards -= 1
                                    but.isEnabled = false
                                }
                                game.makeAllCardMatched()
                                arrayOfSelectedButtons=[]
                                game.makeArrayOfSelectedCardEmpty()
                                arrayOfSelectedButtons.append(button)
                                game.addCard(card)
                            }else{
                                arrayOfSelectedButtons.append(button)
                                game.addCard(card)
                            }
                        }
                    }else{
                        for but in arrayOfSelectedButtons{
                            but.setTitle("", for: UIControl.State.normal)
                            but.backgroundColor = UIColor.orange
                        }
                        game.makeAllCardFlipToFalse()
                        arrayOfSelectedButtons=[]
                        game.makeArrayOfSelectedCardEmpty()
                        arrayOfSelectedButtons.append(button)
                        game.addCard(card)
                    }
                }
            }
        if countOfCards <= 1{
            GameOver.text="Game Over"
        }
        }
    private func emojiSelection(_ card:Cards)->String {
        if card.getIdentifier() >= emojiString.count  , emojiString.count > 0 {
            if let selectedEmoji = emojiChoiceString.randomElement() {
                return selectedEmoji
            }else {
                return "?"
            }
        }
        return emojiString[card.getIdentifier()]
      
    }
    
    private func areAllSameCard() -> Bool {
        let n = arrayOfSelectedButtons.count
        for i in 1..<n{
            
            if emojiString[game.getIdentifier(i)] !=
                emojiString[game.getIdentifier(i-1)]{
                return false
            }

        }
        return true
    }
   
}

