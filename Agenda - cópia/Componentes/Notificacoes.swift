//
//  Notificacoes.swift
//  Agenda
//
//  Created by Felipe Augusto Vendrasco on 05/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

class Notificacoes: NSObject {
    func exibeNotificacaoDeMediaDosAlunos(dicionarioDeMedia:Dictionary<String, Any>) -> UIAlertController?{
        if let media = dicionarioDeMedia["media"] as? String {
        let alerta = UIAlertController(title: "Atencao", message: "A Media Geral é: \(media)", preferredStyle: .alert)
    
            let botao = UIAlertAction(title: "OK", style: .default, handler: nil)
            alerta.addAction(botao)
            
            return alerta
        }
        return nil
    }
}
