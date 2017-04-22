//
//  ListaViewController.swift
//  DesafioSQLite
//
//  Created by Swift on 22/04/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ListaViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var pessoasTableView: UITableView!
    
    // MARK: - Propriedades
    var array = [Pessoa]()
    
    // MARK: View Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.pessoasTableView.dataSource = self
        self.pessoasTableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let queryAll = "select * from PESSOA"
        
        var resultado2 : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(dataBase, queryAll, -1, &resultado2, nil) == SQLITE_OK {
            
            while sqlite3_step(resultado2) == SQLITE_ROW {
                
                let codigo = sqlite3_column_int(resultado2, 0)
                
                let resultadoNome = sqlite3_column_text(resultado2, 1)
                
                let nome = String(cString: resultadoNome!)
                
                let resultadoSobrenome = sqlite3_column_text(resultado2, 2)
                
                let sobrenome = String(cString: resultadoSobrenome!)
                
                let idade = sqlite3_column_int(resultado2, 3)
                
                self.array.append(Pessoa(id: Int(codigo), nome: nome, sobrenome: sobrenome, idade: Int(idade)))
                
            }
            
        }else{
            
            print("Erro no prepare v2")
            
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Métodos
    
    // MARK: - Actions

    
}

extension ListaViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.array[indexPath.row].nome
        
        return cell
    }
    
}

extension ListaViewController : UITableViewDelegate {
    
    
    
}
