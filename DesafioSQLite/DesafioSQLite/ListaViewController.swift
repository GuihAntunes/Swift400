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
    
    // MARK: - Propriedades
    
    var count = 0
    
    // MARK: View Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        let queryCount = "select count * from PESSOA"
        
        var resultado : OpaquePointer? = nil
        
        if sqlite3_prepare_v2(dataBase, queryCount, -1, &resultado, nil) == SQLITE_OK {
            
            while sqlite3_step(resultado) == SQLITE_ROW {
                
                count += 1
                
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
        return self.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        
        
        return cell
    }
    
}

extension ListaViewController : UITableViewDelegate {
    
    
    
}
