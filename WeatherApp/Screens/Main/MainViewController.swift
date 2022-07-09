//
//  MainViewController.swift
//  WeatherApp
//
//  Created by Hakan Or on 5.07.2022.
//

// TODO: OpenWeatherMapAPI
// TODO: Font?
// TODO: Today - title ?
// TODO: tableview cell
// TODO: check constraints

import UIKit

class MainViewController: UIViewController {
    // MARK: - Subviews
    private lazy var configuredButton: UIButton = {
        let button = UIButton(type: .contactAdd)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.center = self.view.center
        button.addTarget(self, action: #selector(buttonOnClicked), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .systemGray6
        return tableView
    }()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title="Today"
        view.backgroundColor = UIColor(displayP3Red: 253, green: 253, blue: 253, alpha: 1)
        
        guard let navigationBar = self.navigationController?.navigationBar else {return}
        
        navigationBar.addSubview(configuredButton)
        configuredButton.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor,constant: -10).isActive = true
        configuredButton.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor,constant: -20).isActive = true
        
        view.addSubview(tableView)
        configureTableView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    // MARK: - Setup
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
    
    // MARK: - User Actions
    @objc func buttonOnClicked(){
        print("Tapped")
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
        
        cell.set(title: "Showers", desc: "Columbia Falls, MT")
        return cell
    }
}
