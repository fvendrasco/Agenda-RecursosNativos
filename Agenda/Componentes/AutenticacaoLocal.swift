//
//  AutenticacaoLocal.swift
//  Agenda
//
//  Created by Felipe Augusto Vendrasco on 06/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import LocalAuthentication

class AutenticacaoLocal: NSObject {

    var error:NSError?
    
    func autorizaUsuario(complition:@escaping(_ autenticado:Bool)-> Void){
        let contexto = LAContext()
        if contexto.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error){
            contexto.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "Voce deseja apagar o Aluno?", reply: { (resposta, erro) in
                complition(resposta)
            })
        }
    }
}
