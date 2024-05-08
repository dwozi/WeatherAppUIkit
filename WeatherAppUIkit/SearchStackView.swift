//
//  SearchStackView.swift
//  WeatherAppUIkit
//
//  Created by Hakan Hardal on 8.05.2024.
//

import UIKit
class SearchStackView : UIStackView{
    //MARK: - Properties
    private let locationButton = UIButton(type: .system)
    private let searchButton = UIButton(type: .system)
    private let searchTextField = UITextField()
    
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        style()
        layout()
        
    }
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - Helpers


extension SearchStackView{
    
    private func style(){
        
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

    }
    
    private func layout(){
        
       addArrangedSubview(locationButton)
       addArrangedSubview(searchTextField)
       addArrangedSubview(searchButton)
        
        
        
        NSLayoutConstraint.activate([
            locationButton.heightAnchor.constraint(equalToConstant: 40),
            locationButton.widthAnchor.constraint(equalToConstant: 40),

            searchButton.heightAnchor.constraint(equalToConstant: 40),
            searchButton.widthAnchor.constraint(equalToConstant: 40),
        
        
        ])
        
    }
}
