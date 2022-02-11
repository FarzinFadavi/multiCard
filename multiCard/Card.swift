//
//  Card.swift
//  multiCard
//
//  Created by Farzin macbook on 2/7/22.
//

import Foundation
import RealmSwift


class Card: Object, ObjectKeyIdentifiable {
   
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var name : String = ""
    @Persisted var redColor : Double = 0.5
    @Persisted var greenColor : Double = 0.5
    @Persisted var blueColor : Double = 0.5
    @Persisted var y : Float = 0
    
}


//struct card : Identifiable {
//    var id = UUID()
//    var name : String
//    var color : Color
//    var y : CGFloat
//}

