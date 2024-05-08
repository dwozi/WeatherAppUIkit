//
//  WeatherModel.swift
//  WeatherAppUIkit
//
//  Created by Hakan Hardal on 8.05.2024.
//

import Foundation

struct WeatherModel: Codable{
    let name : String
    let main : Main
    let weather : [Weather]
    
}

struct Main : Codable{
    let temp : Double
}


struct Weather : Codable{
    let id : Int
    let main : String
    let description : String
}
