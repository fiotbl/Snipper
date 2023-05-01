//
//  ContentView.swift
//  Snipper
//
//  Created by Fiora Tan on 1/5/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Snipper")
//
//        }
//        .padding()
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    var body: some View{
        HStack(spacing: 0){
            VStack{
                Button(action: {
                                    
                                }) {
                                    
                                    Image("menu")
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 22, height: 22)
                                    
                                }
                                .padding(.top)
                Button(action: {
                                    
                                }) {
                                    
                                    Image("menu")
                                        .renderingMode(.original)
                                        .resizable()
                                        .frame(width: 22, height: 22)
                                    
                                }
                                .padding(.top)
            }
        }
    }
}
