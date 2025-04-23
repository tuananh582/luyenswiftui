//
//  PredatorMap.swift
//  luyenlai3
//
//  Created by TuanAnh on 19/3/25.
//

import MapKit
import SwiftUI

struct PredatorMap: View {
    @State var position: MapCameraPosition
    @State var satellite = false
    let predator = Predators()
    var body: some View {
        Map(position: $position) {
            ForEach(predator.apexPredators){ predator in
                Annotation(predator.name, coordinate: predator.location) {
                    Image(predator.image).resizable().scaledToFit().frame(height: 100).shadow(color: .white, radius: 3)
                        .scaleEffect(x:-1)
                }
                
                
            }
            
            
        }
        .mapStyle(satellite ? .imagery(elevation: .realistic) : .standard(elevation: .realistic))
        .overlay(alignment:.bottomTrailing) {
            Button{
                satellite.toggle()
            }label: {
                Image(systemName: satellite ? "globe.americas.fill" : "globe.americas").font(.largeTitle).imageScale(.large).padding(3).background(.ultraThinMaterial).shadow(radius: 3).clipShape(.rect(cornerRadius: 7)).padding()
            }
        }
        .toolbarBackground(.automatic)
    }
        
}

#Preview {
    PredatorMap(position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[2].location, distance: 1000, heading: 250, pitch: 80)))
        .preferredColorScheme(.dark)
}
