//
//  MainMenuView.swift
//  MADMeditaion
//
//  Created by Студент on 27.01.2022.
//

import SwiftUI

struct MainMenuView: View {
    @ObservedObject var viewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        ZStack(){
            Color(#colorLiteral(red: 0.1453521252, green: 0.2015509009, blue: 0.205006659, alpha: 1))
            
            VStack(){
                HeaderView()
                
                HelloView()
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.top, 27)
                
                
                BottomNavigatonView()
                    .padding(.top, 27)
                    .padding(.bottom, 27)
                
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}

struct HeaderView: View{
    var body: some View{
            HStack(){
                Image("Hamburger")
                
                Spacer()
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 45, height: 49)
                
                Spacer()
                
                Image("Photo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(100)
                    .frame(width: 36, height: 36)
            }
            .padding(.top, 63)
            .padding(.horizontal, 25)
        }
}

struct BottomNavigatonView: View{
    var body: some View{
        HStack(spacing: 80){
            Button(action: {}){
                Image("Nav")
                
            }
            
            Button(action: {}){
                Image("Nav")
                
            }
            
            Button(action: {}){
                Image("Nav")
                
            }
        }
    }
}


