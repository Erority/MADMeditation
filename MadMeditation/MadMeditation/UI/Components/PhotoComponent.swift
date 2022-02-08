//
//  PhotoComponent.swift
//  MadMeditation
//
//  Created by Денис Большачков on 07.02.2022.
//

import SwiftUI

struct ProfileComponent: View {
    @State var data: [PhotoCardModel] = []
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack(){
            VStack(){
                
                Image("ProfilePhoto")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .cornerRadius(100)
                
                Text("Эмиль")
                    .font(.custom("Alegreya-Meduim", size: 35))
                    .foregroundColor(.white)
                
                ScrollView{
                    LazyVGrid(columns: layout, spacing: 20){
                        ForEach(data){ item in
                            VStack{
                                PhotoCard(model: item)
                            }
                        }
                        
                        LastCard()
                    }
                }.onAppear{
                    for _ in 0..<4{
                        data.append(PhotoCardModel(image: Image("12556223_paisagem15"), time: "11:00"))
                    }
                }
                
                
            }
            .padding(.top, 30)
        }
    }
}

struct ProfileComponentPreview: PreviewProvider{
    static var previews: some View{
        ProfileComponent()
            .background(Color.black)
    }
}
