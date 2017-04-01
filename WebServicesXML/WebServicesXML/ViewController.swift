//
//  ViewController.swift
//  WebServicesXML
//
//  Created by Swift on 01/04/17.
//
//

import UIKit

// Adotando o protocolo do XMLParserDelegate
class ViewController: UIViewController, XMLParserDelegate {

    // MARK: - Outlets

    // MARK: - Properties

    var dicionarioDados = [String : String]()

    var tagAtual = ""

    var conteudoTag = ""

    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

		// Path: https://viacep.com.br/ws/01001000/xml/


        // Criando o caminho até o documento XML
        let urlArquivo = URL(string: "https://viacep.com.br/ws/05410000/xml/")

        // Criando um objeto que fará o parse (interpretação) do nosso XML. A classe responsável por essa interpretação é a XMLParser

        let xmlParser = XMLParser(contentsOf: urlArquivo!)

        xmlParser?.delegate = self

        // Acionando o método que inicia o processo de interpretação do XML
        xmlParser?.parse()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	// MARK: - Methods
    
    private func limparVariaveisDeControle(){
        
        self.conteudoTag = ""
        self.tagAtual = ""
        
    }

    // MARK: - Actions

    // MARK: - XMLParser Delegate

    func parserDidStartDocument(_ parser: XMLParser) {
        print("Iniciada a interpretação do arquivo")
    }

    func parserDidEndDocument(_ parser: XMLParser) {
        
        // Exibindo o dicionario de saída
        print(self.dicionarioDados)
        
        let cep = self.dicionarioDados["cep"]
        let unidade = self.dicionarioDados["unidade"]
        let uf = self.dicionarioDados["uf"]
        let bairro = self.dicionarioDados["bairro"]
        let localidade = self.dicionarioDados["localidade"]
        let logradouro = self.dicionarioDados["logradouro"]
        let complemento = self.dicionarioDados["complemento"]
        let ibge = self.dicionarioDados["ibge"]
        let gia = self.dicionarioDados["gia"]
        
        print("\nCEP: \(cep)")
        print("Unidade: \(unidade)")
        print("UF: \(uf)")
        print("Bairro: \(bairro)")
        print("Localidade: \(localidade)")
        print("Logradouro: \(logradouro)")
        print("Complemento: \(complemento)")
        print("IBGE: \(ibge)")
        print("GIA: \(gia)\n")

    }

    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {

		self.tagAtual = elementName

        // Verificando se a tag é uma tag de conteúdo relevante

        if elementName == "cep" || elementName == "unidade" || elementName == "uf" || elementName == "bairro" || elementName == "localidade" || elementName == "gia" || elementName == "complemento" || elementName == "logradouro" || elementName == "ibge"{
            
            self.conteudoTag = ""

        }

    }

    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == "cep" {
            
            // Criando uma chave em nosso dicionario e armazenando o conteúdo
            self.dicionarioDados ["cep"] = self.conteudoTag
            
            // Limpando variáveis de controle
            self.limparVariaveisDeControle()
            
            
        }
        
        if elementName == "uf" {
            
            self.dicionarioDados ["uf"] = self.conteudoTag
            
            self.limparVariaveisDeControle()
            
        }
        
        if elementName == "bairro" {
            
            self.dicionarioDados ["bairro"] = self.conteudoTag
            
            self.limparVariaveisDeControle()
            
        }
        
        if elementName == "localidade" {
            
            self.dicionarioDados ["localidade"] = self.conteudoTag
            
            self.limparVariaveisDeControle()
            
        }
        
        if elementName == "gia" {
            
            self.dicionarioDados ["gia"] = self.conteudoTag
            
            self.limparVariaveisDeControle()
            
        }
        
        if elementName == "complemento" {
            
            self.dicionarioDados ["complemento"] = self.conteudoTag
            
            self.limparVariaveisDeControle()
            
        }
        
        if elementName == "logradouro" {
            
            self.dicionarioDados ["logradouro"] = self.conteudoTag
            
            self.limparVariaveisDeControle()
            
            
        }
        
        if elementName == "ibge" {
            
            self.dicionarioDados ["ibge"] = self.conteudoTag
            
            self.limparVariaveisDeControle()
            
        }
        
        if elementName == "unidade" {
            
            self.dicionarioDados ["unidade"] = self.conteudoTag
            
            self.limparVariaveisDeControle()
            
        }
        
        
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if self.tagAtual == "cep" || self.tagAtual == "unidade" || self.tagAtual == "uf" || self.tagAtual == "bairro" || self.tagAtual == "localidade" || self.tagAtual == "gia" || self.tagAtual == "complemento" || self.tagAtual == "logradouro" || self.tagAtual == "ibge" {
            
            
            self.conteudoTag += string
            
            
        }
        
    }


}

