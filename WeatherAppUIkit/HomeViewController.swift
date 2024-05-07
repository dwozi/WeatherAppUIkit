//
//  HomeViewController.swift
//  WeatherAppUIkit
//
//  Created by Hakan Hardal on 7.05.2024.
//

import Foundation
import UIKit

class HomeViewController : UIViewController{
   //MARK: - Properties
    private let backgroundsImageView = UIImageView()
   
    
    
    //MARK: - Lifecycle
    override func viewDidLoad(){
        super.viewDidLoad()
        style()
        layout()
    }
}



//MARK: - Helpers
extension HomeViewController{

    private func style(){
        //backgrounds style
        backgroundsImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundsImageView.contentMode = .scaleAspectFill
        backgroundsImageView.image = UIImage(named: "background")
    }
    
    private func layout(){
        view.addSubview(backgroundsImageView)
        
        NSLayoutConstraint.activate([
            backgroundsImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundsImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backgroundsImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            backgroundsImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        
        ])
    }
    
}
