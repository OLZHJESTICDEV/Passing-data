//
//  FourthViewController.swift
//  PassingData
//
//  Created by MAC on 22.06.2022.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 150, height: 50))
        button.setTitle("Choose Color", for: .normal)
        button.backgroundColor = .red
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(chooseColor), for: .touchUpInside)
    }
    
    @objc private func chooseColor() {
        let vc = ColorChooseViewController()
        vc.colorSelectionDelegate = self
        present(vc, animated: true)
    }

}

extension FourthViewController: ColorSelectionDelegate {
    func didTapColorChoice(color: UIColor) {
        view.backgroundColor = color
    }
}
