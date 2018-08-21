//
//  HomeViewController.swift
//  GithubAnalyticsApp
//
//  Created by Enes on 21.08.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var gelenUsername:String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Gelen Usermane",gelenUsername as! String)
        Verial(username: gelenUsername!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func Verial(username:String) {
        
        let url="https://api.github.com/users/"
        let usernameurl=url+username
        let myUrl = URL(string: usernameurl)
    
        
        let task=URLSession.shared.dataTask(with: myUrl!) { (data, response, error) in
            if error != nil {
                print(error!)
            }else {
                if let urlContent=data {
                    do{
                        let jsonresult=try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        print(jsonresult)
                        //print(jsonresult["bio"])
                    }catch{
                        print("Veri çekerken Hata oluştu ");
                    }
                }
            }
        }
        task.resume()
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
