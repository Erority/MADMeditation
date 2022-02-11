//
//  PhotoCard.swift
//  MadMeditation
//
//  Created by Денис Большачков on 07.02.2022.
//

import SwiftUI

struct PhotoCard: View{
    var model: PhotoCardModel
    var interfaceToDelete: toDeleteCard
    
    @State private var selection: String? = nil
    
    var body: some View{
        NavigationLink(destination: PhotoEditComponent(model: model, interfaceToDelete: self.interfaceToDelete), tag: "EditPhoto" , selection: $selection) { EmptyView() }
        
        Button(action: {
            selection = "EditPhoto"
        }){
            VStack(){
                Spacer()
                HStack(){
                    Text(model.time)
                        .font(.custom("Alegreya-Medium", size: 18))
                        .foregroundColor(.white)
                        .padding(.leading, 17)
                    
                    Spacer()
                }
                .padding(.bottom, 13)
            }
        }
        .frame(width: 153, height: 115)
        .background(
                model.image!.resizable()
            )
        .cornerRadius(20)
    }
}

struct LastCard: View {
    var body: some View {
        Button(action: {}){
            ZStack(){
                Text("+")
                    .font(.custom("Alegreya-Medium", size: 40))
                    .foregroundColor(.white)
            }
        }
        .frame(width: 153, height: 115)
        .background(
            Color(#colorLiteral(red: 0.3158400059, green: 0.6908095479, blue: 0.4218472838, alpha: 1)))
        .cornerRadius(20)
    }
}
