//
//  LoginViewController.swift
//  StatusHub
//
//  Created by Subodh Jena on 15/03/17.
//  Copyright © 2017 Cuckoo Labs. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
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
        
        if(isLoginFormValid()){
            
            let user = txtEmail.text!
            let password = txtPassword.text!
            
            var headers: HTTPHeaders = [:]
            
            if let authorizationHeader = Request.authorizationHeader(user: user, password: password) {
                headers[authorizationHeader.key] = authorizationHeader.value
            }
            
            let parameters: Parameters = ["access_token": "t3udI6F9uEc5bHDPQOjokzn9fgfA4wDq"]
            
            Alamofire.request("https://statushub-dev.herokuapp.com/auth", method: .post, parameters : parameters, headers: headers)
                .responseJSON { response in
                    
                    if(response.response?.statusCode == 201){
                        
                        if let value = response.result.value as? [String: AnyObject] {
                            
                            // Create Post
                            let auth = Authorization(dictionary: value as NSDictionary)!
                            
                            // Save the Auth Key to NSUserDefaults
                            
                            print(auth.token!)
                            let defaults = UserDefaults.standard
                            defaults.set(auth.token!, forKey: "authKey")
                        }
                        
                        self.dismissLogin()
                    }
                    else{
                        self.showValidationMessage(message: "Something is Wrong !! Try Again...")
                        print("Something is Wrong !! Try Again...")
                    }
            }
        }
    }
    
    func isLoginFormValid() -> Bool {
        return true
    }
    
    private func dismissLogin()  {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func showValidationMessage (message : String) {
        
        let alert = UIAlertController(title: "Message", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
