//
//  WeatherService.swift
//  WeatherAppUIkit
//
//  Created by Hakan Hardal on 8.05.2024.
//

import Foundation
import UIKit
enum ServiceError : Error{
    case serverError
    case decodingError
}

struct WeatherService{
    
    let url = "https://api.openweathermap.org/data/2.5/weather?&appid=29da09b6c0524425481a64417acf537e&units=metric"
    
    func fetchWeather(forcityName cityName: String, completion: @escaping(Result<WeatherModel,ServiceError>)->Void){
        let url = URL(string: "\(url)&q=\(cityName)")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if error != nil{
                    completion(.failure(.serverError))
                }
                guard let data = data else {return}
                guard let result = parseJSON(data: data) else {
                    completion(.failure(.decodingError))
                    return
                }
                completion(.success(result))
            }
            
        }.resume()
    }
    
    private func parseJSON(data : Data) -> WeatherModel?{
        do {
            let result = try JSONDecoder().decode(WeatherModel.self, from: data)
            return result
        } catch  {
            return nil
        }
    }
}




