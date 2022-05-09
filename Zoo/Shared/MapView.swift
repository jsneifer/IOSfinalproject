//
//  MapView.swift
//  ZooGuide
//
//  Created by Joseph Sneifer on 5/5/22.
//
import SwiftUI

struct MapView: View {
    
    @State private var magnification: CGFloat = 1.0
    
    var body: some View {
        
        let magnificationGesture = MagnificationGesture(minimumScaleDelta: 0)
            .onChanged ({ value in
                self.magnification = (value > 1.0 ? value : 1.0)
            })
        
        Image("ZooMap")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .ignoresSafeArea(edges: .top)
            .scaleEffect(magnification)
            .gesture(magnificationGesture)
        
            .navigationTitle("Map")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
