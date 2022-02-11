//
//  UserDefaultsMethods.swift
//  MadMeditation
//
//  Created by Денис Большачков on 10.02.2022.
//

import Foundation
import SwiftUI
import UIKit

func getUserPhoto() -> Image {
    let userData = getUserDataFromUD()
    
    var img: Image
    
    let url = URL(string: userData.avatar)!
    let dataImg = try! Data(contentsOf: url)
    let uiImg  =  UIImage(data: dataImg)!
    img = Image(uiImage: uiImg)
    
    return img;
}

func getUserName() -> Text {
    let userData = getUserDataFromUD()
    
    return Text(userData.nickName)
}

func getUserNameStr() -> String{
    let userData = getUserDataFromUD()
    
    return userData.nickName
}


private func getUserDataFromUD() -> UserData{
    var userData: UserData?
    
    if let data = UserDefaults.standard.data(forKey: "UserData"){
        do{
            let decoder = JSONDecoder()
            
            userData = try decoder.decode(UserData.self, from: data)
        } catch{
            print("Unable to decode")
        }
    }
    
    return userData!
}
