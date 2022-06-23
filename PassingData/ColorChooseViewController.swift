//
//  ColorChooseViewController.swift
//  PassingData
//
//  Created by MAC on 22.06.2022.
//

import UIKit

protocol ColorSelectionDelegate {
    func didTapColorChoice(color: UIColor)
}

class ColorChooseViewController: UIViewController {
    
    var colorSelectionDelegate: ColorSelectionDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        let button1 = UIButton(frame: CGRect(x: 100, y: 100, width: 150, height: 50))
        button1.setTitle("Yellow", for: .normal)
        button1.backgroundColor = .yellow
        button1.setTitleColor(.black, for: .normal)
        view.addSubview(button1)
        button1.addTarget(self, action: #selector(chooseToYellow), for: .touchUpInside)
        
        let button2 = UIButton(frame: CGRect(x: 100, y: 200, width: 150, height: 50))
        button2.setTitle("Gray", for: .normal)
        button2.backgroundColor = .gray
        button2.setTitleColor(.black, for: .normal)
        view.addSubview(button2)
        button2.addTarget(self, action: #selector(chooseToGray), for: .touchUpInside)
    }
    
    @objc private func chooseToYellow() {
        colorSelectionDelegate.didTapColorChoice(color: .yellow)
        dismiss(animated: true)
    }
    
    @objc private func chooseToGray() {
        colorSelectionDelegate.didTapColorChoice(color: .gray)
        dismiss(animated: true)

    }

}
