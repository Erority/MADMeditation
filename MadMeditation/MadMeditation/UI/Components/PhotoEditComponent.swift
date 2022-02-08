//
//  PhotoEditComponent.swift
//  MadMeditation
//
//  Created by Денис Большачков on 08.02.2022.
//

import SwiftUI

struct PhotoEditComponent: View {
    //var model: PhotoCardModel
    
    var body: some View {
        ZStack(){
            Image("12556223_paisagem15")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack(){
            }
        }
    }
}

struct PhotoEditComponent_Previews: PreviewProvider {
    static var previews: some View {
        PhotoEditComponent()
    }
}
