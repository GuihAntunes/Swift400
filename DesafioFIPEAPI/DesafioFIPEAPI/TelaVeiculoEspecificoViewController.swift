//
//  TelaVeiculoEspecificoViewController.swift
//  DesafioFIPEAPI
//
//  Created by Swift on 08/04/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class TelaVeiculoEspecificoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Outlets
    @IBOutlet weak var tableViewVeiculoEspecifico: UITableView!
    
    // MARK: - Propriedades
    var arrayElementos : [[String:AnyObject]] = []
    
    // MARK: View Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setup()
        self.fazerRequisicao()
        
    }
    
    // MARK: - General Methods
    
    func setup() {
        
        self.tableViewVeiculoEspecifico.delegate = self
        self.tableViewVeiculoEspecifico.dataSource = self
        
    }
    
    func fazerRequisicao() {
        
        // Criando a URL
        let url = URL(string: "http://fipeapi.appspot.com/api/1/carros/veiculo/\(idMarcaEscolhida)/\(idVeiculoEscolhido).json")!
        
        // Criando a session
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task : URLSessionDataTask = session.dataTask(with: url) { (data, response, error) in
            
            if error == nil{
                
                if let dataTemp = data {
                    
                    do{
                        
                        self.arrayElementos = try JSONSerialization.jsonObject(with: dataTemp, options: .allowFragments) as! [[String:AnyObject]]
                        
                        DispatchQueue.main.async {
                            
                            self.tableViewVeiculoEspecifico.reloadData()
                            
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
    
    // MARK: - Métodos de UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayElementos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableViewVeiculoEspecifico.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        
        //
        if let valorVeiculo = (self.arrayElementos[indexPath.row]["veiculo"]) {
            
            cell.textLabel?.text = "\(valorVeiculo)"
            
        }
        
        if let valorName = (self.arrayElementos[indexPath.row]["name"]) {
            
            cell.detailTextLabel?.text = "\(valorName)"
            
        }
        
        
        //
        
        return cell
        
    }
    
    
    // MARK: - Métodos de UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        idVeiculoEspecifico = "\(self.arrayElementos[indexPath.row]["id"]!)"
        self.performSegue(withIdentifier: "segueTelaFinal", sender: nil)
        
    }
    
}
