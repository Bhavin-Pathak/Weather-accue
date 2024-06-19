//
//  WeatherScreen.swift
//  Weather-accue
//
//  Created by MacBookPro on 29/03/1946 Saka.
//

import SwiftUI

struct WeatherScreen: View {
    
    var weather: WeatherModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            VStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name )
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                VStack {
                    HStack {
                        VStack(spacing: 20) {
                            Image(systemName: "cloud")
                                .font(.system(size: 40))
                            
                            Text(weather.weather[0].main )
                        }
                        .frame(width: 150, alignment: .leading)
                        
                        Spacer()
                        
                        Text((weather.main.feelsLike.roundDouble() ) + "°")
                            .font(.system(size: 70))
                            .fontWeight(.bold)
                            .padding()
                    }
                    
                    Spacer()
                        .frame(height:  50)
                    
                    AsyncImage(url: URL(string: "https://cdn.pixabay.com/photo/2015/11/17/02/18/hourglass-1046841_1280.png")) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Spacer()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 20) {
                    Text("Weather now")
                        .bold()
                        .padding(.bottom)
                    
                    HStack {
                        RowsView(logo: "thermometer.snowflake", name: "Min temp", value: ((weather.main.tempMin.roundDouble() ) + ("°")))
                        Spacer()
                        RowsView(logo: "thermometer.sun.fill", name: "Max temp", value: ((weather.main.tempMax.roundDouble() ) + "°"))
                    }
                    
                    HStack {
                        RowsView(logo: "wind", name: "Wind speed", value: ((weather.wind.speed.roundDouble() ) + " m/s"))
                        Spacer()
                        RowsView(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color.indigo)
        .preferredColorScheme(.dark)
    }
}

struct WeatherScreen_Previews: PreviewProvider {
    static var previews: some View {
        WeatherScreen(weather: previewWeather)
    }
}
