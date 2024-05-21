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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureLabel(label: titleLabel, text: "BMI Calculator", font: .boldSystemFont(ofSize: 24))
        configureLabel(label: messageLabel, text: "당신의 BMI 지수를\n알려드릴게요.", font: .systemFont(ofSize: 14))
        
        mainImageView.image = .image
        
        configureLabel(label: askHeightLabel, text: "키가 어떻게 되시나요?", font: .systemFont(ofSize: 15))
        configureLabel(label: askWeightLabel, text: "몸무게가 어떻게 되시나요?", font: .systemFont(ofSize: 15))
        
        configureTextField()
        
        configureButton(button: randomButton, text: "랜덤으로 BMI 계산하기", tintColor: .brown, backgroundColor: .systemBackground, size: 12)
        configureButton(button: calculateButton, text: "결과 확인", tintColor: .white, backgroundColor: .systemPurple, size: 20)
    }
    
    @IBAction func randomButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
    }
    
    func configureLabel(label: UILabel, text: String, font: UIFont) {
        label.text = text
        label.font = font
        label.numberOfLines = 0
    }
    
    func configureTextField() {
        let textfields = [heightTextField, weightTextField]
        
        textfields.forEach { $0?.layer.cornerRadius = 10
            $0?.layer.borderWidth = 1
        }
    }
    
    func configureButton(button: UIButton, text: String, tintColor: UIColor, backgroundColor: UIColor?, size: CGFloat) {
        button.setTitle(text, for: .normal)
        button.layer.cornerRadius = 10
        button.tintColor = tintColor
        button.backgroundColor = backgroundColor
        button.titleLabel?.font = .systemFont(ofSize: size)
    }


}

