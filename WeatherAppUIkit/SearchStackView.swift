//
//  SearchStackView.swift
//  WeatherAppUIkit
//
//  Created by Hakan Hardal on 8.05.2024.
//

import UIKit
protocol SearchStackViewDelegate : AnyObject{
    func didFetchWeather(_ searchStackView: SearchStackView,weatherModel: WeatherModel)
    func didFailWithError(_ searcStackView: SearchStackView,error: ServiceError)
}
class SearchStackView : UIStackView{
    //MARK: - Properties
    weak var delegate : SearchStackViewDelegate?
    private let locationButton = UIButton(type: .system)
    private let searchButton = UIButton(type: .system)
    private let searchTextField = UITextField()
    
    private let service = WeatherService()
    
    
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
        searchButton.addTarget(self, action: #selector(handleSearchButton), for: .touchUpInside)
        
        //SearchTextField Style
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        searchTextField.placeholder = "Search"
        searchTextField.font = UIFont.preferredFont(forTextStyle: .title1)
        searchTextField.borderStyle = .roundedRect
        searchTextField.textAlignment = .natural
        searchTextField.backgroundColor = .systemFill
        searchTextField.delegate = self

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


//MARK: - Selector
extension SearchStackView{
    @objc private func handleSearchButton(_ sender: UIButton){
        self.searchTextField.endEditing(true)
    }
}

//MARK: - UITextFieldDelegate
extension SearchStackView : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Tıklandi")
        return self.searchTextField.endEditing(true)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if searchTextField.text != ""{
            return true
        }else{
            searchTextField.placeholder = "Search"
            return false
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let cityName = searchTextField.text else {return}
        service.fetchWeather(forcityName: cityName) { result in
            switch result {
            case .success(let success):
                self.delegate?.didFetchWeather(self, weatherModel: success)
            case .failure(let failure):
                print(failure)
                self.delegate?.didFailWithError(self, error: failure)
            }
        }
        searchTextField.text = ""
    }
}
