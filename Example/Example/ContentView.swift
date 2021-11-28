//
//  ContentView.swift
//  Example
//
//  Created by Hsieh on 2021/11/27.
//

import SwiftUI
import Atelier

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                List {
                    Section("DefaultColors") {
                        ColorListView(DefaultColors.self)
                    }
                    Section("DefaultHexColors") {
                        ColorListView(DefaultHexColors.self)
                    }
                    Section("Gray") {
                        ColorListView(Gray.self)
                    }
                    Section("SystemColors") {
                        ColorListView(SystemColors.self)
                    }
                }
                .navigationTitle("Color Palette")
            }
            .tabItem { Label("Color", systemImage: "scribble") }
            NavigationView {
                List {
                    Section("Weather") {
                        ImageListView(Weather.self)
                    }
                    Section("Shape") {
                        ImageListView(Shape.self)
                    }
                    Section("Bird") {
                        ImageListView(Bird.self)
                    }
                    Section("Dog") {
                        ImageListView(Dog.self)
                    }
                    Section("Inset") {
                        ImageListView(Inset.self)
                    }
                    Section("Inset2") {
                        ImageListView(Inset2.self)
                    }
                }
                .navigationTitle("Image Palette")
            }
            .tabItem { Label("Image", systemImage: "photo") }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
