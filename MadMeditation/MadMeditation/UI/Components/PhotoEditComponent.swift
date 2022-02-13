//
//  PhotoEditComponent.swift
//  MadMeditation
//
//  Created by Денис Большачков on 08.02.2022.
//

import SwiftUI

struct PhotoEditComponent: View {
    var model: PhotoCardModel
    var interfaceToDelete: toDeleteCard
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack(){
            
            Color(#colorLiteral(red: 0.1294401288, green: 0.201962471, blue: 0.2051987648, alpha: 1))
            
            model.image?
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            
            HStack(spacing: 114){
                
                Button(action: {
                    interfaceToDelete.deleteCardFromEditView(model.position)
                    
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    
                    
                    Text("удалить")
                        .font(.custom("Alegreya-Medium", size: 20))
                        .foregroundColor(.white)
                }
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }){
                    
                    Text("закрыть")
                        .font(.custom("Alegreya-Medium", size: 20))
                        .foregroundColor(.white)
                }
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .frame(maxWidth: .infinity)
            .padding(.bottom, 45)
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}
