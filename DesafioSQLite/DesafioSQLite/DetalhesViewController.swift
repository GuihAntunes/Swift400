//
//  DetalhesViewController.swift
//  DesafioSQLite
//
//  Created by Swift on 22/04/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class DetalhesViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var sobrenomeLabel: UILabel!
    @IBOutlet weak var idadeLabel: UILabel!
    
    // MARK: - Propriedades
    
    // MARK: View Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.idLabel.text = ""
        self.idadeLabel.text = ""
        self.sobrenomeLabel.text = ""
        self.idLabel.text = ""
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Métodos
    
    // MARK: - Actions
    
}
