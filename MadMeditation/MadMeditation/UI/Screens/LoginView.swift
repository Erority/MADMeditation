import SwiftUI

struct LoginView: View {
    @State private var login: String = ""
    @State private var password: String = ""

    
    var body: some View {
        ZStack(){
            Color(#colorLiteral(red: 0.1453521252, green: 0.2015509009, blue: 0.205006659, alpha: 1))
            VStack(alignment: .center){
                
                VStack(alignment: .leading  ){
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 43.41, height: 49)
                        .padding(.top, 101)
                        .padding(.leading, 35)
                    
                    Text("Sign in")
                        .foregroundColor(.white)
                        .font(.custom("Alegreya-Medium", size: 30))
                        .padding(.top, 21)
                        .padding(.leading, 35)
                    
                    VStack{
                        TextField("Login", text: $login)
                            .padding(.horizontal, 33)
                            .foregroundColor(Color(#colorLiteral(red: 0.7462719083, green: 0.7613148689, blue: 0.7609142661, alpha: 1)))
                        
                        Divider()
                            .background(Color(#colorLiteral(red: 0.7462719083, green: 0.7613148689, blue: 0.7609142661, alpha: 1)))
                            .padding(.horizontal, 23)
                    }
                        .padding(.top, 111)
                    
                    VStack{
                        TextField("Password", text: $password)
                            .padding(.horizontal, 33)
                            .foregroundColor(Color(#colorLiteral(red: 0.7462719083, green: 0.7613148689, blue: 0.7609142661, alpha: 1)))
                        
                        Divider()
                            .background(Color(#colorLiteral(red: 0.7462719083, green: 0.7613148689, blue: 0.7609142661, alpha: 1)))
                            .padding(.horizontal, 23)
                    }
                        .padding(.top, 40)
                }
                
                NavigationLink(destination: {MainMenuView()}, label: {
                    ZStack{
                        Rectangle()
                            .fill(Color(#colorLiteral(red: 0.4864761233, green: 0.6036661267, blue: 0.5713724494, alpha: 1)))
                            .frame(width: 321, height: 61)
                            .cornerRadius(10)
                        
                        Text("Sign in")
                            .font(.custom("Alegreya-Medium", size: 25))
                            .foregroundColor(.white)
                }})
                .padding(.top, 55)
                
                Text("Register")
                    .font(.custom("Alegreya-Regular", size: 20))
                    .foregroundColor(.white)
                    .padding(.top, 23)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.leading)
                
                Button(action: {}){
                    ZStack{
                        Rectangle()
                            .fill(Color(#colorLiteral(red: 0.4864761233, green: 0.6036661267, blue: 0.5713724494, alpha: 1)))
                            .frame(width: 321, height: 61)
                            .cornerRadius(10)
                        
                        Text("Профиль")
                            .font(.custom("Alegreya-Medium", size: 25))
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 23)
                
                Spacer()
            }
            
            
            Spacer()
            
            VStack(){
                Spacer()
                
                Image("BottomPictureInBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .font(.custom("Alegreya-Regular", size: 18))
    }
}
