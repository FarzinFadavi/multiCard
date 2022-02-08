//
//  AppState .swift
//  multiCard
//
//  Created by Farzin macbook on 2/7/22.
//

import Foundation
import RealmSwift
import SwiftUI
import Combine

class AppModel : ObservableObject {
    
    @ObservedResults(Card.self) var cards
    
    init() {
      
        if cards.isEmpty {
            for _ in 0...2 {
                addCard()
            }
        }
    }
    
    func setYdragValue(index : Int,nextIndex: Int,value : DragGesture.Value) {
        
            do {
                
                let realm = try Realm()
                
                try realm.write {
                    cards[index + nextIndex].y = Float(value.translation.height)
                    objectWillChange.send()
                }
                
            } catch let error {
                
                print(error.localizedDescription)
            }
   
    }

    func setYtoZero(index : Int,nextIndex: Int) {
        
        do {
            let realm = try Realm()
            
            try realm.write {
                cards[index + nextIndex].y = 0
                objectWillChange.send()
            }
            
        } catch let error {
            
            print(error.localizedDescription)
        }
        
    }
    
    func addCard() {
        
        do {
            let realm = try Realm()
            
            let card = Card()
            
            card.name = "purple"
            card.blueColor = 0.7
            card.greenColor = 0.1
            card.redColor = 0.4
            
            try realm.write {
                realm.add(card)
            }
            
        } catch let error {
            
            print(error.localizedDescription)
        }
        
    }
    
    func getCardOffset(index : Int) -> CGFloat {
        
        switch index {
        case 0:
            return 0
        case 1:
            return -50
        case 2:
            return -100
        default:
            return 0
        }
        
    }
    
    func getCardOffset2(index : Int) -> CGFloat {
        
        switch index {
        case 0:
            return 0
        case 1:
            return -210
        case 2:
            return -420
        default:
            return 0
        }
        
    }
    
    func getOpacity(index : Int) -> CGFloat {
        switch index {
        case 0:
            return 1
        case 1:
            return 0.7
        case 2:
            return 0.3
        default:
            return 0
        }
    }
        
}
