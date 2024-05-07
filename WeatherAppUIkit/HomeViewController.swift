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
    private let locationButton = UIButton(type: .system)
    private let searchButton = UIButton(type: .system)
    private let searchTextField = UITextField()
    
    private var stackView : UIStackView!
   
    
    
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
        
        //LocationButton style
        locationButton.translatesAutoresizingMaskIntoConstraints = false
        locationButton.setImage(UIImage(systemName: "location.circle.fill"), for: .normal)
        locationButton.tintColor = .label
        locationButton.contentVerticalAlignment = .fill
        locationButton.contentHorizontalAlignment = .fill
        locationButton.layer.cornerRadius = 40/2
        
        //SearchButton style
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.setImage(UIImage(systemName: "magnifyingglass.circle.fill"), for: .normal)
        searchButton.tintColor = .label
        searchButton.contentVerticalAlignment = .fill
        searchButton.contentHorizontalAlignment = .fill
        searchButton.layer.cornerRadius = 40/2
        
        //SearchTextField Style
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Search"
        searchTextField.font = UIFont.preferredFont(forTextStyle: .title1)
        searchTextField.borderStyle = .roundedRect
        searchTextField.textAlignment = .natural
        searchTextField.backgroundColor = .systemFill
        
        //Stackview
        
        
        stackView.spacing = 5
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
    }
    
    private func layout(){
        view.addSubview(backgroundsImageView)
        stackView = UIStackView(arrangedSubviews: [locationButton,searchTextField,searchButton])
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            backgroundsImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundsImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: backgroundsImageView.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: backgroundsImageView.bottomAnchor),
            

            locationButton.heightAnchor.constraint(equalToConstant: 40),
            locationButton.widthAnchor.constraint(equalToConstant: 40),

            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
           
            //StackView
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5)
            
            
        
        ])
    }
    
}
