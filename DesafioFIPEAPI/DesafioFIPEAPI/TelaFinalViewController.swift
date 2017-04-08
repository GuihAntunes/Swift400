//
//  TelaFinalViewController.swift
//  DesafioFIPEAPI
//
//  Created by Swift on 08/04/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class TelaFinalViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var labelAno: UILabel!
    @IBOutlet weak var labelMarca: UILabel!
    @IBOutlet weak var labelVeiculo: UILabel!
    @IBOutlet weak var labelCombustivel: UILabel!
    @IBOutlet weak var labelValor: UILabel!
    
    // MARK: - Propriedades
    
    // MARK: View Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fazerRequisicao()
        
    }

    // MARK: - General Methods
    
    func fazerRequisicao() {
        
        let url = URL(string: "http://fipeapi.appspot.com/api/1/carros/veiculo/\(idMarcaEscolhida)/\(idVeiculoEscolhido)/\(idVeiculoEspecifico).json")!
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if error == nil{
                
                if let dataTemp = data {
                    
                    var dicionario : [String:AnyObject] = [:]
                    
                    do{
                        
                        dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: .allowFragments) as! [String:AnyObject]
                        
                        DispatchQueue.main.async {
                            
                            self.labelAno.text = dicionario["ano_modelo"] as? String
                            self.labelValor.text = dicionario["preco"] as? String
                            self.labelCombustivel.text = dicionario["combustivel"] as? String
                            self.labelMarca.text = dicionario["marca"] as? String
                            self.labelVeiculo.text = dicionario["veiculo"] as? String
                            
                        }
                        
                    }catch{}
                    
                }else{
                    
                    // TODO: Tratativa erro data nula
                    
                }
                
            }else{
                
                // TODO: Tratativa erro request
                
            }
            
            
        }
        
        task.resume()
        
    }
    
    // MARK: - Actions
    
}
