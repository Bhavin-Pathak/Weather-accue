//
//  ContentView.swift
//  Weather-accue
//
//  Created by Bhavin Pathak on 19/06/2024
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: WeatherModel?
    
    var body: some View {
        VStack {
            if let location = locationManager.location{
                if let weather = weather {
                    WeatherScreen(weather: weather)
                } else {
                    LoadingScreen()
                        .task {
                            do {
                                weather =  try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error Getting Data :- \(error)")
                            }
                        }
                }
            } else {
                if locationManager.isLoading{
                    LoadingScreen()
                } else {
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
