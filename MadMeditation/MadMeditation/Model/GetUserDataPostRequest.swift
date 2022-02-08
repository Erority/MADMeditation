//
//  GetUserDataPostRequest.swift
//  MadMeditation
//
//  Created by Студент on 08.02.2022.
//

import Foundation

struct UserData: Codable{
    var id: String
    var email: String
    var nickName: String
    var avatar: String
    var token: String
}

struct PostUserDataModel: Codable{
    var email: String
    var password: String
}
