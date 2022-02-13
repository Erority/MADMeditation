//
//  EmptyCustomView.swift
//  MadMeditation
//
//  Created by Денис Большачков on 13.02.2022.
//

import Foundation
import SwiftUI

struct EmptyCustomView: View{
    @State var content: String
    
    var body: some View{
        ZStack(){
            Color(#colorLiteral(red: 0.1452980936, green: 0.2015987635, blue: 0.2050321996, alpha: 1))
            
            Text(content)
                .frame(width:211, height: 82)
                .font(.custom("Alegreya", size: 30))
                .foregroundColor(.white)
            
        }
        .ignoresSafeArea()
    }
}

struct dfsjal: PreviewProvider{
    static var previews: some View{
        EmptyCustomView(content: "Тут будет регистрация")
    }
}
