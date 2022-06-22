//
//  TextEntryCustomViewController.swift
//  PassingData
//
//  Created by MAC on 22.06.2022.
//

import UIKit

class TextEntryCustomViewController: UIViewController {
    
    //public var completion, with parameters you want send back
    public var completion: ((String?) -> Void)?
        
    private let field: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter text here.."
        field.backgroundColor = .white
        field.textColor = .black
        return field
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapDoneButton))
        view.addSubview(field)
        field.frame = CGRect(x: 20, y: 100, width: view.frame.size.width-40, height: 55)
        field.becomeFirstResponder() //hide keyboard
    }
    
    @objc private func didTapDoneButton() {
        completion?(field.text)
        dismiss(animated: true, completion: nil)
    }
}
