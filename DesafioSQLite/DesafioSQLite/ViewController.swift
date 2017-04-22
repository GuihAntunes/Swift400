//
//  ViewController.swift
//  DesafioSQLite
//
//  Created by Swift on 22/04/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

let caminhoSandBox = NSHomeDirectory()
let pathDocuments = (caminhoSandBox as NSString).appendingPathComponent("Documents")
let pathArquivo = (pathDocuments as NSString).appendingPathComponent("arquivo.sqlite")

var dataBase : OpaquePointer? = nil

class ViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var sobrenomeTextField: UITextField!
    @IBOutlet weak var idadeTextField: UITextField!
    
    // MARK: - Propriedades
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    // MARK: View Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(pathDocuments)
        
        if FileManager.default.fileExists(atPath: pathArquivo) {
            
            if sqlite3_open(pathArquivo, &dataBase) == SQLITE_OK {
                
                print("Banco aberto com sucesso!")
                
            }else{
                
                print("Erro ao abrir o banco")
                
            }
            
        }else{
            
            if sqlite3_open(pathArquivo, &dataBase) == SQLITE_OK {
                
                print("Banco criado com sucesso")
                
                let create = "create table if not exists PESSOA (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, nome TEXT, sobrenome TEXT, idade INTEGER)"
                
                if sqlite3_exec(dataBase, create, nil, nil, nil) == SQLITE_OK {
                    
                    print("Tabela criada com sucesso!")
                    
                }else{
                    
                    print("Erro ao criar a tabela! \(sqlite3_errmsg(dataBase))")
                    
                }
                
            }else{
                
                print("Erro ao criar o banco!")
                
            }
            
        }
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Métodos
    
    // MARK: - Actions
    @IBAction func cadastrarRegistro(_ sender: UIButton) {
        
        guard let nome = self.nomeTextField.text, let sobrenome = self.sobrenomeTextField.text, let idade = self.idadeTextField.text else {
            return 
        }
        
        if !(nome.isEmpty || sobrenome.isEmpty || idade.isEmpty) {
            
         	let insert = "INSERT INTO PESSOA VALUES (NULL, '\(nome)', '\(sobrenome)', \(idade))"  
            
            if sqlite3_exec(dataBase, insert, nil, nil, nil) == SQLITE_OK {
                
                print("Inserted data!")
                self.nomeTextField.text = ""
                self.sobrenomeTextField.text = ""
                self.idadeTextField.text = ""
                
                self.becomeFirstResponder() 
                
            }else{
                
                print("Deu ruim no insert!")
                
            }
            
        }
        
    }
    
    
}



