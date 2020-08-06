//
//  ContentView.swift
//  myFirstApp-SwiftUI
//
//  Created by Jake Tinguban on 8/6/20.
//  Copyright © 2020 JBT. All rights reserved.
//

import SwiftUI

//Defining variables and array
var colorArray = ["Black", "Blue", "Green", "Orange", "Pink", "Red", "Violet", "Yellow"]
var tapCount : Int = 0
var counter : Int = 0
var getColor = "Welcome"



struct ContentView: View {
//defining state variables for the buttons
    @State private var isButtonTapped : Bool = false
    @State private var isResetButtonTapped : Bool = false
    
    var body: some View {
        ZStack {
            Image("BG")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                HStack {
                    Text("Tap Count")
                    Spacer()
                    Text("myFirstApp")
                }
                .padding([.leading, .trailing], 50)
                
                HStack {
//Updating tap count
                    Text(isResetButtonTapped ? "\(counter)" :  "\(counter)")
                        .font(.headline)
                        .frame(width: 75, alignment: .center)
                    Spacer()
                    Text("by JBT")
                }
                .padding([.leading, .trailing], 50)
                Spacer()
                ZStack(alignment: .bottom) {
//Image/Color display
                    Image(isButtonTapped ? "\(getColor)" : "\(getColor)")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .center)
                    
                    Text("\(getColor)")
                        .font(.largeTitle).colorInvert()
                    
                }
                Spacer()
//tap me button
                Button(action: {self.isButtonTapped.toggle(); self.incrementTapCount(); self.getRandomColor()}, label: {Image("TapMeButton").foregroundColor(.black)})
                
//reset button
                Button(action: {self.isResetButtonTapped.toggle(); self.resetTapCount(); self.resetColor()}, label: {Text("Reset").foregroundColor(.black)})
                
                Spacer()
            }
        }
    }
    
//Functions for the buttons and variables
    func incrementTapCount() {
        counter += 1
    }
    
    func resetTapCount() {
        counter = 0
    }
    
    func getRandomColor() {
        getColor = colorArray.randomElement()!
    }
    
    func resetColor() {
        getColor  = "Welcome"
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
