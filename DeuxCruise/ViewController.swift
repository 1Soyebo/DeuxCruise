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

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Sign Up"
        
        validator.registerField(textField: txtFirstname, errorLabel: txtFirstname.leadingAssistiveLabel, rules: [RequiredRule()])
        validator.registerField(textField: txtLastname, errorLabel: txtLastname.leadingAssistiveLabel, rules: [RequiredRule()])
        validator.registerField(textField: txtUsername, errorLabel: txtUsername.leadingAssistiveLabel, rules: [RequiredRule()])
        validator.registerField(textField: txtPassword, errorLabel: txtPassword.leadingAssistiveLabel, rules: [RequiredRule(), PasswordRule()])
        validator.registerField(textField: txtConfirmPassword, errorLabel: txtConfirmPassword.leadingAssistiveLabel, rules: [RequiredRule(), ConfirmationRule.init(confirmField: txtPassword)])

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    @IBAction func btnSignUpPressed(_ sender: Any) {
        validator.validate(delegate: self)
    }
    

}

extension ViewController: ValidationDelegate{
    
    func validationSuccessful() {
        <#code#>
    }
    
    func validationFailed(errors: [UITextField : ValidationError]) {
        for (field, error) in errors{
            field.layer.borderColor = UIColor.red.cgColor
            error.errorLabel?.text = error.errorMessage // works if you added labels
            error.errorLabel?.isHidden = false
        }
    }
    
    
}
