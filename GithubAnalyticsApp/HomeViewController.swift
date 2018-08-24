//
//  HomeViewController.swift
//  GithubAnalyticsApp
//
//  Created by Enes on 21.08.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var ProfilImage: UIView!
    @IBOutlet var LabelName: UILabel!
    @IBOutlet var LabelCompany: UILabel!
    @IBOutlet var LabelWebSite: UILabel!
    @IBOutlet var LabelLocation: UILabel!
    @IBOutlet var LabelMail: UILabel!
    @IBOutlet var LabelBio: UILabel!
    @IBOutlet var LabelTime: UILabel!
    
    
    var gelenUsername:String?

    override func viewDidLoad() {
        super.viewDidLoad()

        ProfilImage.layer.cornerRadius=10
        ProfilImage.clipsToBounds=true
        
        LabelName?.backgroundColor = UIColor.white
        LabelName?.font = UIFont(name:"OpenSans", size:8)
        LabelName?.sizeToFit()
        LabelName?.layer.cornerRadius = 20.0
        LabelName.layer.masksToBounds = true
        
        LabelBio?.backgroundColor = UIColor.white
        LabelBio?.font = UIFont(name:"OpenSans", size:8)
        LabelBio?.sizeToFit()
        LabelBio?.layer.cornerRadius = 20.0
        LabelBio.layer.masksToBounds = true

        
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
                        let jsonresult=try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers)
                        //print(jsonresult)
                        //print(jsonresult["avatar_url"])
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
