//
//  ContentView.swift
//  Shared
//
//  Created by Joseph Sneifer on 5/4/22.
//

import SwiftUI

struct HabitatView: View {
    
    @State private var animalStore : AnimalStore = AnimalStore(animals: AnimalData)
    
    @State private var selection = 1
    
    var body: some View {
        TabView(selection: $selection) {
            VStack{
                RainforestPage(animalStore: $animalStore)
            }.tabItem {
                Image(systemName: "leaf.circle.fill")
            }.tag(1)
            VStack{
                DesertPage(animalStore: $animalStore)
            }.tabItem {
                Image(systemName: "flame.circle.fill")
            }.tag(2)
            VStack{
                OceanPage(animalStore: $animalStore)
            }.tabItem {
                Image(systemName: "drop.circle.fill")
            }.tag(3)
            VStack{
                ForestPage(animalStore: $animalStore)
            }.tabItem {
                Image(systemName: "pawprint.circle.fill")
            }.tag(4)
        }
        .navigationTitle("Habitats")
        .navigationBarTitleDisplayMode(.inline)
    }
}


struct RainforestPage: View {
    
    @Binding var animalStore: AnimalStore
    
    @State var rainforestAnimal: [Animal] = []
    
    var body: some View {
        
        Text("Rainforest")
            .font(.largeTitle)
            .padding()
        
            List {
                ForEach (animalStore.animals, id: \.self) { animal in
                    if(animal.habitat == "Rainforest") {
                        ListCell(animal: animal)
                    }
                }
            }
    }
}

struct DesertPage: View {
    
    @Binding var animalStore: AnimalStore
    
    @State var desertAnimal: [Animal] = []
    
    var body: some View {
        
        Text("Desert")
            .font(.largeTitle)
            .padding()
        
            List {
                ForEach (animalStore.animals, id: \.self) { animal in
                    if(animal.habitat == "Desert") {
                        ListCell(animal: animal)
                    }
                }
            }
        
    }
}

struct OceanPage: View {
    
    @Binding var animalStore: AnimalStore
    
    @State var oceanAnimal: [Animal] = []
    
    var body: some View {
        
        Text("Ocean")
            .font(.largeTitle)
            .padding()
        
            List {
                ForEach (animalStore.animals, id: \.self) { animal in
                    if(animal.habitat == "Ocean") {
                        ListCell(animal: animal)
                    }
                }
            }
        }
}

struct ForestPage: View {
    
    @Binding var animalStore: AnimalStore
    
    @State var forestAnimal: [Animal] = []
    
    var body: some View {
        
        Text("Forest")
            .font(.largeTitle)
            .padding()
        
            List {
                ForEach (animalStore.animals, id: \.self) { animal in
                    if(animal.habitat == "Forest") {
                        ListCell(animal: animal)
                    }
                }            }
        }
}

struct ListCell: View {
    var animal: Animal
    var body: some View {
        NavigationLink(destination: AnimalDetail(selectedAnimal: animal)) {
            Text(animal.species)
                .font(.title2)
                .fontWeight(.semibold)
                .padding()
        }
    }
}

struct HabitatView_Previews: PreviewProvider {
    static var previews: some View {
        HabitatView()
    }
}
