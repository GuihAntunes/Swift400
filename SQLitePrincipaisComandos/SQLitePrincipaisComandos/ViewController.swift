//
//  ViewController.swift
//  SQLitePrincipaisComandos
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
    
    // MARK: - Propriedades
    
    // MARK: View Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print(pathDocuments)
        
        // Verificando se o arquivo existe
        if FileManager.default.fileExists(atPath: pathArquivo) {
            
            // Caso exista
            
            // Tentando abrir o banco
            if sqlite3_open(pathArquivo, &dataBase) == SQLITE_OK {
                // Caso o banco seja aberto
                
                print("Banco aberto com sucesso")
                
//                inserirRegistroNoBanco(comNome: "TESTE", eIdade: 42)
                
            }else{
                // Caso o banco não seja aberto
                
                print("Erro ao abrir o banco")
            }
            
        }else{
            // Caso não exista
            
            if sqlite3_open(pathArquivo, &dataBase) == SQLITE_OK {
                
                // Caso o banco tenha sido criado
                print("Banco criado com sucesso")
                
                // Caso o banco seja criado, colocamos nele nossa tabela
                let comando = "create table if not exists ALUNOS (id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT, nome TEXT, idade INTEGER)"
                
                // Criando a tabela
                if sqlite3_exec(dataBase, comando, nil, nil, nil) == SQLITE_OK {
                    // Caso a tabela tenha sido criada
                    print("tabela criada com sucesso")
                    
                    
                }else{
                    // Caso tenha dado erro ao criar a tabela
                    print("Erro ao criar a tabela: \(sqlite3_errmsg(dataBase))")
                    
                }
                
            }else{
                
                // Caso tenha ocorrido algum problema
                print("Erro ao criar o banco")
                
            }
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Métodos
    
    func inserirRegistroNoBanco(comNome nome : String, eIdade idade : Int) {
        
        let queryInsercao = "INSERT INTO ALUNOS VALUES (NULL, '\(nome)', \(idade))"
        
        if sqlite3_exec(dataBase, queryInsercao, nil, nil, nil) ==  SQLITE_OK {
            
            print("Registro inserido com sucesso")
            
        }else{
            
            print("Erro ao inserir registro")
            
        }
        
    }
    
    // MARK: - Actions
    
    @IBAction func selectTudo(_ sender: UIButton) {
        
        let query = "select * from ALUNOS"
        
        var resultado : OpaquePointer? = nil
        
        // Função que executa uma ação com retorno
        
        if sqlite3_prepare_v2(dataBase, query, -1, &resultado, nil) == SQLITE_OK {
            
            while sqlite3_step(resultado) == SQLITE_ROW {
                
                // Resgatando os valores
                let codigo = sqlite3_column_int(resultado, 0)
                
                let resultadoNome = sqlite3_column_text(resultado, 1)
                
                let nome = String(cString: resultadoNome!)
                
                let idade = sqlite3_column_int(resultado, 2)
                
                print("Nome: \(nome)\n ID: \(codigo)\nIdade: \(idade)")
                
            }
            
            sqlite3_finalize(resultado)
        
        }else{
            
            print("Erro na função prepare_v2")
            
            
        }
        
    }
    
    @IBAction func selectWhere(_ sender: UIButton) {
        
        let query = "select * from ALUNOS where idade = 24"
        
        var resultado : OpaquePointer? = nil
        
        // Função que executa uma ação com retorno
        
        if sqlite3_prepare_v2(dataBase, query, -1, &resultado, nil) == SQLITE_OK {
            
            while sqlite3_step(resultado) == SQLITE_ROW {
                
                // Resgatando os valores
                let codigo = sqlite3_column_int(resultado, 0)
                
                let resultadoNome = sqlite3_column_text(resultado, 1)
                
                let nome = String(cString: resultadoNome!)
                
                let idade = sqlite3_column_int(resultado, 2)
                
                print("Nome: \(nome)\n ID: \(codigo)\nIdade: \(idade)")
                
            }
            
            sqlite3_finalize(resultado)
            
        }else{
            
            print("Erro na função prepare_v2")
            
            
        }
        
    }
    
    @IBAction func selectWhereLike(_ sender: UIButton) {
        
        let query = "select * from ALUNOS where nome LIKE 'G%'"
        
        var resultado : OpaquePointer? = nil
        
        // Função que executa uma ação com retorno
        
        if sqlite3_prepare_v2(dataBase, query, -1, &resultado, nil) == SQLITE_OK {
            
            while sqlite3_step(resultado) == SQLITE_ROW {
                
                // Resgatando os valores
                let codigo = sqlite3_column_int(resultado, 0)
                
                let resultadoNome = sqlite3_column_text(resultado, 1)
                
                let nome = String(cString: resultadoNome!)
                
                let idade = sqlite3_column_int(resultado, 2)
                
                print("Nome: \(nome)\n ID: \(codigo)\nIdade: \(idade)")
                
            }
            
            sqlite3_finalize(resultado)
            
        }else{
            
            print("Erro na função prepare_v2")
            
            
        }
        
    }
    
    @IBAction func updateRegistro(_ sender: UIButton) {
        
        // Alem de inserir novos registros, podemos também alterar registros em nosso banco de dados com o comando update
        
        let query = "UPDATE ALUNOS SET NOME = 'Jose Junior' WHERE ID = 3"
        
        if sqlite3_exec(dataBase, query, nil, nil, nil) == SQLITE_OK {
            
            print("Updated com sucesso!")
            
        }else{
            
            print("Deu ruim!")
            
        }
        
    }
    
    @IBAction func deleteRegistro(_ sender: UIButton) {
        
        let query = "DELETE FROM ALUNOS WHERE ID = 1"
        
        if sqlite3_exec(dataBase, query, nil, nil, nil) == SQLITE_OK {
            
            print("Delete feito com sucesso")
            
        }else{
            
            print("Erro no delete!")
            
        }
        
    }

    
}

