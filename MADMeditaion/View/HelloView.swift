//
//  HelloView.swift
//  MADMeditaion
//
//  Created by Денис Большачков on 04.02.2022.
//

import SwiftUI

struct HelloView: View{
    @State var miniCards: [MiniCard] = []
    @State var modelToGet: GetMiniCardModel?
    
    @State var bigCards: [BigCardModel] = []
    @State var modelToGetBigCards: GetBigCardModel?
        
    var body: some View{
        VStack(){
            Text("С возвращением, Эмиль !")
                .font(.custom("Alegreya-Medium.ttf", size: 30))
                .foregroundColor(.white)
            
            Text("Каким ты себя ощущаешь сегодня ?")
                .font(.custom("Alegreya-Medium", size: 22))
                .foregroundColor(Color(#colorLiteral(red: 0.7462719083, green: 0.7613148689, blue: 0.7609142661, alpha: 1)))
                .padding(.top, 12)
                
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 17){
                    ForEach(miniCards){ item in
                        MiniCardView(miniCardModel: item)
                    }
                }
            }
            .padding(.leading, 25)
            .onAppear(){
                Api().getMiniCards { (modelToGet) in
                    self.modelToGet = modelToGet
                    self.miniCards = modelToGet.data
                    self.miniCards = OrderMiniCard(miniCards: miniCards)
                }
            }
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 26){
                    ForEach(bigCards, id: \.id){ item in
                        BigCardView(bigCardModel: item)
                    }
                }
            }
            .frame(height: 390)
             .padding(.top, 22)
             .onAppear(){
                    Api().getBigCards { ( modelToGetBigCards ) in
                        self.modelToGetBigCards = modelToGetBigCards
                        self.bigCards = modelToGetBigCards.data
                    }
                }
            
        }
    }
}

func OrderMiniCard(miniCards: [MiniCard]) -> [MiniCard]{
    var mutadedMiniCards = miniCards
    var buff: MiniCard
    
    for i in 0...miniCards.count - 1 {
        for j in 0...miniCards.count - 1 {
            if(miniCards[i].position < miniCards[j].position){
                buff = mutadedMiniCards[i]
                mutadedMiniCards[i] = mutadedMiniCards[j]
                mutadedMiniCards[j] = buff
            }
        }
    }
    
    return mutadedMiniCards
}

struct HelloView_Previews: PreviewProvider {
    static var previews: some View {
        HelloView()
    }
}
