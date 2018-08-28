//
//  RepoTableViewController.swift
//  GithubAnalyticsApp
//
//  Created by Enes on 28.08.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit

class RepoTableViewController: UITableViewController {
    
    var gelenRepoUrl:URL?
    var repoarray=[RepoModel]()

    override func viewDidLoad() {
        super.viewDidLoad()

        let data=try! Data(contentsOf:gelenRepoUrl!)

        do
        {
            let repojson = try JSONDecoder().decode([RepoModel].self, from: data)
            //print(repojson)
            self.repoarray=repojson
            print(repoarray)
            //print("cpunt",repoarray.count)
  
        }
        catch let error{
            print("Json Parse Hata: \(error)")
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        print(repoarray.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return repoarray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoHucre", for: indexPath) as! RepoTableViewCell
        cell.LabelName.text=repoarray[indexPath.row].name
        cell.LabelStar.text=String(repoarray[indexPath.row].stargazers_count)
        cell.LabelFork.text=String(repoarray[indexPath.row].forks_count)
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
