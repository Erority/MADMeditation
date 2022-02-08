//
//  MainView.swift
//  MadMeditation
//
//  Created by Преподаватель on 07.02.2022.
//

import SwiftUI

struct MainMenuView: View {
    @ObservedObject var viewModel: MainViewModel = MainViewModel()
    var HeaderViewToI: HeaderView?
    
    init(){
        HeaderViewToI = HeaderView(viewModel: viewModel)
    }
    
    var body: some View {
        ZStack(){
            Color(#colorLiteral(red: 0.1453521252, green: 0.2015509009, blue: 0.205006659, alpha: 1))
            
            VStack(){
                
                HeaderView(viewModel: viewModel)
                
                switch viewModel.currentView{
                case 0:
                    HelloComponent()
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 27)
                
                case 2:
                    ProfileComponent()
                default:
                    HelloComponent()
                }
                
                
                BottomNavigatonView(viewModel: viewModel, interfaceUpdate: self.HeaderViewToI!)
                    .padding(.top, 27)
                    .padding(.bottom, 27)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct MainMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuView()
    }
}

struct HeaderView: View, IUpdateHeaderView{
    
    var viewModel: MainViewModel
    @State private var isProfile: Bool = false
    
    
    func UpdaetHeaderView(option: Int) {
        switch option {
        case 0:
            self.isProfile = false
        case 1:
            self.isProfile = true
        default:
            self.isProfile = false
        }
    }
    
    var body: some View{
            HStack(){
                Image("Hamburger")
                
                Spacer()
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 49)
                
                Spacer()
                
                if !isProfile{
                    Image("ProfilePhoto")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(100)
                        .frame(width: 36, height: 36)
                }
                else {
                    Button(action: {}){
                        Text("exit")
                            .font(.custom("Alegreya-Meduim", size: 15))
                    }
                }
            }
            .padding(.top, 63)
            .padding(.horizontal, 25)
        }
}

struct BottomNavigatonView: View{
    var viewModel: MainViewModel
    var interfaceUpdate: IUpdateHeaderView
    
    @State private var isActiveUser: Bool = false
    
    
    var body: some View{
        
        HStack(spacing: 80){
            Button(action: {
                interfaceUpdate.UpdaetHeaderView(option: 0)
                isActiveUser = false
                viewModel.currentView = 1
                
            }){
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
                
            }
            
            Button(action: {
                interfaceUpdate.UpdaetHeaderView(option: 0)
                isActiveUser = false
                viewModel.currentView = 1
            }){
                Image("Nav")
                
            }
            
            Button(action: {
                interfaceUpdate.UpdaetHeaderView(option: 1)
                isActiveUser = true
                viewModel.currentView = 2}){
                
                    if isActiveUser {
                        Image("User")
                    }
                    else {
                        Image("Profile")
                    }
            }
        }
    }
}

protocol IUpdateHeaderView {
    func UpdaetHeaderView(option: Int)
}

