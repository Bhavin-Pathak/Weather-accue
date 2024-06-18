//
//  Welcome_screen.swift
//  Weather-accue
//
//  Created by MacBookPro on 29/03/1946 Saka.
//

import SwiftUI
import CoreLocationUI

struct Welcome_screen: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack{
            VStack(spacing: 20){
                Text("Welcome to Weather-accu")
                    .bold()
                    .font(.title)
                Text("Please share your current location to get current weather in your area")
                    .padding()
                
                
            }
            .multilineTextAlignment(.center)
           
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(20)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct Welcome_screen_Previews: PreviewProvider {
    static var previews: some View {
        Welcome_screen()
    }
}
