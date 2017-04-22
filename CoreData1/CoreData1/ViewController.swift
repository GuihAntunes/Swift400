//
//  ViewController.swift
//  CoreData1
//
//  Created by Swift on 22/04/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var idadetextField: UITextField!
    
    // MARK: - Propriedades
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
    
    // MARK: - Actions
    @IBAction func cadastrar(_ sender: UIButton) {
        
        if !(self.nomeTextField.text!.isEmpty || self.idadetextField.text!.isEmpty) {
            
            // Resgatando os valores
            
            let nome = self.nomeTextField.text
            let idade = self.idadetextField.text?.intValue
            
            // Instanciando o objeto do Core Data - forEntityName -> Nome da entidade criada no datamodel
            let objetoCD = NSEntityDescription.insertNewObject(forEntityName: "Aluno", into: self.context)
            
            // forKey deve condizer com o nome da entidade declarada no datamodel
            objetoCD.setValue(nome, forKey: "nome")
            objetoCD.setValue(idade, forKey: "idade")
            
            // Salvando
            
            do{
                
                try self.context.save()
                
                print("Registro inserido com sucesso")
                
                //
                
                self.nomeTextField.text = nil
                self.idadetextField.text = nil
                
                //
                
                self.becomeFirstResponder()
                
            }catch{}
            
        }
        
    }
    
    @IBAction func resgatar(_ sender: UIButton) {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Aluno")
        
        do {
            
            let alunos = try self.context.fetch(fetchRequest)
            
            for aluno in alunos {
                
                let nome = (aluno as AnyObject).value(forKey: "nome") as! String
                
                let idade = ((aluno as AnyObject).value(forKey: "idade") as AnyObject).int32Value
                
                // Exibindo os valores
                
                print("Nome: \(nome)\n Idade: \(idade!)")
                
            }
            
        }catch{}
        
    }
    
}

extension String {
    
    var intValue : Int{
        
        let conversao = self as NSString
        
        return Int(conversao.intValue)
        
    }
    
}
