//
//  TelaVeiculosViewController.swift
//  DesafioFIPEAPI
//
//  Created by Swift on 08/04/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class TelaVeiculosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Outlets
    @IBOutlet weak var tableViewVeiculos: UITableView!
    
    // MARK: - Properties
    var arrayElementos : [[String:AnyObject]] = []
    
    // MARK: View Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
        self.fazerRequisicao()
        
    }
    
    // MARK: - General Methods
    
    func setup() {
        
        self.tableViewVeiculos.delegate = self
        self.tableViewVeiculos.dataSource = self
        
    }
    
    func fazerRequisicao() {
        
        // Criando a URL
        let url = URL(string: "http://fipeapi.appspot.com/api/1/carros/veiculos/\(idMarcaEscolhida).json")!
        
        // Criando a session
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task : URLSessionDataTask = session.dataTask(with: url) { (data, response, error) in
            
            if error == nil{
                
                if let dataTemp = data {
                    
                    do{
                        
                        self.arrayElementos = try JSONSerialization.jsonObject(with: dataTemp, options: .allowFragments) as! [[String:AnyObject]]
                        
                        DispatchQueue.main.async {
                            
                            self.tableViewVeiculos.reloadData()
                            
                        }
                        
                    }catch{}
                    
                }else{
                    
                    self.criaAlerta(titulo: "Errrooou!", mensagem: "Xiii, data nula!")
                    
                }
                
            }else{
                
                self.criaAlerta(titulo: "Errrroou!", mensagem: "Xiii, erro na requisição!")
                
            }
            
        }
        
        task.resume()
        
    }
    
    func criaAlerta(titulo : String, mensagem : String) {
        
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        
        let acaoOk = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alerta.addAction(acaoOk)
        
        self.present(alerta, animated: true, completion: nil)
        
    }
    
    // MARK: - Actions
    
    // MARK: - UITableViewDataSource Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayElementos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewVeiculos.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        
        //
        if let valor = (self.arrayElementos[indexPath.row]["fipe_name"]) {
            
            cell.textLabel?.text = "\(valor)"
            
        }
        
        
        //
        
        return cell
        
    }
    
    // MARK: - Métodos de UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        idVeiculoEscolhido = "\(self.arrayElementos[indexPath.row]["id"]!)"
        self.performSegue(withIdentifier: "segueVeiculoEspecifico", sender: nil)
        
        
    }
    
}
