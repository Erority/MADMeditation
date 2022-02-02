//
//  SplashView.swift
//  MADMeditaion
//
//  Created by Студент on 21.01.2022.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack{
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
        }
        .background(BackgroundView())
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
