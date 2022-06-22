//
//  SecondCustomViewController.swift
//  PassingData
//
//  Created by MAC on 22.06.2022.
//

import UIKit

class SecondCustomViewController: UIViewController {

    
    private let selectedItem: String
    private let relatedItems: [String]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedItem.uppercased()
        view.backgroundColor = .systemBackground
        
        let label = UILabel(frame: view.bounds)
        view.addSubview(label)
        label.textAlignment = .center
        label.numberOfLines = -1
        for item in relatedItems {
            label.text = (label.text ?? "") + " " + item
        }
}
    
    init(selectedItem: String,relatedItems: [String] ) {
        self.selectedItem = selectedItem
        self.relatedItems = relatedItems
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {  //default
        fatalError("init(coder:) has not been implemented")
    }
    

}
