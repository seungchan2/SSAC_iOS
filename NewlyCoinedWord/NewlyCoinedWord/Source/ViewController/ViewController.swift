//
//  ViewController.swift
//  NewlyCoinedWord
//
//  Created by 김승찬 on 2021/10/01.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    let wordDictionary : [String : String] = ["삼귀자" : "연애를 시작하기 전 썸 단계!", "윰차" : "구독자 유무 차별", "실매": "실시간 매니저", "꾸안꾸" : "꾸민 듯 안 꾸민 듯", "만반잘부" : "만나서 반가워 잘 부탁해"]
    let wordArray = ["삼귀자", "윰차", "실매", "꾸안꾸", "만반잘부"]
    
    // MARK: - @IBOutlets
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var meaningLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonUI()
        attrbuteTextField()
    }
    
    // MARK: - Functions
    
    private func setButtonUI() {
        buttons.forEach {
            $0.layer.cornerRadius = 7.5
            $0.layer.borderColor = UIColor.black.cgColor
            $0.layer.borderWidth = 1
        }
        for num in 0...wordArray.count - 1 {
            buttons[num].setTitle(wordArray[num], for: .normal)
        }
    }

    private func attrbuteTextField() {
        searchTextField.layer.borderColor = UIColor.black.cgColor
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    
    // MARK: @IBAction
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        for word in wordArray {
            if let meaning = wordDictionary[word] {
                if searchTextField.text == word {
                    meaningLabel.text = meaning
                }
            }; if searchTextField.text == "" && searchTextField.text != word {
                self.makeAlert(title: "알림", message: "찾으시는 단어가 없습니다.", okAction: { _ in
                    print("1")
                })
            }
        }
        
    }
    
    @IBAction func meaningChangeButton(_ sender: UIButton) {
        meaningLabel.text = sender.currentTitle
    }
}
extension ViewController
{
    func makeAlert(title : String, message: String, okAction: ((UIAlertAction) -> Void)?,
                   cancelAction : ((UIAlertAction)-> Void)? = nil, completion : (() -> Void)? = nil) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: okAction)
        alertViewController.addAction(okAction)
        
        self.present(alertViewController, animated: true, completion: completion)
    }
}
