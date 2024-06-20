//
//  ContentView.swift
//  Weather-accue
//
//  Created by Bhavin Pathak on 19/06/2024
//

import SwiftUI

struct ContentView: View {
    //MARK: Satates Objects or Variables
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: WeatherModel?
    
    var body: some View {
        VStack {
            if let location = locationManager.location{
                if let weather = weather {
                    //MARK: Weather Get Location Then Move To Weather Screen
                    WeatherScreen(weather: weather)
                } else {
                    //MARK: Show Loading Or ProgressView
                    LoadingScreen()
                    //MARK: Performing Task With Loading View
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
        //MARK: Background Colour Or Dark Mode
        .background(Color.indigo)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
