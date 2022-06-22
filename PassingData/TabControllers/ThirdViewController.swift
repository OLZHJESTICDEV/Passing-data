//
//  ThirdViewController.swift
//  PassingData
//
//  Created by MAC on 22.06.2022.
//

import UIKit

//Подписать остальные окна на прослушивание. Можно передать любые данные.
class ThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width:200, height: 50))
        button.center = view.center
        button.setTitle("FireEvent", for: .normal)
        button.backgroundColor = .red
        button.setTitleColor(.white, for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton(){
        NotificationCenter.default.post(name: Notification.Name("ourCustom"), object: ["color": UIColor.red])
    }

}
