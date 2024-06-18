//
//  ContentView.swift
//  Weather-accue
//
//  Created by Bhavin Pathak on 19/06/2024
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location{
                Text("Your Current Location Corrdinates Let is \(location.latitude) And Long is \(location.longitude)")
            } else {
                if locationManager.isLoading{
                    LoadingScreen()
                }else{
                   Welcome_screen()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color.indigo)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
