//
//  WebViewController.swift
//  GithubAnalyticsApp
//
//  Created by Enes on 27.08.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,UIWebViewDelegate{
    
    var gelenUrl:URL?
    var gelenusername:String?
    @IBOutlet var webview: WKWebView!
    @IBOutlet var indicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
        let baglantireguest=URLRequest(url: gelenUrl!)
        webview.load(baglantireguest)
    }
    
    func webViewDidStartLoad(_:UIWebView) {
        indicator.startAnimating()
    }
    func webViewDidFinishLoad(_:UIWebView) {
        indicator.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier=="goBack" {
            let geciciview=segue.destination as! HomeViewController
            geciciview.gelenUsername=gelenusername
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
