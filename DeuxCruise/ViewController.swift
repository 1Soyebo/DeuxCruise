//
//  ViewController.swift
//  DeuxCruise
//
//  Created by Ibukunoluwa Soyebo on 21/12/2020.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import SwiftValidator


class ViewController: UIViewController {

    @IBOutlet weak var txtFirstname: MDCOutlinedTextField!
    @IBOutlet weak var txtLastname: MDCOutlinedTextField!
    @IBOutlet weak var txtUsername: MDCOutlinedTextField!
    @IBOutlet weak var txtPassword: MDCOutlinedTextField!
    @IBOutlet weak var txtConfirmPassword: MDCOutlinedTextField!
    
    let validator = Validator()
    
    var array_text_fields: [MDCOutlinedTextField] {
        return [txtPassword, txtUsername, txtLastname, txtFirstname, txtConfirmPassword]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true

        self.title = "Sign Up"
        
        array_text_fields.forEach({
            $0.label.text = $0.placeholder
            $0.setLeadingAssistiveLabelColor(.red, for: .normal)
        })
        
        validator.registerField(textField: txtFirstname, errorLabel: txtFirstname.leadingAssistiveLabel, rules: [RequiredRule()])
        validator.registerField(textField: txtLastname, errorLabel: txtLastname.leadingAssistiveLabel, rules: [RequiredRule()])
        validator.registerField(textField: txtUsername, errorLabel: txtUsername.leadingAssistiveLabel, rules: [RequiredRule()])
        validator.registerField(textField: txtPassword, errorLabel: txtPassword.leadingAssistiveLabel, rules: [RequiredRule(), PasswordRule()])
        validator.registerField(textField: txtConfirmPassword, errorLabel: txtConfirmPassword.leadingAssistiveLabel, rules: [RequiredRule(), ConfirmationRule.init(confirmField: txtPassword)])

        self.navigationController?.pushViewController(AnimationViewController(nibName: "AnimationViewController", bundle: nil), animated: true)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    
    @IBAction func btnSignUpPressed(_ sender: Any) {
        validator.validate(delegate: self)
    }
    

}

extension ViewController: ValidationDelegate{
    
    func validationSuccessful() {
        self.navigationController?.pushViewController(AnimationViewController(nibName: "AnimationViewController", bundle: nil), animated: true)
    }
    
    func validationFailed(errors: [UITextField : ValidationError]) {
        for (field, error) in errors{
            field.layer.borderColor = UIColor.red.cgColor
            error.errorLabel?.text = error.errorMessage // works if you added labels
            error.errorLabel?.isHidden = false
        }
    }
    
    
}
