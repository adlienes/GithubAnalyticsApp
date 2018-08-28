//
//  RepoModel.swift
//  GithubAnalyticsApp
//
//  Created by Enes on 28.08.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import Foundation

struct RepoModel:Decodable {
    
    var name:String
    var stargazers_count:Int
    //var language:String
    var forks_count:Int
    
}
