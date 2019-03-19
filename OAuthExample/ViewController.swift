//
//  ViewController.swift
//  OAuthExample
//
//  Created by Onur Geneş on 19.03.2019.
//  Copyright © 2019 Onur Geneş. All rights reserved.
//

import UIKit
import OAuthSwift

class ViewController: UIViewController {

    var oauthSwift: OAuth1Swift?
    var handle: OAuthSwiftRequestHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oauthSwift = OAuth1Swift(consumerKey: "YOUR_CONSUMER_KEY",
                                 consumerSecret: "YOUR_CONSUMER SECRET",
                                 requestTokenUrl: "https://api.twitter.com/oauth/request_token",
                                 authorizeUrl: "https://api.twitter.com/oauth/authorize",
                                 accessTokenUrl: "https://api.twitter.com/oauth/access_token")

        handle = oauthSwift!.authorize(withCallbackURL: "oauth-example://oauth-callback/twitter", success: { (credential, response, params) in
            print("CREDENTIAL : \(credential)")
            print("RESPONSE : \(response)")
            print("PARAMS : \(params)")
        }) { (error) in
            print(error.description)
        }
    
    }

}

