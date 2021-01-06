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
    lazy var localizacao = Localizacao()
    
    //MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = getTitulo()
        localizacaoInicial()
        localizarAluno()
        mapa.delegate = localizacao
    }
    
    //MARK: - Metdods
    
    func getTitulo( ) -> String{
        return "Localizar Alunos"
    }
    
    func localizacaoInicial( ){
        Localizacao( ).converteEnderecoEmCoordenadas(endereco: "Casa da Mae Joana") { (localizacaoEncotrada) in
            let pino = Localizacao().configuraPino(titulo: "Caelum", localizacao: localizacaoEncotrada, cor: .black, icone: UIImage(named: "icon_caelum"))
            let regiao = MKCoordinateRegionMakeWithDistance(pino.coordinate, 5000, 5000)
            self.mapa.setRegion(regiao, animated: true)
            self.mapa.addAnnotation(pino)
        }
    }
    
    func localizarAluno( ){
        if let aluno = aluno {
            Localizacao( ).converteEnderecoEmCoordenadas(endereco: aluno.endereco!, local: { (localizacaoEncontrada) in
                //let pino = self.configuraPino(titulo: aluno.nome!, localizacao: localizacaoEncontrada)
                let pino = Localizacao().configuraPino(titulo: aluno.nome!, localizacao: localizacaoEncontrada, cor: nil, icone: nil)
                self.mapa.addAnnotation(pino)
            })
        }
    }
    
    
}
