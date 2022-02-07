//
//  ProfileView.swift
//  MADMeditaion
//
//  Created by Денис Большачков on 04.02.2022.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack(){
            Image("Photo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(100)
            
            Text("Эмиль")
                .font(.custom("Alegreya-Medium", size: 35))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .background(Color(#colorLiteral(red: 0.1294401288, green: 0.201962471, blue: 0.2051987648, alpha: 1)))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct PhotoCard_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCard()
    }
}


struct PhotoCard: View{
    var body: some View{
        ZStack{
            
        }
        .frame(width: 153, height: 115)
        .background(
            Image("12556223_paisagem15")
                .resizable()
        )
        .cornerRadius(20)
    }
}
