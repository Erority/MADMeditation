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
    
    newData.append(PhotoCardModel(image: Image("12556223_paisagem15"), time: "11:00", position: 1))
    
    newData.append(PhotoCardModel(image: Image("Unknown-6"), time: "15:55", position: 2))
        
    newData.append(PhotoCardModel(image: Image("sunset-d863fdd4"), time: "19:11", position: 3))
    
    newData.append(PhotoCardModel(image: Image("Unknown-7"), time: "11:11", position: 4))
    
    
    return newData
}

