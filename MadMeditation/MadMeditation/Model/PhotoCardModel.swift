//
//  PhotoCard.swift
//  MadMeditation
//
//  Created by Денис Большачков on 07.02.2022.
//

import Foundation
import SwiftUI 

struct PhotoCardModel: Identifiable {
    var id = UUID()
    var image: Image?
    var time: String
    var position: Int
}
