//
//  ContentView2.swift
//  ZooGuide
//
//  Created by Joseph Sneifer on 5/5/22.
//
import SwiftUI

struct HomePage: View {
    var body: some View {
        NavigationView {
            VStack{
                NavigationLink(destination: HabitatView()) {
                    HStack {
                        Text("Habitats")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                        Image(systemName: "pawprint.fill")
                            .foregroundColor(.black)
                        
                    }.background(RoundedRectangle(cornerRadius: CGFloat(15.0)).foregroundColor(.green).opacity(0.5).frame(width: 170, height: 50, alignment: .center))
                }
                .padding()
                NavigationLink(destination: MapView()) {
                    HStack {
                        Text("Map")
                            .font(.largeTitle)
                            .foregroundColor(.black)
                        Image(systemName: "globe.europe.africa.fill")
                            .foregroundColor(.black)
                        
                    }.background(RoundedRectangle(cornerRadius: CGFloat(15.0)).foregroundColor(.green).opacity(0.5).frame(width: 120, height: 50, alignment: .center))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
