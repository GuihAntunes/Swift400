//
//  Pessoa.swift
//  DesafioSQLite
//
//  Created by Swift on 22/04/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import Foundation

class Pessoa {
    
    var id:Int
    
    var nome:String
    
    var sobrenome:String
    
    var idade:Int
    
    init(id : Int, nome : String, sobrenome : String, idade : Int) {
        
        self.id = id
        self.idade = idade
        self.nome = nome
        self.sobrenome = sobrenome
        
    }
    
    
}
