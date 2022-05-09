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
                Text("Rainforest")
            }.tag(1)
            
            VStack{
                DesertPage(animalStore: $animalStore)
            }.tabItem {
                Image(systemName: "flame.circle.fill")
                Text("Desert")

            }.tag(2)
            
            VStack{
                OceanPage(animalStore: $animalStore)
            }.tabItem {
                Image(systemName: "drop.circle.fill")
                Text("Ocean")

            }.tag(3)
            
            VStack{
                ForestPage(animalStore: $animalStore)
            }.tabItem {
                Image(systemName: "pawprint.circle.fill")
                Text("Forest")

            }.tag(4)
        }
        .accentColor(colorToShow(selection: selection))
        .navigationTitle("")
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            // correct the transparency bug for Tab bars
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithOpaqueBackground()
            UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        } // source: https://www.hackingwithswift.com/forums/ios/tab-bar-transparent/10549
        // source above was used to fix issue of tab bar becoming transparent on navigation scene change
    }
    
    
}


// changes the color of the tab icons depending on selection
func colorToShow(selection: Int) -> Color {
    let darkGreen = Color(red: 0.09, green: 0.49, blue: 0.20, opacity: 1.00)

    var colorToShow: Color {
        switch selection {
            case 1:
            return .green.opacity(0.7)
            case 2:
            return .brown.opacity(0.7)
            case 3:
                return .blue.opacity(0.7)
            case 4:
            return darkGreen.opacity(0.7)
            default:
                return .clear
        }
    }
    return colorToShow
}

struct RainforestPage: View {
    
    @Binding var animalStore: AnimalStore
    
    @State var rainforestAnimal: [Animal] = []
    
    var body: some View {
        
        VStack {
            Text("Rainforest")
                .font(.largeTitle)
                .fontWeight(.light)

            
            List {
                ForEach (animalStore.animals, id: \.self) { animal in
                    if(animal.habitat == "Rainforest") {
                        ListCell(animal: animal).foregroundColor(.green)
                    }
                }
            }

        }
        .background(.green.opacity(0.5))
        
            
    }
}

struct DesertPage: View {
    
    @Binding var animalStore: AnimalStore
    
    @State var desertAnimal: [Animal] = []
    
    var body: some View {
        
        VStack {
            Text("Desert")
                .font(.largeTitle)
                .fontWeight(.light)

            
            List {
                ForEach (animalStore.animals, id: \.self) { animal in
                    if(animal.habitat == "Desert") {
                        ListCell(animal: animal).foregroundColor(.brown)
                    }
                }
            }
        }
        .background(.brown.opacity(0.7))
    }
}

struct OceanPage: View {
    
    @Binding var animalStore: AnimalStore
    
    @State var oceanAnimal: [Animal] = []
    
    var body: some View {
        
        VStack {
            Text("Ocean")
                .font(.largeTitle)
                .fontWeight(.light)

            
            List {
                ForEach (animalStore.animals, id: \.self) { animal in
                    if(animal.habitat == "Ocean") {
                        ListCell(animal: animal).foregroundColor(.blue)
                    }
                }
            }
        }
        .background(.blue.opacity(0.7))
    }
}

struct ForestPage: View {
    let darkGreen = Color(red: 0.09, green: 0.49, blue: 0.20, opacity: 1.00)
    @Binding var animalStore: AnimalStore
    
    @State var forestAnimal: [Animal] = []
    
    var body: some View {
        
        VStack {
            Text("Forest")
                .font(.largeTitle)
                .fontWeight(.light)

            List {
                ForEach (animalStore.animals, id: \.self) { animal in
                    if(animal.habitat == "Forest") {
                        ListCell(animal: animal).foregroundColor(darkGreen)
                    }
                }
                    
            }
        }
        .background(darkGreen.opacity(0.7))

        
            
    }
}

struct ListCell: View {
    var animal: Animal
    var body: some View {
        NavigationLink(destination: AnimalDetail(selectedAnimal: animal)) {
            Text(animal.species)
                .font(.title3)
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
