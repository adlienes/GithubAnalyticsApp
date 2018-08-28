//
//  RepoTableViewCell.swift
//  GithubAnalyticsApp
//
//  Created by Enes on 28.08.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import UIKit

class RepoTableViewCell: UITableViewCell {
    
    
    @IBOutlet var LabelName: UILabel!
    @IBOutlet var LabelLanguage: UILabel!
    @IBOutlet var LabelFork: UILabel!
    @IBOutlet var LabelStar: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
