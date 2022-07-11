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
        tableView.contentInset = .init(top: 20, left: 0, bottom: 20, right: 0)
        tableView.separatorStyle = .none
        return tableView
    }()
    
    var citiesList:[String] = Array()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add New City"
        view.backgroundColor = .white
        
        citiesList = CityUtils.allCities
        
        // FIXME: Shortcut
        [textField, tableView].forEach(view.addSubview)
       
        textField.borderStyle = .roundedRect
        textField.layer.applySketchShadow()
        
        tableView.dataSource = self
        tableView.delegate = self
        textField.delegate = self
        
        textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true
        
        tableView.topAnchor.constraint(equalTo: textField.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        view.bringSubviewToFront(textField)
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
       navigationItem.largeTitleDisplayMode = .never
    }
    
    
    // MARK: - User Actions
    @objc func sendDataAndPop(data:String){
        let dataToBeSent = data
        self.delegate?.sendDataToFirstViewController(data: dataToBeSent )
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
        sendDataAndPop(data: citiesList[indexPath.row])
    }
}

// MARK: - Protocols
protocol MyDataSendingDelegateProtocol
{
    func sendDataToFirstViewController(data:String)
}
