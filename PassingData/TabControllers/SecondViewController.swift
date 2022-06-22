//
//  SecondViewController.swift
//  PassingData
//
//  Created by MAC on 22.06.2022.
//

import UIKit
import Foundation

//Completion handler model
class SecondViewController: UIViewController {
    
    var observer: NSObjectProtocol?
    
    let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 50, width: 200, height: 50))
        label.textAlignment = .center
        label.text = "Name: -"
        
        return label
    }()
    
    let button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("Set Name", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(label)
        
        view.addSubview(button)
        button.center = view.center
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        
        //Notifiaction
        observer = NotificationCenter.default.addObserver(forName: Notification.Name("ourCustom"), object: nil, queue: .main, using: {
            notification in
            
            guard let object = notification.object as? [String: UIColor] else {return}
            guard let color = object["color"] else {return}
            self.view.backgroundColor = color
        })

    }
    
    @objc private func didTapButton(){
        let textEntryVC = TextEntryCustomViewController()
        
        textEntryVC.completion = { [weak self] text in
            DispatchQueue.main.async {
                self?.label.text = text
            }
        }
        
        let vc = UINavigationController(rootViewController: textEntryVC)
        present(vc, animated: true)
    }

}
