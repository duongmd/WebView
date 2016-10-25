//
//  LoadURL.swift
//  WebView
//
//  Created by iOS Student on 10/25/16.
//  Copyright © 2016 Duong. All rights reserved.
//

import UIKit

class LoadURL: UIViewController, UITextFieldDelegate, UIWebViewDelegate {

    @IBOutlet weak var myActivity: UIActivityIndicatorView!
    
    @IBOutlet weak var urlString: UITextField!
    @IBOutlet weak var webView: UIWebView!
    
    let baseUrl = "http://www."
    override func viewDidLoad() {
        
        myActivity.isHidden = true
        super.viewDidLoad()
        
    }

    //func chon duong dan va click enter
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        myActivity.isHidden = false
        let url = NSURL(string: baseUrl + textField.text!)!
        let urlRequest = NSURLRequest(url: url as URL)
        self.webView.loadRequest(urlRequest as URLRequest)
        myActivity.startAnimating()
        return true
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        myActivity.isHidden = true
        myActivity.stopAnimating()
    }
}
