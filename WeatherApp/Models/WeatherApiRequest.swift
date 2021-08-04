//
//  WeatherApiRequest.swift
//  WeatherApp
//
//  Created by Burak Çiçek on 31.07.2021.
//

import Foundation

class WeatherApiRequest {
        
    static func getWeather(onSuccess: @escaping (WeatherResponse) -> (), onError: @escaping (String) -> ()) {
        
        guard let url = URL(string: Network.shared.buildURL()) else {
            onError("Url Error")
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                onError(error.localizedDescription)
                return
            }
            
            guard let data = data, let response = response as? HTTPURLResponse else {
                onError("Invalid Response or Data")
                return
            }
            
            do {
                
                if response.statusCode == 200 {
                    
                    let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    
                    DispatchQueue.main.async {
                        onSuccess(weather)
                    }
                    
                    dump(weather)
                    
                } else {
                    onError("Response code: \(response.statusCode)")
                }
                
            } catch {
                
                onError(error.localizedDescription)
                
            }
            
        }
        
        dataTask.resume()
        
    }
    
}
