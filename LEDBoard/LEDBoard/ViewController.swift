//
//  ViewController.swift
//  LEDBoard
//
//  Created by 김승찬 on 2021/10/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var ledTextField: UITextField!
    @IBOutlet var ledLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        actionCheckingPasswordTextField()
    }
    
    private func actionCheckingPasswordTextField() {
        ledTextField.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: UIControl.Event.allEditingEvents)
    }
    
    // MARK: @objc Function
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        ledLabel.text = ledTextField.text
    }
    
    
    @IBAction func sendButton(_ sender: Any) {
            }
    
}

