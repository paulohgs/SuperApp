//
//  ViewController.swift
//  SuperApp
//
//  Created by Paulo Henrique Gomes da Silva on 11/08/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        TesteRapido()
        
        
        // Do any additional setup after loading the view.
    }
    
    func TesteRapido() {
        Task {
            await API.PegaTodosUsuarios()
        }
    }

}

