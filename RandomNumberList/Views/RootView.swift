//
//  RootView.swift
//  RandomNumberList
//
//  Created by Jacob Lavenant on 7/2/23.
//

import SwiftUI

struct RootView: View {
    
    @StateObject var gameViewModel: GameViewModel
    
    @State var showHowTo = false
    @State var showSettings = false
    
    @State var easyGame = false
    @State var mediumGame = false
    @State var hardGame = false
    
    var body: some View {
        
        
        ZStack {
            Color("background")
                .ignoresSafeArea()
            
            VStack {
                //Title
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color("bubble-primary"))
                    
                    Text("Blind Number Sort")
                        .font(.largeTitle)
                        .foregroundColor(Color("text-primary"))
                }
                .frame(width: 350 ,height: 100)
                .padding(.top, 50)
                Spacer()
                
                //User stats (highest score)
                
                
                //GameMode select easy(5), medium(10), hard(20)
                Button {
                    easyGame = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 350, height: 100)
                        HStack {
                            Text("Easy")
                                .foregroundColor(Color("text-primary"))
                            Image(systemName: "play.fill")
                                .foregroundColor(Color("text-primary"))
                        }
                        .font(.title)
                    }
                }
                Button {
                    mediumGame = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 350, height: 100)
                        HStack {
                            Text("Medium")
                                .foregroundColor(Color("text-primary"))
                            Image(systemName: "play.fill")
                                .foregroundColor(Color("text-primary"))
                        }
                        .font(.title)
                    }
                }
                
                Button {
                    hardGame = true
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 350, height: 100)
                        HStack {
                            Text("Hard")
                                .foregroundColor(Color("text-primary"))
                            Image(systemName: "play.fill")
                                .foregroundColor(Color("text-primary"))
                        }
                        .font(.title)
                    }
                }
                
                
                Spacer()
                
                //How-To and Settings
                HStack {
                    Spacer()
                    Button {
                       showHowTo = true
                    } label: {
                        Image(systemName: "questionmark.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .tint(Color("icons-secondary"))
                    }
                    Button {
                        showSettings = true
                    } label: {
                        Image(systemName: "gear.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .tint(Color("icons-secondary"))
                    }
                }
                .padding(.trailing, 30)
            }
            
        }
        .sheet(isPresented: $showHowTo) {
            GameInstructions()
                .presentationDetents([.fraction(0.8)])
                .presentationDragIndicator(.visible)
        }
        .sheet(isPresented: $showSettings, content: {
            Settings(isPresented: $showSettings, gameViewModel: GameViewModel(mode: .easy))
                .presentationDragIndicator(.visible)
        })
        .fullScreenCover(isPresented: $easyGame) {
            GameView(gameViewModel: GameViewModel(mode: .easy), isPresented: $easyGame, showHowTo: showHowTo)
        }
        .fullScreenCover(isPresented: $mediumGame) {
            GameView(gameViewModel: GameViewModel(mode: .medium), isPresented: $mediumGame, showHowTo: showHowTo)
        }
        .fullScreenCover(isPresented: $hardGame) {
            GameView(gameViewModel: GameViewModel(mode: .hard), isPresented: $hardGame, showHowTo: showHowTo)
        }
    }
}








struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView(gameViewModel: GameViewModel(mode: .easy))
            .preferredColorScheme(.dark)
    }
}