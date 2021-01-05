//
//  ImagePicker.swift
//  Agenda
//
//  Created by Felipe Augusto Vendrasco on 05/01/21.
//  Copyright © 2021 Alura. All rights reserved.
//

import UIKit

enum MenuOpcoes {
    case camera
    case biblioteca
}

protocol imagePickerFotoSelecionada {
    func imagePickerFotoSelecionada(_ foto:UIImage)
}

class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    //MARK: - Atributos
    
    var delegate: imagePickerFotoSelecionada?
    
    //MARK: - Metodos
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let foto = info[UIImagePickerControllerOriginalImage] as! UIImage
        delegate?.imagePickerFotoSelecionada(foto)
        picker.dismiss(animated: true, completion: nil)
    }
    
    func menuOpcoes(complition:@escaping(_ opcao:MenuOpcoes) -> Void) -> UIAlertController{
        let menu = UIAlertController(title: "Atencao", message: "Escolha uma das opcoes", preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: " Tirar Foto", style: .default) { (acao) in
            complition(.camera)
        }
        menu.addAction(camera)
        
        let biblioteca = UIAlertAction(title: "Rolo de camera", style: .default) { (acao) in
            complition(.biblioteca)
        }
        menu.addAction(biblioteca)
        
        let cancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        menu.addAction(cancelar)
        
        return menu
        }
    }

