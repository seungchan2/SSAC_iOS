//
//  SignUpViewController.swift
//  SSAC_Nextflix
//
//  Created by 김승찬 on 2021/09/30.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: @IBOutlets
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var placeTextField: UITextField!
    @IBOutlet var recommendTextField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    @IBOutlet var controlSwitch: UISwitch!
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        assignTextFieldDelegate()
        initSwitchState()
        attributeTextFieldAndButton()
        textFieldPlaceholderColor()
        actionTextField()
    }
    
    //MARK: Functions
    
    // TextFieldDelegate 선언했는데 아직 쓰지 않음
    private func assignTextFieldDelegate() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    // 초기 Switch 상태를 off로 만듦.
    private func initSwitchState() {
        controlSwitch.setOn(false, animated: true)
    }
    
    // forEach를 써서 모서리를 둥글게 만듦.
    private func attributeTextFieldAndButton() {
        [emailTextField,passwordTextField,nicknameTextField,placeTextField,recommendTextField,signUpButton].forEach{
            $0?.layer.cornerRadius = 10
        }
    }
    
    // forEach를 써서 TextFieldPlaceholder의 색깔을 바꿈.
    private func textFieldPlaceholderColor() {
        [emailTextField,passwordTextField,nicknameTextField,placeTextField,recommendTextField].forEach{
            $0?.setPlaceholderColor(.white)
        }
    }
    
    // 조건 중에 Switch가 isOn되면 TextField를 숨겨야 해서 함수로 만듦.
    private func textFieldIsHiddenTrue() {
        nicknameTextField.isHidden = true
        placeTextField.isHidden = true
        recommendTextField.isHidden = true
    }
    
    // isOn이 false일 때, 다시 보여주기 위해 함수로 만듦.
    private func textFieldIsHiddenFalse() {
        nicknameTextField.isHidden = false
        placeTextField.isHidden = false
        recommendTextField.isHidden = false
    }
    
    // TextField가 실시간 반응을 해야해서 DidChange를 씀.
    private func actionTextField() {
        [emailTextField,passwordTextField].forEach{
            $0?.addTarget(self, action: #selector(SignUpViewController.textFieldDidChange(_:)), for: UIControl.Event.allEditingEvents)
        }
    }
    
    // MARK: @Objc Functions
    
    // TextField가 실시간 반응을 해야해서 DidChange를 씀.
    // passwordTextField.text 옵셔널 바인딩, 비밀번호 6글자 이상
    @objc func textFieldDidChange(_ textField: UITextField) {
        let isEmailEmpty = emailTextField.text == ""
        let isPasswordEmpty = passwordTextField.text == ""
        
        guard let password = passwordTextField.text else { return }
        
        signUpButton.isEnabled = !isEmailEmpty && !isPasswordEmpty && password.count > 5
        
    }
    
    // MARK: @IBActions
    
    // @Objc 써서 구현하는 방법도 있었는데 @IBAction 사용
    // 삼항연산자 사용
    @IBAction func switchTapped(_ sender: UISwitch) {
        controlSwitch.isOn ? textFieldIsHiddenTrue() : textFieldIsHiddenFalse()
    }
    
    // if let 구문을 써서 TextField.text 옵셔널 바인딩 하고
    // 미션 중에 버튼 클릭 시 정보가 나와야 하기 때문에 print문을 찍음.
    @IBAction func touchNextButton(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text, let nickname = nicknameTextField.text, let place = placeTextField.text, let recommend = recommendTextField.text {
            print(email)
            print(password)
            print(nickname)
            print(place)
            print(recommend)
        }
    }
}

    //MARK: TextFieldExtension

    // 만들고 아직 사용을 안했음
extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}

