//
//  ViewController.swift
//  WebServiceJSON
//
//  Created by Swift on 01/04/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var cepTextField: UITextField!
    @IBOutlet weak var logradouroTextField: UITextField!
    @IBOutlet weak var bairroTextField: UITextField!
    @IBOutlet weak var cidadeTextField: UITextField!
    @IBOutlet weak var ufTextField: UITextField!
    
    // MARK: Properties
    var dicionarioDados = [String : String]()
    
	// MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cepTextField.delegate = self
        
    }
    
    // MARK: - UITextFieldDelegate Methods
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if textField == self.cepTextField && !(self.cepTextField.text!.isEmpty) {

                
                let url = URL(string: "https://viacep.com.br/ws/\(textField.text!)/json/")
                
                let sessao = URLSession(configuration: URLSessionConfiguration.default)
                
                let tarefa : URLSessionDataTask = sessao.dataTask(with: url!, completionHandler: { (data, response, error) in
                    
                    if error == nil {
                        
                        
                        guard let _ = data else {
                            return
                        }
                        
                        do{
                            self.dicionarioDados = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String : String]
                            
                            DispatchQueue.main.async {
                                
                                self.cepTextField.text = self.dicionarioDados["cep"] ?? ""
                                self.logradouroTextField.text = self.dicionarioDados["logradouro"] ?? ""
                                self.bairroTextField.text = self.dicionarioDados["bairro"] ?? ""
                                self.cidadeTextField.text = self.dicionarioDados["localidade"] ?? ""
                                self.ufTextField.text = self.dicionarioDados["uf"] ?? ""
                                
                            }
                            
                            

                            
                        }catch{}
                        
                        
                    }
                    
                    
                    
                })
                
                tarefa.resume()
                
            
                
                print(self.dicionarioDados)
                
            
                
        }
        
    }

}

