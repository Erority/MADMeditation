//
//  OnboardingView.swift
//  MADMeditaion
//
//  Created by Студент on 21.01.2022.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        ZStack(alignment: .center){
            BackgroundView()
            VStack(){
                Image("Logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 191, height: 199)
                
                Text("ПРИВЕТ")
                    .font(Font.custom("Alegreya-Bold", size: 34))
                    .foregroundColor(.white)
                
                Text("Наслаждайся отборочными. \n Будь внимателен.\n Делай хорошо.")
                    .font(Font.custom("Alegreya-Medium", size: 20))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .frame(width: 300, height: 90)
                
                VStack{
                    Button(action: {}){
                        ZStack{
                            Rectangle()
                                .fill(Color(#colorLiteral(red: 0.4864761233, green: 0.6036661267, blue: 0.5713724494, alpha: 1)))
                                .frame(width: 321, height: 61)
                                .cornerRadius(10)
                            
                            Text("Войти в аккаунт")
                                .font(.custom("Alegreya-Medium", size: 25))
                                .foregroundColor(.white)
                        }
                    }
                    
                    Button(action: {}){
                        Text("Еще нет аккаунта? Зарегистрируйтесь")
                            .foregroundColor(.white)
                            
                    }
                }
                .padding(.top, 95)
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
