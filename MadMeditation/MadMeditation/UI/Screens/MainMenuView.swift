//
//  MainView.swift
//  MadMeditation
//
//  Created by Преподаватель on 07.02.2022.
//

import SwiftUI

struct MainMenuView: View {
    
    @ObservedObject var viewModel: MainViewModel = MainViewModel()
    
    @Binding var isProfile: Bool
    
    
    var body: some View {
        ZStack(){
            Color(#colorLiteral(red: 0.1453521252, green: 0.2015509009, blue: 0.205006659, alpha: 1))
            
            VStack(){
                
                HeaderView(isProfile: self.isProfile, viewModelMainModel: viewModel)
                
                switch viewModel.currentView{
                case 0:
                    HelloComponent()
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding(.top, 27)
                        .onAppear{
                            isProfile = false
                        }
            
                case 1:
                    EmptyCustomView(content: "Тут будет прослушивание")
                        .onAppear{
                            isProfile = false
                        }
                    
                case 2:
                    ProfileComponent().onAppear{
                        isProfile = true
                    }
                default:
                    HelloComponent()
                        .onAppear{
                        isProfile = false
                    }
                }
                
                
                
                BottomNavigatonView(viewModel: viewModel)
                    .padding(.top, 27)
                    .padding(.bottom, 27)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

//struct MainMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        MainMenuView(isProfile: .constant(false))
//    }
//}

struct HeaderView: View{
    @ObservedObject private var viewModel: BottomNavigationViewModel = BottomNavigationViewModel()
    
    @State var isProfile = false
    @State private var selection: String?
    
    var viewModelMainModel: MainViewModel
    
    
    
    var body: some View{
            HStack(){
                NavigationLink(destination: EmptyCustomView(content: "Тут будет меню"), tag: "EmptyMenuView" , selection: $selection) { EmptyView() }
                
                Button(action: {
                    selection = "EmptyMenuView"
                }){
                    Image("Hamburger")
                }
                
                Spacer()
                
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 45, height: 49)
                
                Spacer()
                
                
                switch viewModelMainModel.currentView{
                case 2:
                    NavigationLink(destination: LoginView(), tag: "LoginView" , selection: $selection) { EmptyView() }
                    
                    Button(action: {
                        selection = "LoginView"
                    }){
                        Text("exit")
                            .font(.custom("Alegreya-Meduim", size: 15))
                            .foregroundColor(.white)
                    }
                    
                default:
                    getUserPhoto()
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 36, height: 36)
                        .cornerRadius(100)

                }
            }
            .padding(.top, 63)
            .padding(.horizontal, 25)
        }
}

struct BottomNavigatonView: View{
    var viewModel: MainViewModel
    
    
    @State private var isActiveUser: Bool = false
    
    
    var body: some View{
        
        HStack(spacing: 80){
            Button(action: {
                isActiveUser = false
                viewModel.currentView = 0
            }){
                if !isActiveUser{
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 25, height: 25)
                } else {
                    Image("Home")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 25)
                }
                
            }
            
            Button(action: {
                isActiveUser = false
                viewModel.currentView = 1
            }){
                Image("Nav")
                    .frame(width: 25, height: 25)
                
            }
            
            Button(action: {
                isActiveUser = true
                viewModel.currentView = 2}){
                
                    if isActiveUser {
                        Image("User")
                            .frame(width: 25, height: 25)
                    }
                    else {
                        Image("Profile")
                            .frame(width: 25, height: 25)
                            .aspectRatio(contentMode: .fit)
                    }
            }
        }
    }
}

struct BottomNav_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavigatonView(viewModel: MainViewModel())
            .background(Color.black)
    }
}
