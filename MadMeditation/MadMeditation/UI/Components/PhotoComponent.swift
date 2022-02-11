//
//  PhotoComponent.swift
//  MadMeditation
//
//  Created by Денис Большачков on 07.02.2022.
//

import SwiftUI

struct ProfileComponent: View, toDeleteCard{
    @State var data: [PhotoCardModel] = fillCollection()
    
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack(){
            VStack(){
                
                getUserPhoto()
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .cornerRadius(100)
                
                getUserName()
                    .font(.custom("Alegreya-Meduim", size: 35))
                    .foregroundColor(.white)
                
                ScrollView{
                    LazyVGrid(columns: layout, spacing: 20){
                        ForEach(data){ item in
                            VStack{
                                PhotoCard(model: item, interfaceToDelete: self)
                            }
                        }
                        
                        LastCard()
                    }
                }
                
                    
            }
            .padding(.top, 30)
        }
    }
    
    func recalculatePosition() {
        for i in 0..<data.count{
            data[i].position = i
        }
    }
    
    func deleteCardFromEditView(_ index: Int) {
        self.data.remove(at: index)
        recalculatePosition()
    }
}

struct ProfileComponentPreview: PreviewProvider{
    static var previews: some View{
        ProfileComponent()
            .background(Color.black)
    }
}

protocol toDeleteCard{
    func deleteCardFromEditView(_ index: Int)
}

func fillCollection() -> [PhotoCardModel]{
    var newData = [PhotoCardModel]()
    
    for i in 0..<4{
        newData.append(PhotoCardModel(image: Image("12556223_paisagem15"), time: "11:00", position: i))
    }
    
    return newData
}

