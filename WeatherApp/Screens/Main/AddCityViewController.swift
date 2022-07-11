//
//  AddCityViewController.swift
//  WeatherApp
//
//  Created by Hakan Or on 10.07.2022.
//

import UIKit

class AddCityViewController: UIViewController {
    
    var delegate: MyDataSendingDelegateProtocol?
    
    // MARK: - Subviews
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Start typing a city name..."
        textField.addTarget(self, action: #selector(searchRecords(_ :)), for: .editingChanged)
        textField.backgroundColor = .white
        
        textField.leftImage(UIImage(systemName: "house.circle"), imageWidth: 20, padding: 10)
        
        return textField
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        return tableView
    }()
    
    var citiesList:[String] = Array()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        citiesList = CityUtils.allCities
        
        view.backgroundColor = .white
        
        // FIXME: Shortcut
        [textField, tableView].forEach(view.addSubview)
       
        textField.borderStyle = .roundedRect
        textField.layer.applySketchShadow()
        tableView.layer.applySketchShadow()
        
        tableView.dataSource = self
        tableView.delegate = self
        textField.delegate = self
        
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true
        
        tableView.topAnchor.constraint(equalTo: textField.bottomAnchor,constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

    }
    
    
    // MARK: - User Actions
    @objc func sendDataAndPop(){
        let dataToBeSent = self.textField.text
        self.delegate?.sendDataToFirstViewController(data: dataToBeSent ?? "null")
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func searchRecords(_ textField: UITextField) {
        citiesList.removeAll()
        if textField.text?.count != 0 {
            for city in CityUtils.allCities {
                if let cityToSearch = textField.text{
                    let range = city.lowercased().range(of: cityToSearch, options: .caseInsensitive, range: nil, locale: nil)
                    if range != nil {
                        citiesList.append(city)
                    }
                }
            }
        } else {
            for city in CityUtils.allCities {
                citiesList.append(city)
            }
        }
        self.tableView.reloadData()
    }

}

// MARK: - UITextFieldDelegate
extension AddCityViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("TextField did begin editing method called")
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("TextField did end editing method called")
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("TextField should begin editing method called")
        return true;
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("TextField should clear method called")
        return true;
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("TextField should end editing method called")
        return true;
    }
    
}


// MARK: - UITableViewDelegate
extension AddCityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return citiesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = citiesList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        sendDataAndPop()
    }
}

// MARK: - Protocols
protocol MyDataSendingDelegateProtocol
{
    func sendDataToFirstViewController(data:String)
}
