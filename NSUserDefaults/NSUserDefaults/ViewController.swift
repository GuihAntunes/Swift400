//
//  ViewController.swift
//  NSUserDefaults
//
//  Created by Swift on 22/04/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var sobrenomeTextField: UITextField!
    @IBOutlet weak var idadeTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    
    // MARK: - Propriedades
    
    let userDefaults = UserDefaults.standard
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    // MARK: View Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Métodos
    
    func verificaTextFieldsDigitadas(_ textFields : UITextField...) -> Bool {
        
        var tudoDigitado = true
        
        for textField in textFields {
            
            if textField.text!.isEmpty {
                
                tudoDigitado = false
                
            }
            
        }
        
        return tudoDigitado
        
    }
    
    // MARK: - Actions
    @IBAction func salvar(_ sender: UIButton) {
        
        let tudoPreenchido = self.verificaTextFieldsDigitadas(self.nomeTextField, self.sobrenomeTextField, self.idadeTextField, self.emailTextField, self.telefoneTextField)
        
        if tudoPreenchido {
            
            let nome = self.nomeTextField.text!
            let sobrenome = self.sobrenomeTextField.text!
            let idade = self.idadeTextField.text!
            let email = self.emailTextField.text!
            let telefone = self.telefoneTextField.text!
            
            //
            
            self.userDefaults.set(nome, forKey: "nome")
            self.userDefaults.set(sobrenome, forKey: "sobrenome")
            self.userDefaults.set(idade, forKey: "idade")
            self.userDefaults.set(email, forKey: "email")
            self.userDefaults.set(telefone, forKey: "telefone")
            
            //
            
            self.userDefaults.synchronize()
            
            //
            
            self.nomeTextField.text = nil
            self.sobrenomeTextField.text = nil
            self.idadeTextField.text = nil
            self.emailTextField.text = nil
            self.telefoneTextField.text = nil
            
            self.becomeFirstResponder()
            
        }
        
    }
    
    @IBAction func resgatar(_ sender: UIButton) {
        
        let nome = self.userDefaults.object(forKey: "nome") as? String
        let sobrenome = self.userDefaults.object(forKey: "sobrenome") as? String
        let idade = self.userDefaults.object(forKey: "idade") as? String
        let email = self.userDefaults.object(forKey: "email") as? String
        let telefone = self.userDefaults.object(forKey: "telefone") as? String
        
        //
        
        self.nomeTextField.text = nome 
        self.sobrenomeTextField.text = sobrenome
        self.idadeTextField.text = idade
        self.emailTextField.text = email
        self.telefoneTextField.text = telefone
        
        self.becomeFirstResponder()
        
    }
    
}

