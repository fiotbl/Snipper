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
        Home().frame(maxWidth: 400)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct VerticalTabButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .foregroundColor(.white)
            .background(Color.gray)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
    }
}

struct Home : View {
    var body: some View{
        HStack(spacing: 0){
            VStack{
                Button(action: {
                                    
                                }) {
                                    
                                    Text("Code Snippets")
                                    
                                }
                                .buttonStyle(VerticalTabButtonStyle())
                                .padding(.top)
                Button(action: {
                                    
                                }) {
                                    
                                    Text("Git commands")
                                    
                                }
                                .buttonStyle(VerticalTabButtonStyle())
                                .padding(.top)
                                .alignmentGuide(.top, computeValue: { dimension in 0})
                Spacer()
    
            }
            
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading) // Expand the VStack to the left
            .alignmentGuide(.leading) { _ in 0 }
            .background(Color.gray)
            Divider() // Add a vertical divider
                       
                       Text("Hello, world!") // Add a text component
                           .padding()
        }
    }
}
