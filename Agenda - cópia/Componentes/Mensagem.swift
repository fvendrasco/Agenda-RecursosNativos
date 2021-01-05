//
//  Mensagem.swift
//  Agenda
//
//  Created by Felipe Augusto Vendrasco on 05/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit
import MessageUI

class Mensagem: NSObject, MFMailComposeViewControllerDelegate {

    //MARK: - Metodos
    
    func configuraSMS(_ aluno:Aluno) -> MFMessageComposeViewController? {
        if MFMessageComposeViewController.canSendText() {
            let componenteMensagem = MFMessageComposeViewController()
            guard let numeroDoAluno = aluno.telefone else { return componenteMensagem}
            componenteMensagem.recipients = [numeroDoAluno]
            componenteMensagem.messageComposeDelegate = self as? MFMessageComposeViewControllerDelegate
            
            
       return componenteMensagem
    }
    return nil
}
    
    
    
    //MARK: - MessageComposeDelegate
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }

}
