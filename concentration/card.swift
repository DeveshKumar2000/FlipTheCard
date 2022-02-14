//
//  card.swift
//  concentration
//
//  Created by Devesh Kumar Singh on 03/02/22.
//

import Foundation


class Cards{// make it class
    private var isFlip = false
    private var isMatched = false
    private var Identifier :Int
    init(_ identifier : Int){
        self.Identifier = identifier
    }
    func getStatusOfCardFlip() -> Bool{
        return self.isFlip
    }
    func getStatusOfCardMatched() -> Bool{
        return self.isMatched
    }
    func makeFlipToFalse(){
        self.isFlip = false
    }
    func makeFlipToTrue(){
        self.isFlip = true
    }
    func makeMatchToFalse(){
        self.isFlip = false
    }
    func makeMatchToTrue(){
        self.isFlip = true
    }
    func getIdentifier() -> Int{
        return self.Identifier
    }
}
