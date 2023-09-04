//
//  ContentView.swift
//  Closure Tutorial
//
//  Created by Jeremy Skrdlant on 9/4/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //A Tab View is a collection of views that show up when you press their button on the bottom.
        //download the following app to get a list of all the symbols.
        //https://developer.apple.com/sf-symbols/
        TabView {
            //This is the main View that shows up when yo press the button. tabItem is the button details.
            AddingToAFunctionView()
                .tabItem {
                    Label( "Creating", systemImage: "pencil.and.ruler")
                }
            CallingView()
                .tabItem {
                    Label("Calling", systemImage: "phone.circle")
                }
            AppleDocumentationView()
                .tabItem {
                    Label("Docs", systemImage: "apple.logo")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
