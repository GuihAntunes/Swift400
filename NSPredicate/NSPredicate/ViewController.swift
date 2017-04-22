//
//  ViewController.swift
//  NSPredicate
//
//  Created by Swift on 22/04/17.
//  Copyright © 2017 Swift. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var arrayStrings = ["Lilica", "Lili", "Garibaldo", "Florencio", "Felipe", "Lucia"]
    
    var arrayInteiros = [0,0,1,2,3,4,5,6,7]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // ---------- Comparações Básicas -----------
        
        // = , == - Igual
        
        let predicateIgual = NSPredicate(format: "self == 0")
        let arrayFiltradoIgual = (self.arrayInteiros as NSArray).filtered(using: predicateIgual)
        print(arrayFiltradoIgual)
        
        // ----------
        
        // <=, =< - Menor Igual
        
        let predicateMenorIgual = NSPredicate(format: "self <= 4")
        let arrayFiltradoMenorIgual = (self.arrayInteiros as NSArray).filtered(using: predicateMenorIgual)
        print(arrayFiltradoMenorIgual)
        
        // ----------
        
        // >=, => - Maior Igual
        
        let predicateMaiorIgual = NSPredicate(format: "self >= 3")
        let arrayFiltradoMaiorIgual = (self.arrayInteiros as NSArray).filtered(using: predicateMaiorIgual)
        print(arrayFiltradoMaiorIgual)
        
        // ----------
        
        // <, < - Menor
        
        let predicateMenor = NSPredicate(format: "self < 4")
        let arrayFiltradoMenor = (self.arrayInteiros as NSArray).filtered(using: predicateMenor)
        print(arrayFiltradoMenor)
        
        // ----------
        
        // >, > - Maior
        
        let predicateMaior = NSPredicate(format: "self > 3")
        let arrayFiltradoMaior = (self.arrayInteiros as NSArray).filtered(using: predicateMaior)
        print(arrayFiltradoMaior)
        
        // ----------
        
        // !=, <> - Diferente
        
        let predicateDiferente = NSPredicate(format: "self != 3")
        let arrayFiltradoDiferente = (self.arrayInteiros as NSArray).filtered(using: predicateDiferente)
        print(arrayFiltradoDiferente)
        
        // BETWEEN: Intervalo de valores
        
        let predicateBetween = NSPredicate(format: "self BETWEEN {1,6}")
        let arrayFiltradoBetween = (self.arrayInteiros as NSArray).filtered(using: predicateBetween)
        print(arrayFiltradoBetween)
        
        // ----------
        
        // ---------- Comparações Compostas Básicas ---------- 
        
        // AND, &&: Operador lógico AND
        
        let predicateAnd = NSPredicate(format: "self BETWEEN {1,6} && self > 3")
        let arrayFiltradoAnd = (self.arrayInteiros as NSArray).filtered(using: predicateAnd)
        print(arrayFiltradoAnd)
        
        // OR, || : Operador lógico OR
        
        let predicateOr = NSPredicate(format: "self BETWEEN {1,3} || self > 6")
        let arrayFiltradoOr = (self.arrayInteiros as NSArray).filtered(using: predicateOr)
        print(arrayFiltradoOr)
        
        // NOT, ! : Operador Kógico NOT
        
        let predicateNot = NSPredicate(format: "!(self BETWEEN {1,3})")
        let arrayFiltradoNot = (self.arrayInteiros as NSArray).filtered(using: predicateNot)
        print(arrayFiltradoNot)
        
        // ----------
        
        // ---------- Comparações de Strings ---------- 
        
        // BEGINSWITH - Inicia com determinada expressão - [c] ignora "case sensitive" = [d] trata como iguais caracteres especiais. Acentuação, por exemplo
        
        let argumentoBeginsWith = "l"
        let predicateBEGINSWITH = NSPredicate(format: "self BEGINSWITH[cd] %@", argumentoBeginsWith)
        let arrayFiltradoBEGINSWITH = (self.arrayStrings as NSArray).filtered(using: predicateBEGINSWITH)
        print(arrayFiltradoBEGINSWITH)
        
        // ENDSWITH - Finaliza com determinada expressão - [c] ignora "case sensitive" = [d] trata como iguais caracteres especiais. Acentuação, por exemplo
        
        let argumentoENDSWITH = "o"
        let predicateENDSWITH = NSPredicate(format: "self ENDSWITH[cd] %@", argumentoENDSWITH)
        let arrayFiltradoENDSWITH = (self.arrayStrings as NSArray).filtered(using: predicateENDSWITH)
        print(arrayFiltradoENDSWITH)
        
        // CONTAINS = Contém determinada expressão
        
        let argumentoCONTAINS = "li"
        let predicateCONTAINS = NSPredicate(format: "self CONTAINS[cd] %@", argumentoCONTAINS)
        let arrayFiltradoCONTAINS = (self.arrayStrings as NSArray).filtered(using: predicateCONTAINS)
        print(arrayFiltradoCONTAINS)

    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

