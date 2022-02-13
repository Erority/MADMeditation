import SwiftUI

struct LoginView: View {
    @State private var login: String = ""
    @State private var password: String = ""

    @State private var selection: String? = nil
    
    @State private var showingAlert = false
    @State private var showingLoginNull = false
    @State private var showingPasswordNull = false
    
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
                            .font(.custom("Alegreya-Regular", size: 18))
                            .foregroundColor(Color(#colorLiteral(red: 0.7462719083, green: 0.7613148689, blue: 0.7609142661, alpha: 1)))
                            .modifier(PlaceholderStyle(showPlaceHolder: login.isEmpty,placeholder: "Login"))
                        
                        Divider()
                            .background(Color(#colorLiteral(red: 0.7462719083, green: 0.7613148689, blue: 0.7609142661, alpha: 1)))
                            .padding(.horizontal, 23)
                    }
                        .padding(.top, 111)
                    
                    VStack{
                        TextField("Password", text: $password)
                            .padding(.horizontal, 33)
                            .font(.custom("Alegreya-Regular", size: 18))
                            .foregroundColor(Color(#colorLiteral(red: 0.7462719083, green: 0.7613148689, blue: 0.7609142661, alpha: 1)))
                            .modifier(PlaceholderStyle(showPlaceHolder: password.isEmpty,placeholder: "Password"))
                        
                        
                        Divider()
                            .background(Color(#colorLiteral(red: 0.7462719083, green: 0.7613148689, blue: 0.7609142661, alpha: 1)))
                            .padding(.horizontal, 23)
                    }
                        .padding(.top, 40)
                }
                
                NavigationLink(destination: MainMenuView(isProfile: .constant(false)), tag: "MainView" , selection: $selection) { EmptyView() }
                
                Button(action: {
                    if !validation() {
                        return
                    }
                    
                    Api().sendPostRequestUserData(model: PostUserDataModel(email: login, password: password)) { data in
                        saveDataToUserDefaults(userToSave: UserData(id: data.id, email: data.email, nickName: data.nickName, avatar: data.avatar, token: data.token))
                    }
                    
                        selection = "MainView"
                    
                    
                    
                }, label: {
                    ZStack{
                        Rectangle()
                            .fill(Color(#colorLiteral(red: 0.4864761233, green: 0.6036661267, blue: 0.5713724494, alpha: 1)))
                            .frame(height: 61)
                            .cornerRadius(10)
                        
                        Text("Sign in")
                            .font(.custom("Alegreya-Medium", size: 25))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 27)
                    
                })
                .alert("Login empty", isPresented: $showingLoginNull){
                        Button("Ok", role: .cancel) {}
                }
                .alert("Password empty", isPresented: $showingPasswordNull){
                    Button("Ok", role: .cancel) {}
                }
                .alert("User doesn't exists", isPresented: $showingAlert){
                    Button("Ok", role: .cancel) {}
                }
                
                
                .padding(.top, 55)
                
                HStack(){
                    Text("Register")
                        .font(.custom("Alegreya-Regular", size: 20))
                        .foregroundColor(.white)
                        .padding(.top, 23)
                    
                    Spacer()
                    
                }
                .padding(.horizontal, 31)
                    
                Button(action: {}){
                    ZStack{
                        Rectangle()
                            .fill(Color(#colorLiteral(red: 0.4864761233, green: 0.6036661267, blue: 0.5713724494, alpha: 1)))
                            .frame(height: 61)
                            .cornerRadius(10)
                        
                        Text("Профиль")
                            .font(.custom("Alegreya-Medium", size: 25))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 27)
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
    
    func validation() -> Bool {
        if login == ""{
            showingLoginNull = true
            return false
        }
        else if password == ""{
            showingPasswordNull = true
            return false
        }
        return true
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

public struct PlaceholderStyle: ViewModifier {
    var showPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder {
                Text(placeholder)
                    .padding(.horizontal, 33)
                    .foregroundColor(Color(#colorLiteral(red: 0.7462719083, green: 0.7613148689, blue: 0.7609142661, alpha: 1)))
                    .font(.custom("Alegreya-Regular", size: 18))
            }
            content
            .foregroundColor(Color(#colorLiteral(red: 0.7462719083, green: 0.7613148689, blue: 0.7609142661, alpha: 1)))
            .font(.custom("Alegreya-Regular", size: 18))
        }
    }
}


func saveDataToUserDefaults(userToSave: UserData){
    do{
        let user = userToSave
        let data = try JSONEncoder().encode(user)
        
        
        UserDefaults.standard.set(data ,forKey: "UserData")
    } catch {
        print("Unable to Encode")
    }
}


