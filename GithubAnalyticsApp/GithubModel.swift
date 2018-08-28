//
//  GithubModel.swift
//  GithubAnalyticsApp
//
//  Created by Enes on 25.08.2018.
//  Copyright © 2018 Enes. All rights reserved.
//

import Foundation
struct Model:Decodable {
    
    var avatar_url:URL
    var html_url:URL
    var repos_url:URL
    var name:String
    //var company:String
    var blog:String
    var location:String
    //var email:String
    var bio:String
    var public_repos:Int
    var followers:Int
    var following:Int
    var created_at:String
    
    
}
