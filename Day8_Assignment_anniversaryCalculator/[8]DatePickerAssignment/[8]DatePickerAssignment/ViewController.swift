//
//  ViewController.swift
//  [8]DatePickerAssignment
//
//  Created by 김승찬 on 2021/10/07.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var oneHundrendLabel: UILabel!
    @IBOutlet var twoHundrendLabel: UILabel!
    @IBOutlet var threeHundrendLabel: UILabel!
    @IBOutlet var fourHundrendLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func setDatePickeriOS() {
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            datePicker.preferredDatePickerStyle = .wheels
        }
    }
    
    private func updateDates(date: Date) {
        let format = DateFormatter()
        format.dateFormat = "yyyy년\nMM월 dd일"
        oneHundrendLabel.text = format.string(from: Date(timeInterval: 86400 * 100, since: date))
        twoHundrendLabel.text = format.string(from: Date(timeInterval: 86400 * 200, since: date))
        threeHundrendLabel.text = format.string(from: Date(timeInterval: 86400 * 300, since: date))
        fourHundrendLabel.text = format.string(from: Date(timeInterval: 86400 * 400, since: date))
    }
    
    @IBAction func tappedDatePickerValueChanged(_ sender: UIDatePicker) {
        updateDates(date: sender.date)
    }
}
