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
    @Published var yValues : [CGFloat] = []
    private(set) var realm : Realm?
    
    init() {
    
        openRealm()
  
        if cards.isEmpty {
            for _ in 0...2 {
                addCard()
            }
        }

    }
    
    func openRealm() {
        print("open realm")
        do {
            
            self.realm = try Realm()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func setYdragValue(index : Int,nextIndex: Int,value : DragGesture.Value) {
       
        if let realm = realm {
            
            do {
            
                try realm.write {
                    cards[index + nextIndex].y = Float(value.translation.height)
                    objectWillChange.send()
                }
                
            } catch let error {
                
                print(error.localizedDescription)
            }
            
        }
    }

    func setYtoZero(index : Int,nextIndex: Int) {
       
        if let realm = realm {
            
            do {
                try realm.write {
                    cards[index + nextIndex].y = 0
                    objectWillChange.send()
                }
                
            } catch let error {
                
                print(error.localizedDescription)
            }
            
        }
        
        
    }
    
    func addCard() {
        
        if let realm = realm {
            
            do {
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
