//
//  LoginViewController.swift
//  Parstagram
//
//  Created by RIAZ on 3/19/21.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSingnup(_ sender: Any) {
    let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground{(yes, no) in
            if yes {
                self.performSegue(withIdentifier: "logSeg", sender: nil)
            }else{
                print ("\(String(describing: no?.localizedDescription))")
            }
        }
    }
    
    @IBAction func onSingin(_ sender: Any) {
    let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user,no)in
            if user != nil{
                self.performSegue(withIdentifier: "logSeg", sender: nil)
            }else{
                print ("error\(String(describing: no?.localizedDescription))")
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
