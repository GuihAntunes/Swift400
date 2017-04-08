//
//  ViewController.swift
//  URLSessionDelegate
//
//  Created by Swift on 08/04/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController, URLSessionDataDelegate {
    
    // MARK: - Outlets
    
    // MARK: - Properties
    var sessionGet : URLSession!
    var sessionPut : URLSession!
    var sessionPost : URLSession!
    var sessionDelete: URLSession!
    
    var URLBase = URL(string: "https://httpbin.org/")!
    
    // MARK: View Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Inicializando as sessões
        self.sessionGet = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        self.sessionPut = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        self.sessionPost = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        self.sessionDelete = URLSession(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: nil)
        
    }
    
    // MARK: - Métodos
    
    // MARK: - Actions
    @IBAction func fazerRequisicaoGet(_ sender: UIButton) {
        
        let url = URLBase.appendingPathComponent("/get") 
        
        // Criando a tarefa
        let task = self.sessionGet.dataTask(with: url)
        
        // Executando a tarefa
        task.resume()
        
    }
    
    @IBAction func fazerRequisicaoPut(_ sender: UIButton) {
        
        // Criando nossa URL
        let url = URLBase.appendingPathComponent("/put")
        
        // Criando um request
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
        
        // Colocando os argumentos em nossa requisição
        let jsonBody = ["chave1Put" : "valor1Put", "chave2Put" : "valor2Put", "chave3Put" : "valor3Put"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = self.sessionPut.dataTask(with: request)
        
        task.resume()
        
    }
    
    @IBAction func fazerRequisicaoPost(_ sender: UIButton) {
        
        // Criando nossa URL
        let url = URLBase.appendingPathComponent("/post")
        
        // Criando um request
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        // Colocando os argumentos em nossa requisição
        let jsonBody = ["chave1Post" : "valor1Post", "chave2Post" : "valor2Post", "chave3Post" : "valor3Post"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = self.sessionPost.dataTask(with: request)
        
        task.resume()
        
    }
    
    @IBAction func fazerRequisicaoDelete(_ sender: UIButton) {
        
        // Criando nossa URL
        let url = URLBase.appendingPathComponent("/delete")
        
        // Criando um request
        var request = URLRequest(url: url)
        
        request.httpMethod = "DELETE"
        
        // Colocando os argumentos em nossa requisição
        let jsonBody = ["chave1Delete" : "valor1Delete", "chave2Delete" : "valor2Delete", "chave3Delete" : "valor3Delete"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        let task = self.sessionDelete.dataTask(with: request)
        
        task.resume()
        
    }
    
    // MARK: - Métodos de URLSessionDataDelegate
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        
        completionHandler(URLSession.ResponseDisposition.allow)
        
    }
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        
        switch session {
        case self.sessionGet:
            print("GET")
        case self.sessionPut:
            print("PUT")
        case self.sessionPost:
            print("POST")
        case self.sessionDelete:
            print("DELETE")
        default:
            print("Other")
        }
        
        do{
            
            let dicionario = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
            
            print(dicionario)
            
        }catch{}
        
    }

}

