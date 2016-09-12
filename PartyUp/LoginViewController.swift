//
//  LoginViewController.swift
//  PartyUp
//
//  Created by WuGuihua on 8/19/16.
//  Copyright © 2016 EchoForFun. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    let LOGINBUTTONGTAG = 10
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        //can't put the codes below to viewDidLoad, because if I put them in viewDidLoad, at that point the view controller's view has only been created but not added to any view hierarchy. 
        //http://stackoverflow.com/questions/26022756/warning-attempt-to-present-on-whose-view-is-not-in-the-window-hierarchy-s
        
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            //homeVC.rearViewController.userInfo = self.returnUserData()
            let homeVC = self.storyboard?.instantiateViewControllerWithIdentifier("SWRVC") as! SWRevealViewController
            //homeVC.rearViewController.userInfo = self.returnUserData()
            self.presentViewController(homeVC, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
        
            print("current token is not nil")
            

            // User is already logged in, do work such as go to next view controller.
            // Or Show Logout Button
            
            self.returnUserData()
        }
        else
        {
            
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            self.view.addSubview(loginView)
            loginView.center = self.view.center
            loginView.readPermissions = ["public_profile", "email", "user_friends"]
            loginView.tag = LOGINBUTTONGTAG
 
            loginView.delegate = self
 
        }
        
    }
    
    // Facebook Delegate Methods
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {

        print("User Logged In")

        if ((error) != nil)
        {
            // Process error
            print("================process error===================")
            print("error=\(error)")
        }
        else if result.isCancelled {
            // Handle cancellations
            print("=================CANCELLED=======================")
            self.returnUserData()
        }
        else {
            
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("email")
            {
                // Do work
                print("========================permissions contains email==================")
            }
            
            self.returnUserData()
            
            self.view.viewWithTag(LOGINBUTTONGTAG)?.hidden = true
            
            let homeVC = self.storyboard?.instantiateViewControllerWithIdentifier("SWRVC") as! SWRevealViewController
            self.presentViewController(homeVC, animated: true, completion: nil)
            
        }
    }
   
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"first_name, last_name, email"])
        
        
        graphRequest.startWithCompletionHandler { (connection, result, error) in
            if ((error) != nil)
            {
                // Process error
                print("==================Error: \(error)==================")
            }
            else
            {
                let resultDic = result as? NSDictionary
                let userName = resultDic?["first_name"] as! NSString
                let userEmail = resultDic?["email"] as! NSString
                print("===================")
                print("username = \(userName), email = \(userEmail)")
                print("===================")
                
            }
        }
        
        
    }
    
    
}
