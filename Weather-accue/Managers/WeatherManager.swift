//
//  WeatherManager.swift
//  Weather-accue
//
//  Created by Bhavin Pathak on 19/06/2024
//

import Foundation
import CoreLocation


class WeatherManager {
    
    
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherModel {
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(APIManager.apiKey)") else { fatalError("Missing Or Invaid URL")}
        
        print("Hey Chore Your Url Is \(url)")
        
        let urlRequest = URLRequest(url: url)
        
        print("Hey Chore Your UrlRequest Is \(urlRequest)")
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error Fetching Weather Data")}
        print("Hey Chore Your Reaponse Is \(response)")
        
        let decodedData = try JSONDecoder().decode(WeatherModel.self, from: data)
        print("Hey Chore Your Dara Is \(decodedData)")
        
        return decodedData
    }
    
}
