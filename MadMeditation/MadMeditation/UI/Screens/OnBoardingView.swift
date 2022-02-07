//
//  OnBoardingView.swift
//  MadMeditation
//
//  Created by Денис Большачков on 07.02.2022.
//

import SwiftUI


struct OnboardingView: View {
    var body: some View {
        NavigationView(){
            
            ZStack(alignment: .center){
                
                Background()
                VStack(){
                    
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 92)
                        .padding(.bottom, -10)
                
                    Text("ПРИВЕТ")
                        .font(Font.custom("Alegreya-Bold", size: 34))
                        .foregroundColor(.white)
                        .padding(.bottom, -10)
                    
                    Text("Наслаждайся отборочными. \n Будь внимателен.\n Делай хорошо.")
                        .font(Font.custom("Alegreya-Medium", size: 20))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 90)
                    
                    VStack{
                        
                        NavigationLink(destination: LoginView(), label: {
                            ZStack{
                                Rectangle()
                                    .fill(Color(#colorLiteral(red: 0.4864761233, green: 0.6036661267, blue: 0.5713724494, alpha: 1)))
                                    .frame(width: 321, height: 61)
                                    .cornerRadius(10)
                                
                                Text("Войти в аккаунт")
                                    .font(.custom("Alegreya-Medium", size: 25))
                                    .foregroundColor(.white)
                            }
                        })
                        
                        NavigationLink(destination: {}, label: {
                            Text("Еще нет аккаунта? Зарегистрируйтесь")
                                .font(.custom("Alegreya-Regular", size: 20))
                                .foregroundColor(.white)})
                            .padding(.top, 10)
                    }
                    .padding(.top, 95)
                }
            }
        }
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

