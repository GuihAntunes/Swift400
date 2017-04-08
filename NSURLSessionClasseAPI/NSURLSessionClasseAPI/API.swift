//
//  API.swift
//  NSURLSessionClasseAPI
//
//  Created by Swift on 08/04/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import Foundation

var urlBase = URL(string: "https://httpbin.org/")!

class API {
    
    static func requisitarGet(_ completion : @escaping (_ resposta : [String:AnyObject], _ erro : Error?) -> Void){
        
        let url = urlBase.appendingPathComponent("/get")
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if error == nil{
                
                if let dataTemp = data{
                    
                    do{
                        
                        let dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                        
                        completion(dicionario, nil)
                        
                    }catch{
                    
                        completion([:], nil)
                    
                    }
                    
                }else{
                    
                    // Caso o data seja nulo
                    completion([:], nil)
                    
                }
                
            }else{
                
             	// Caso tenha dado erro (erro != nil)
                completion([:], error)
                
            }
            
        }
        
        task.resume()
        
    }
    
    // Requisição PUT
    
    static func requisitarPut(_ completion : @escaping (_ resposta : [String:AnyObject], _ erro : Error?) -> Void) {
        
        let url = urlBase.appendingPathComponent("/put")
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "PUT"
        
        let jsonBody = ["chavePut1" : "valorPut1", "chavePut2" : "valorPut2", "chavePut3" : "valorPut3"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = jsonData
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if error == nil {
                
                if let dataTemp = data {
                    
                    do{
                        
                        let dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                        
                        completion(dicionario, nil)
                        
                    }catch { completion([:], nil) }
                    
                }else{
                    
                    completion([:], nil)
                    
                }
                
            }else{
                
                completion([:], error)
                
            }
            
        }
        
        task.resume()
        
    }
    
    // Requisição Post
    
    static func requisitarPost(_ completion : @escaping (_ resposta : [String:AnyObject], _ erro : Error?) -> Void) {
        
        let url = urlBase.appendingPathComponent("/post")
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        
        let jsonBody = ["chavePost1" : "valorPost1", "chavePost2" : "valorPost2", "chavePost3" : "valorPost3"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = jsonData
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if error == nil {
                
                if let dataTemp = data {
                    
                    do{
                        
                        let dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                        
                        completion(dicionario, nil)
                        
                    }catch { completion([:], nil) }
                    
                }else{
                    
                    completion([:], nil)
                    
                }
                
            }else{
                
                completion([:], error)
                
            }
            
        }
        
        task.resume()
        
    }
    
    // Requisição Delete
    
    static func requisitarDelete(_ completion : @escaping (_ resposta : [String:AnyObject], _ erro : Error?) -> Void) {
        
        let url = urlBase.appendingPathComponent("/delete")
        
        let session = URLSession(configuration: URLSessionConfiguration.default)
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "DELETE"
        
        let jsonBody = ["chaveDelete1" : "valorDelete1", "chaveDelete2" : "valorDelete2", "chaveDelete3" : "valorDelete3"]
        let jsonData = try? JSONSerialization.data(withJSONObject: jsonBody, options: [])
        
        request.setValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = jsonData
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            if error == nil {
                
                if let dataTemp = data {
                    
                    do{
                        
                        let dicionario = try JSONSerialization.jsonObject(with: dataTemp, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
                        
                        completion(dicionario, nil)
                        
                    }catch { completion([:], nil) }
                    
                }else{
                    
                    completion([:], nil)
                    
                }
                
            }else{
                
                completion([:], error)
                
            }
            
        }
        
        task.resume()
        
    }
    
}
