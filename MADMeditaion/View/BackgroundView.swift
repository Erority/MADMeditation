//
//  Background.swift
//  MADMeditaion
//
//  Created by Студент on 21.01.2022.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        Image("Background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()

    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
