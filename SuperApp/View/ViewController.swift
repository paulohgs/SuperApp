//
//  ViewController.swift
//  SuperApp
//
//  Created by Paulo Henrique Gomes da Silva on 11/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    private var customView: LoginView? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()

        TesteRapido()
        
        
        // Do any additional setup after loading the view.
    }
    
    private func buildView() {
        view = LoginView()
        customView = view as? LoginView
    }
    
    func TesteRapido() {
        Task {
            await API.PegaTodosUsuarios()
//            await API.getUserByID(id:"055D73CE-A402-4495-81EF-57BA2F3A6F73")

        
//            await API.createUser(name: "pieight5", email: "pieight@teste6.com", password: "1234")
//            await API.getAllPosts()
        }
    }

}

