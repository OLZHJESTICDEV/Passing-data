//
//  ViewController.swift
//  PassingData
//
//  Created by MAC on 22.06.2022.
//

import UIKit

//Custom initializer
//Completion handler (closure)
//NotificationCenter post

class ViewController: UIViewController {
    
    private let data = [
        ["apple", "google", "microsoft"],
        ["almaty", "astana", "shymkent"],
        ["one", "two", "three"],
    ]
    
    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let vc = SecondCustomViewController(selectedItem: data[indexPath.section][indexPath.row], relatedItems: data[indexPath.section])
        
        present(UINavigationController(rootViewController: vc), animated: true)
    }
}
