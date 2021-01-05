//
//  MenuOpcoesAlunos.swift
//  Agenda
//
//  Created by Felipe Augusto Vendrasco on 05/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

enum MenuActionSheetAlunos {
    case sms
}

class MenuOpcoesAlunos: NSObject {

    func configuraMenuDeOpcoesDoAluno(complition:@escaping(_ opcao:MenuActionSheetAlunos)-> Void) -> UIAlertController{
        let menu = UIAlertController(title: "Atencao", message: "Escolha uma opcao", preferredStyle: .actionSheet)
        let sms = UIAlertAction(title: "Enviar SMS", style: .default) { (acao) in
            complition(.sms)
        
        }
        menu.addAction(sms)
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        menu.addAction(cancelar)
        
        return menu

    }
}
