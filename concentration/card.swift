//
//  card.swift
//  concentration
//
//  Created by Devesh Kumar Singh on 03/02/22.
//

import Foundation


class Cards{// make it class
    var isFlip = false
    var isMatched = false
    var Identifier :Int
    private static var autoIncrementIdentifier=0
    private static func getSecretIdentifier() -> Int{
        Cards.autoIncrementIdentifier += 1
        return Cards.autoIncrementIdentifier
    }
    init(){
        self.Identifier = Cards.getSecretIdentifier()
    }
}
