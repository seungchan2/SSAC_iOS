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
        loadTextFieldText()
    }
    
    private func loadTextFieldText() {
        ledTextField.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: UIControl.Event.allEditingEvents)
    }
    
    private func changeTextColorRandom() {
       
        let red: CGFloat = CGFloat.random(in: 0...1)
        let green: CGFloat = CGFloat.random(in: 0...1)
        let blue: CGFloat = CGFloat.random(in: 0...1)
    
        self.ledLabel.textColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
    
    // MARK: @objc Function
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        ledLabel.text = ledTextField.text
    }
    
    
    @IBAction func sendButton(_ sender: Any) {
        ledLabel.text = ledTextField.text
    }
    
    @IBAction func changeColorButton(_ sender: UIButton) {
        changeTextColorRandom()
    }
}

