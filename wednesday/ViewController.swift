//
//  ViewController.swift
//  wednesday
//
//  Created by Simran on 2019-11-20.
//  Copyright © 2019 centennialcollege. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if(Auth.auth().currentUser?.uid != nil){
            let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainViewController") as! mainViewController
            self.present(loginVC, animated: true, completion: nil)
            
            
        }
        
    }

    @IBAction func login(_ sender: UIButton) {
        
        
        
        
        var e = email.text!
        var p = password.text!

        Auth.auth().signIn(withEmail: e, password: p) { [weak self] authResult, error in
            if(error != nil){
                var alertController = UIAlertController(title: "Error", message:
                    error?.localizedDescription as! String, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))

                self?.present(alertController, animated: true, completion: nil)
            }
            else{
                var uid = Auth.auth().currentUser!.uid
                print(uid)
                let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainViewController") as! mainViewController
                self!.present(loginVC, animated: true, completion: nil)
                
            }
        }

        
    }
    
}

