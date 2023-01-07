//
//  ContentView.swift
//  QuizApp
//
//  Created by jaemin park on 2022/01/23.
//

import SwiftUI

struct GameView: View {
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {
        ZStack{
            GameColor.main
            Image("Image1")
                .resizable()
                .ignoresSafeArea()
        VStack {
              Text(viewModel.progressText)
                .padding()
            Spacer()
               Text(viewModel.questionText)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .background(Color.white.opacity(0.1))
                .padding()
            Spacer()
            Spacer()
            HStack {
                ForEach(viewModel.answerIndices) { index in
                    AnswerButton(text: viewModel.answerText(for: index)) {
                        viewModel.makeSelectionForCurrentQuestion(at: index)
                    }
                    .background(viewModel.colorForButton(at: index))
                        .disabled(viewModel.selectionWasMade)
                    }
                }
               if viewModel.selectionWasMade{
                  Button(action: viewModel.advanceGameState,
                         label: {
                      BottomText(str: "다음")
                  })
               }
           }
        .foregroundColor(.black)
        .padding(.bottom)
        }
        .navigationBarHidden(true)
        .background(resultsNavigationLink)
    }
    private var resultsNavigationLink: some View {
        NavigationLink(
            destination: ResultsView(viewModel: ResultssViewModel(selectionCount: viewModel.selectionCount, gameStartTime: viewModel.gameStartTime, gameEndTime: Date())),
            isActive: .constant(viewModel.gameIsover),
            label: {EmptyView() })
    }
}

struct AnswerButton: View{
    let text:String
    let onClick: () -> Void
    var body: some View{
        Button(action: {
            onClick()
        }) {
            Text(text)
        .foregroundColor(.white)
        .fontWeight(.bold)
        .padding()
        }
        .font(.system(size: 12))
        .padding()
        .border(Color.yellow ,width: 4)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        GameView()
        }
        .previewInterfaceOrientation(.portrait)
    }
}


