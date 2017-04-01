//
//  ViewController.swift
//  DesafioXML
//
//  Created by Swift on 01/04/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, XMLParserDelegate, UITextFieldDelegate {

    // MARK: - Outlets
    @IBOutlet weak var cepTextField: UITextField!
    @IBOutlet weak var logradouroTextField: UITextField!
    @IBOutlet weak var bairroTextField: UITextField!
    @IBOutlet weak var localidadeTextField: UITextField!
    @IBOutlet weak var ufTextField: UITextField!
    
    
    // MARK: - Properties
    
    var dicionarioDados = [String : String]()
    
    var tagAtual = ""
    
    var conteudoTag = ""
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.cepTextField.delegate = self
        
    }
    
    // MARK: - Methods
    
    // MARK: - XMLParserDelegate Methods
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        self.tagAtual = elementName
        
        switch elementName {
        case "cep", "logradouro", "complemento", "bairro", "localidade", "uf", "unidade", "ibge", "gia":
            self.conteudoTag = ""
        default:
            break
        }
        
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        switch elementName {
        case "cep":
            self.dicionarioDados ["cep"] = self.conteudoTag
        case "logradouro":
        	self.dicionarioDados ["logradouro"] = self.conteudoTag
        case "complemento":
        	self.dicionarioDados ["complemento"] = self.conteudoTag
        case "bairro":
            self.dicionarioDados ["bairro"] = self.conteudoTag
        case "localidade":
            self.dicionarioDados ["localidade"] = self.conteudoTag
        case "uf":
            self.dicionarioDados ["uf"] = self.conteudoTag
        case "unidade":
            self.dicionarioDados ["unidade"] = self.conteudoTag
        case "ibge":
            self.dicionarioDados ["ibge"] = self.conteudoTag
        case "gia":
            self.dicionarioDados ["gia"] = self.conteudoTag
        default:
            break
        }
        
        self.conteudoTag = ""
        self.tagAtual = ""
        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        switch self.tagAtual {
        case "cep", "logradouro", "complemento", "bairro", "localidade", "uf", "unidade", "ibge", "gia":
            self.conteudoTag += string
        default:
            break
        }
        
    }
    
    func parserDidEndDocument(_ parser: XMLParser) {
        
        self.logradouroTextField.text = self.dicionarioDados["logradouro"]
        self.bairroTextField.text = self.dicionarioDados["bairro"]
        self.localidadeTextField.text = self.dicionarioDados["localidade"]
        self.ufTextField.text = self.dicionarioDados["uf"]
        self.cepTextField.text = self.dicionarioDados["cep"]
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let cep = textField.text else{
            return 
        }
        
        if textField == self.cepTextField {
            
            if !(textField.text!.isEmpty){
                
                // PATH: https://viacep.com.br/ws/01001000/xml/
                
                let urlArquivo = URL(string: "https://viacep.com.br/ws/\(cep)/xml/")
                
                let xmlParser = XMLParser(contentsOf: urlArquivo!)
                
                xmlParser?.delegate = self
                
                xmlParser?.parse()
                
            }
            
        }
        
    }
    


}

