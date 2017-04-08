//
//  ViewController.swift
//  NSURLSession
//
//  Created by Swift on 08/04/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    // MARK: - Propriedades
    var urlBase = URL(string: "https://httpbin.org/")!
    
    // MARK: View Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: - Métodos
    
    // MARK: - Actions
    @IBAction func fazerRequisicaoGet(_ sender: UIButton) {
        
        let url = urlBase.appendingPathComponent("/get")
        
        let sessao = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = sessao.dataTask(with: url) { (data, response, error) in
            
            
            if error == nil {
                
                if let dataTemp = data {
                    
                    do{
                        
                        let dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                        
                        print(dicionario)
                        
                        
                        
                    }catch{/*Tratar erros*/}
                    
                }else{
                    
                    /*Tratar erros*/
                    
                }
                
            }else{
                
                /*Tratar erros*/
                
                
            }
            
            
        }
        
        task.resume()
        
    }
    
    @IBAction func fazerRequisicaoPost(_ sender: UIButton) {
        
        let url = urlBase.appendingPathComponent("/post")
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // Colocando os argumentos na requisição
        let jsonBody = ["chavePost1" : "valorPost1", "chavePost2" : "valorPost2", "chavePost3" : "valorPost3"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if error == nil{
                
                if let dataTemp = data {
                    
                    do{
                        
                        let dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments)
                        
                        print(dicionario)
                        
                    }catch{}
                    
                }
                
            }
            
        }
        
        task.resume()
        
    }
    
    @IBAction func fazerRequisicaoPut(_ sender: UIButton) {
        
        let url = urlBase.appendingPathComponent("/put")
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        // Colocando os argumentos na requisição
        let jsonBody = ["chavePut1" : "valorPut1", "chavePut2" : "valorPut2", "chavePut3" : "valorPut3"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if error == nil{
                
                if let dataTemp = data {
                    
                    do{
                        
                        let dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments)
                        
                        print(dicionario)
                        
                    }catch{}
                    
                }
                
            }
            
        }
        
        task.resume()
        
    }
    
    @IBAction func fazerRequisicaoDelete(_ sender: UIButton) {
        
        let url = urlBase.appendingPathComponent("/delete")
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        // Colocando os argumentos na requisição
        let jsonBody = ["chaveDelete1" : "valorDelete1", "chaveDelete2" : "valorDelete2", "chaveDelete3" : "valorDelete3"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if error == nil{
                
                if let dataTemp = data {
                    
                    do{
                        
                        let dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments)
                        
                        print(dicionario)
                        
                    }catch{}
                    
                }
                
            }
            
        }
        
        task.resume()
        
    }

}

