//
//  LoginViewController.swift
//  StatusHub
//
//  Created by Subodh Jena on 15/03/17.
//  Copyright © 2017 Cuckoo Labs. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtName: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
    }

    // MARK: - IBAction
    
    @IBAction func didTapSignIn(_ sender: Any) {
        dismissLogin()
    }
    
    @IBAction func didTapRegister(_ sender: Any) {
        dismissLogin()
    }
    
    public func dismissLogin()  {
        self.dismiss(animated: true, completion: nil)
    }
}
