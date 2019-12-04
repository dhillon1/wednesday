//
//  createViewController.swift
//  wednesday
//
//  Created by Simran on 2019-11-21.
//  Copyright © 2019 centennialcollege. All rights reserved.
//

import UIKit
import Firebase

class createViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func create(_ sender: Any) {
        
        var e  = email.text!
        var p  = password.text!
        
        Auth.auth().createUser(withEmail: e, password: p) { authResult, error in
            if ((error) != nil){
                var alertController = UIAlertController(title: "Error", message:
                error?.localizedDescription as! String, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                self.present(alertController, animated: true, completion: nil)
            }
            else{
                
                self.presentingViewController?.dismiss(animated: false, completion:nil)
            }
        }

    
        
    }
    
    

}
