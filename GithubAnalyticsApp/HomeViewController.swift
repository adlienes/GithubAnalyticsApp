//
//  HomeViewController.swift
//  GithubAnalyticsApp
//
//  Created by Enes on 21.08.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    
   
    @IBOutlet var ProfilImage: UIImageView!
    @IBOutlet var LabelName: UILabel!
    @IBOutlet var LabelCompany: UILabel!
    @IBOutlet var LabelWebSite: UILabel!
    @IBOutlet var LabelLocation: UILabel!
    @IBOutlet var LabelMail: UILabel!
    @IBOutlet var LabelBio: UILabel!
    @IBOutlet var LabelTime: UILabel!
    @IBOutlet var LabelRepo: UILabel!
    @IBOutlet var LabelFollowers: UILabel!
    @IBOutlet var LabelFollowing: UILabel!
    
    @IBOutlet var ButtonWeb: UIButton!
    
    var gelenUsername:String?
    var gidenUrl:URL?

    override func viewDidLoad() {
        super.viewDidLoad()

        ProfilImage.layer.cornerRadius=10
        ProfilImage.clipsToBounds=true
        ButtonWeb.layer.cornerRadius=10
        
        let url="https://api.github.com/users/"
        let usernameurl=url+gelenUsername!
        let myUrl = URL(string: usernameurl)
        let data=try! Data(contentsOf:myUrl!)
        
        
        do
        {
            let stories = try JSONDecoder().decode(Model.self, from: data)
            
            let resimurl=URL(string: stories.avatar_url.absoluteString)
            let resimdata=try Data(contentsOf: resimurl!)
            ProfilImage.image=UIImage(data:resimdata)
            
            
            LabelName.text=stories.name
            LabelWebSite.text=stories.blog
            LabelLocation.text=stories.location
            LabelBio.text=stories.bio
            LabelTime.text=stories.created_at
            gidenUrl=stories.html_url
            
            LabelRepo.text=String(stories.public_repos)
            LabelFollowers.text=String(stories.followers)
            LabelFollowing.text=String(stories.following)
            
        }
        catch let error{
            print("Json Parse Hata: \(error)")
        }
        

        //Verial(username: gelenUsername!)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier=="goWeb" {
            let geciciview=segue.destination as! WebViewController
            geciciview.gelenUrl=gidenUrl
            geciciview.gelenusername=gelenUsername
        }
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
                        //print(jsonresult)
                        //print(jsonresult["name"] as! String)
                        
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
