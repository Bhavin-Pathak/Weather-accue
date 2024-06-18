//
//  ContentView.swift
//  Weather-accue
//
//  Created by Bhavin Pathak on 19/06/2024
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
