//
//  ViewController.swift
//  BMI_Calculator
//
//  Created by 조규연 on 5/21/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var mainImageView: UIImageView!
    @IBOutlet var askHeightLabel: UILabel!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var askWeightLabel: UILabel!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var randomButton: UIButton!
    @IBOutlet var calculateButton: UIButton!
    
    var height: Float {
        get {
            return UserDefaults.standard.float(forKey: "height")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "height")
        }
    }
    
    var weight: Float {
        get {
            return UserDefaults.standard.float(forKey: "weight")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "weight")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightTextField.text = String(height)
        weightTextField.text = String(weight)
        
        configureLabel(titleLabel, text: "BMI Calculator", font: .boldSystemFont(ofSize: 24))
        configureLabel(messageLabel, text: "당신의 BMI 지수를\n알려드릴게요.", font: .systemFont(ofSize: 14))
        
        mainImageView.image = .image
        
        configureLabel(askHeightLabel, text: "키가 어떻게 되시나요?", font: .systemFont(ofSize: 15))
        configureLabel(askWeightLabel, text: "몸무게가 어떻게 되시나요?", font: .systemFont(ofSize: 15))
        
        configureTextField(heightTextField, placeholder: "m(미터) 단위로 숫자만 입력해주세요")
        configureTextField(weightTextField, placeholder: "kg 단위로 숫자만 입력해주세요")
        
        configureButton(randomButton, text: "랜덤으로 BMI 계산하기", tintColor: .brown, backgroundColor: .systemBackground, size: 12)
        configureButton(calculateButton, text: "결과 확인", tintColor: .white, backgroundColor: .systemPurple, size: 20)
    }
    
    @IBAction func randomButtonTapped(_ sender: UIButton) {
        let randomHeight = Float.random(in: 1.5...2.5)
        let randomWeight = Float.random(in: 40...200)
        
        showResultAlert(bmi: calculateBMI(height: randomHeight, weight: randomWeight))
        
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        if let height = Float(heightTextField.text!), let weight = Float(weightTextField.text!) {
            showResultAlert(bmi: calculateBMI(height: height, weight: weight))
            self.height = height
            self.weight = weight
        } else if heightTextField.text == "" && weightTextField.text == "" {
            showAlert(title: "아무것도 입력하지 않았습니다.", message: "키와 몸무게를 입력해주세요.")
        } else {
            showAlert(title: "잘못된 값을 입력하셨습니다.", message: "숫자만 입력해주세요.")
        }
    }
    
    func calculateBMI(height: Float, weight: Float) -> Float {
        if height > 10 {
            let mHeight = height / 100
            let result = weight / mHeight / mHeight
            
            return result
        } else {
            let result = weight / height / height
            
            return result
        }
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: "잘못된 값을 입력하셨습니다.", message: "숫자만 입력해주세요.", preferredStyle: .alert)
        let check = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(check)
        
        present(alert, animated: true)
    }
    
    func showResultAlert(bmi: Float) {
        let alert = UIAlertController(title: "BMI 계산 결과입니다.", message: "\(bmi)", preferredStyle: .alert)
        let check = UIAlertAction(title: "확인", style: .default)
        
        alert.addAction(check)
        
        present(alert, animated: true)
    }
    
    func configureLabel(_ label: UILabel, text: String, font: UIFont) {
        label.text = text
        label.font = font
        label.numberOfLines = 0
    }
    
    func configureTextField(_ textField: UITextField, placeholder: String) {
        
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1
        textField.placeholder = placeholder
    }
    
    func configureButton(_ button: UIButton, text: String, tintColor: UIColor, backgroundColor: UIColor?, size: CGFloat) {
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = 10
        button.tintColor = tintColor
        button.backgroundColor = backgroundColor
        button.titleLabel?.font = .systemFont(ofSize: size)
    }


}

