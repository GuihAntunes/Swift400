//
//  ViewController.swift
//  NSURLSessionClasseAPI
//
//  Created by Swift on 08/04/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    // MARK: - Propriedades
    
    // MARK: View Cycle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: - Métodos
    
    // MARK: - Actions
    @IBAction func requisitarGet(_ sender: UIButton) {
        
        API.requisitarGet { (dicionario, error) in
            
            if error == nil {
                
                print(dicionario)
                
            }else{
                
                print("\(error?.localizedDescription)")
                
            }
            
        }
        
    }
    
    @IBAction func requisitarPut(_ sender: UIButton) {
        
        API.requisitarPut { (dicionario, error) in
            
            if error == nil {
                
                print(dicionario)
                
            }else{
                
                print("\(error?.localizedDescription)")
                
            }
            
        }
        
    }
    
    @IBAction func requisitarPost(_ sender: UIButton) {
        
        API.requisitarPost { (dicionario, error) in
            
            if error == nil {
                
                print(dicionario)
                
            }else{
                
                print("\(error?.localizedDescription)")
                
            }
            
        }
        
    }
    
    @IBAction func requisitarDelete(_ sender: UIButton) {
        
        API.requisitarDelete { (dicionario, error) in
            
            if error == nil {
                
                print(dicionario)
                
            }else{
                
                print("\(error?.localizedDescription)")
                
            }
            
        }
        
    }
    
}

