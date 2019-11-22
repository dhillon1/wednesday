//
//  mainViewController.swift
//  wednesday
//
//  Created by Simran on 2019-11-21.
//  Copyright © 2019 centennialcollege. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class mainViewController: UIViewController {

   
    @IBOutlet weak var createText: UITextField!
    @IBOutlet weak var readText: UILabel!
    @IBOutlet weak var updateText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
   
    @IBAction func createButton(_ sender: Any) {
        var a =  createText.text!
        var db = Firestore.firestore()
        db.collection("Data").document(Auth.auth().currentUser!.uid).setData([
            "data": a
            ])
        createText.text = ""
        
        var alertController = UIAlertController(title: "Firebase", message:
            "Data added successfully", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func readButton(_ sender: UIButton) {
        var db = Firestore.firestore()
        db.collection("Data").document(Auth.auth().currentUser!.uid)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    var alertController = UIAlertController(title: "Firebase", message:
                        "Error fetching data", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                    return
                }
                guard let data = document.data() else {
                    var alertController = UIAlertController(title: "Firebase", message:
                        "Data was empty", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
                    
                    self.present(alertController, animated: true, completion: nil)
                    return
                }
                self.readText.text = data.values.first as! String
                print(data.values)
        }

        
        
       
        
        
    }
    
    @IBAction func updateButton(_ sender: UIButton) {
        var a =  updateText.text!
        var db = Firestore.firestore()
        db.collection("Data").document(Auth.auth().currentUser!.uid).setData([
            "data": a
            ])
        updateText.text = ""
        
        var alertController = UIAlertController(title: "Firebase", message:
            "Data updated successfully", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
 
    @IBAction func deleteButton(_ sender: UIButton) {
        readText.text = ""
        var db = Firestore.firestore()
        db.collection("Data").document(Auth.auth().currentUser!.uid).delete()
        var alertController = UIAlertController(title: "Firebase", message:
            "Data deleted successfully", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func signout(_ sender: UIButton) {
        do{
            try Auth.auth().signOut()
            let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
            self.present(loginVC, animated: true, completion: nil)

        }
        catch{
        
        }
    }
}
