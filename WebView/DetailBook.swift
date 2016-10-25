//
//  DetailBook.swift
//  WebView
//
//  Created by iOS Student on 10/25/16.
//  Copyright © 2016 Duong. All rights reserved.
//

import UIKit

class DetailBook: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var myActive: UIActivityIndicatorView!
    
    @IBOutlet weak var btnShowDate: UIButton!
    @IBAction func getCurrentTime(_ sender: AnyObject) {
        self.webView.stringByEvaluatingJavaScript(from: "hello();")
    }
    
    var urlString: String!  //ten sach
    var type: String!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = urlString
        self.webView.delegate = self
        self.myActive.startAnimating()
        var urlpath = "default"
        
        switch type {
        case "PDF": urlpath = Bundle.main.path(forResource: urlString, ofType: "pdf")!
            self.btnShowDate.isHidden = true
        case "DOCX": urlpath = Bundle.main.path(forResource: urlString, ofType: "docx")!
            self.btnShowDate.isHidden = true
        case "HTML": urlpath = Bundle.main.path(forResource: urlString, ofType: "html")!
            self.btnShowDate.isHidden = false
        default: break
        }
        let url: NSURL = NSURL.fileURL(withPath: urlpath) as NSURL
        let urlRequest = NSURLRequest(url: url as URL)
        self.webView.loadRequest(urlRequest as URLRequest)
    }

    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.myActive.isHidden = true
        self.myActive.stopAnimating()
    }
    
    @IBAction func goBack(_ sender: AnyObject) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    @IBAction func reLoad(_ sender: AnyObject) {
        webView.reload()
    }
    @IBAction func goForward(_ sender: AnyObject) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBOutlet weak var btn_back: UIButton!
    
    @IBOutlet weak var btn_forward: UIButton!

}
