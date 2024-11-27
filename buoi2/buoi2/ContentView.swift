//
//  ContentView.swift
//  buoi2
//
//  Created by TuanAnh on 6/11/24.
//

import SwiftUI
import MapKit
struct ContentView: View {
    let predators = Predators()
    @State var seachText: String = ""
    @State var alphabetical = false
    @State var currentSelection = PredatorType.all
    var filterdDinos: [ApexPredator] {
        predators.filter(by: currentSelection)
        predators.sort(by: alphabetical)
        return predators.search(for: seachText)
    }

    var body: some View {
        NavigationStack {
            List(filterdDinos) { predator in
            NavigationLink {
//                    Image(predator.image).resizable().scaledToFit().frame(width: 100, height: 100).shadow(color: .white, radius: 1)
                    
                PredatorDetail(predator : predator, position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[2].location, distance: 30000)))
                } label: {
                    HStack {
                        // Dinosaur image
                        Image(predator.image).resizable().scaledToFit().frame(width: 100, height: 100).shadow(color: .white, radius: 1)

                        VStack(alignment: .leading) {
                            // Name
                            Text(predator.name).fontWeight(.bold)
                            // Type
                            Text(predator.type.rawValue.capitalized).font(.subheadline).fontWeight(.semibold).padding(.horizontal, 10).padding(.vertical, 5).background(predator.type.background).clipShape(.capsule)
                        }
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $seachText)
            .autocorrectionDisabled()
            .animation(.smooth, value: seachText)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            alphabetical.toggle()
                        }
                    } label: {
//                        if alphabetical{
//                            Image(systemName: "film")
//                        }else{
//                            Image(systemName: "textformat")
//                        }

                        Image(systemName: alphabetical ? "film" : "textformat")
                            .symbolEffect(.bounce, value: alphabetical)
                    }
                }
                ToolbarItem(placement:.topBarTrailing){
                    Menu{
                        Picker("Filter",selection: $currentSelection.animation()){
                            ForEach(PredatorType.allCases){ type in
                                Label(type.rawValue.capitalized,systemImage: type.icon)
                            }
                        }
                    }label:{
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
