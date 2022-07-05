//
//  ViewController.swift
//  WeatherApp
//
//  Created by Hakan Or on 5.07.2022.
//

// MARK:  -TODO
// OpenWeatherMapAPI
// Font?
// Today - title ?
// tableview cell
// check constraints



import UIKit

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .systemGray6
        return tableView
    }()
    
    func configureTableView(){
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 150
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.text = "Today"
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var configuredButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.center = self.view.center
        button.configuration = createConfig()
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(buttonOnClicked), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    func createConfig() -> UIButton.Configuration{
        var config : UIButton.Configuration = .bordered()
        config.title = "+"
        config.titleAlignment = .center
        config.cornerStyle = .capsule
        config.baseBackgroundColor = .white
        return config
    }
    
    @objc func buttonOnClicked(){
        print("Tapped")
    }
    
    
    
    
//  MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Weather App"
        view.backgroundColor = UIColor(displayP3Red: 253, green: 253, blue: 253, alpha: 1)
        
        view.addSubview(tableView)
        configureTableView()
        
        view.addSubview(dayLabel)
        dayLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        dayLabel.leadingAnchor.constraint(equalTo: tableView.leadingAnchor).isActive = true
        
        view.addSubview(configuredButton)
        configuredButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        configuredButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -20).isActive = true
    }



}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        
        cell.set(title: "Showers", desc: "Columbia Falls, MT")
        return cell
    }
}
