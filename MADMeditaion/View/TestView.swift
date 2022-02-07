//
//  TestView.swift
//  MADMeditaion
//
//  Created by Денис Большачков on 04.02.2022.
//

import SwiftUI

struct TestView: View{
    var body: some View{
        TabView(){
            HelloView()
                .tabItem(){
                    Image("Profile")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                }
            
            LoginView()
                .tabItem(){
                    Image("Nav")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            
        }.background(Color(#colorLiteral(red: 0.1095864102, green: 0.1662710607, blue: 0.1697196364, alpha: 1)))
    }
}
    

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
