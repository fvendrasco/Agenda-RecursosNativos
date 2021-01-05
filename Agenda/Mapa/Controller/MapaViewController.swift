//
//  MapaViewController.swift
//  Agenda
//
//  Created by Felipe Augusto Vendrasco on 05/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {
    
    //MARK: IBOutlet
    
    @IBOutlet weak var mapa: MKMapView!
    
    
    //MARK: - Variavel
    var aluno:Aluno?
    
    //MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = getTitulo()
        localizacaoInicial()
        localizarAluno()
    }
    
    //MARK: - Metdods
    
    func getTitulo( ) -> String{
        return "Localizar Alunos"
    }
    
    func localizacaoInicial( ){
        Localizacao( ).converteEnderecoEmCoordenadas(endereco: "Casa da Mae Joana") { (localizacaoEncotrada) in
            let pino = self.configuraPino(titulo: "House", localizacao: localizacaoEncotrada)
            let regiao = MKCoordinateRegionMakeWithDistance(pino.coordinate, 5000, 5000)
            self.mapa.setRegion(regiao, animated: true)
            self.mapa.addAnnotation(pino)
        }
    }
    
    func localizarAluno( ){
        if let aluno = aluno {
            Localizacao( ).converteEnderecoEmCoordenadas(endereco: aluno.endereco!, local: { (localizacaoEncontrada) in
                let pino = self.configuraPino(titulo: aluno.nome!, localizacao: localizacaoEncontrada)
                self.mapa.addAnnotation(pino)
            })
        }
    }
    
    func configuraPino(titulo:String, localizacao:CLPlacemark ) -> MKPointAnnotation {
        
        let pino = MKPointAnnotation()
        pino.title = titulo
        pino.coordinate = localizacao.location!.coordinate
        
        return pino

    }
}
