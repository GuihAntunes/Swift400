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
        
        // ----------
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

