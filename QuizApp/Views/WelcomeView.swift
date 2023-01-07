//
//  WelcomeView.swift
//  QuizApp
//
//  Created by jaemin park on 2022/01/26.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationView{
            ZStack {
                GameColor.main
                Image("Image")
                    .resizable()
                    .ignoresSafeArea()
            VStack {
                    Text("✏️Jlpt N1 Quiz📚")
                    .font(.custom("BebasNeue-Regular", size: 36))
                        .fontWeight(.bold)
                        .foregroundColor(Color.purple)
                        .multilineTextAlignment(.center)
                        .background(Color.black)
                        .padding()
                    Spacer()
                    NavigationLink(
                        destination: GameView(),
                        label:{
                            BottomText(str: "시작")
                                .foregroundColor(.black)
                                .background(.green)
                                .padding(.bottom)
                        })
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
