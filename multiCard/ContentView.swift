//
//  ContentView.swift
//  multiCard
//
//  Created by Farzin macbook on 2/7/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appModel : AppModel
    @State var swipeDownAnimation = false
    
    var body: some View {
        ZStack {
            GeometryReader { reader in
                ZStack {
                    
                    ForEach(appModel.cards.indices.reversed(), id: \.self) { index in
                        
                        ZStack {
     
                            Color(red: appModel.cards[index].redColor,
                                  green: appModel.cards[index].greenColor,
                                  blue: appModel.cards[index].blueColor)
                                .cornerRadius(30)
                            
                        }
                        .opacity(appModel.getOpacity(index : index))
                        .offset(y: swipeDownAnimation ? appModel.getCardOffset2(index: index) : appModel.getCardOffset(index: index) )
                        .frame(width: reader.size.width - 60, height: reader.size.width / 1.7)
                        .offset(y: CGFloat(appModel.cards[index].y))
                        .gesture(DragGesture(minimumDistance: 10)
                                    .onChanged({ (value) in
                            
                            if value.translation.height > 50 {
                                
                                swipeDownAnimation = true
 
                                appModel.setYdragValue(index: index, nextIndex: 0, value: value)
                                
                                appModel.setYdragValue(index: index, nextIndex: 1, value: value)
  
                                appModel.setYdragValue(index: index, nextIndex: 2, value: value)
                                
                            }
  
                        })
                                    .onEnded({ (value) in
                            
                            swipeDownAnimation = false

                            appModel.setYtoZero(index: index, nextIndex: 0)

                            appModel.setYtoZero(index: index, nextIndex: 1)

                            appModel.setYtoZero(index: index, nextIndex: 2)
                            
                        }))
                        .animation(.spring(response: 0.7, dampingFraction: 0.75, blendDuration: 0), value: appModel.cards[0].y)
                        .animation(.spring(response: 0.7, dampingFraction: 0.75, blendDuration: 0), value: appModel.cards[1].y)
                        .animation(.spring(response: 0.7, dampingFraction: 0.75, blendDuration: 0), value: appModel.cards[2].y)
                        
                    
                    }
                }
                .frame(maxWidth : .infinity,maxHeight: .infinity,alignment: .center)
                
            }
        }
    }
      
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
