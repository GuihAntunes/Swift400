//
//  ViewController.swift
//  CoreData2
//
//  Created by Swift on 22/04/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var idadeTextField: UITextField!
    
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
        
        if !(self.nomeTextField.text!.isEmpty || self.idadeTextField.text!.isEmpty) {
            
            let nome = self.nomeTextField.text!
            let idade = self.idadeTextField.text!.intValue
            
            //
            
            let aluno = Aluno(context: self.context)
            aluno.nome = nome
            aluno.idade = Int16(idade)
            
            //
            
            do{
                
                try self.context.save()
                
                self.nomeTextField.text = nil
                self.idadeTextField.text = nil
                
                self.becomeFirstResponder()
                
            }catch{ print("Erro Catched!") }
            
        }
        
    }
    
    @IBAction func resgatar(_ sender: UIButton) {
        
    	let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Aluno")
        
        do{
            
            let resultado = try self.context.fetch(fetchRequest)
            
            let alunos = resultado as! [Aluno]
            
            for aluno in alunos {
                
                print("Nome: \(aluno.nome!)\nIdade: \(aluno.idade)")
                
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
