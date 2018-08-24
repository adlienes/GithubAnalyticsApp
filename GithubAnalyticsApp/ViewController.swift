//
//  ViewController.swift
//  GithubAnalyticsApp
//
//  Created by Enes on 17.08.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var BSearch: UIButton!
    @IBOutlet var SearchText: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        BSearch.layer.cornerRadius=10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func BSearchAction(_ sender: UIButton) {
        sender.Banimation()
        //print("Text",SearchText.text as! String)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier=="goHome" {
            let geciciview=segue.destination as! HomeViewController
            geciciview.gelenUsername=SearchText.text
        }
    }
   
    
}

