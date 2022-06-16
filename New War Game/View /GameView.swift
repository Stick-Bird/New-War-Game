//
//  ContentView.swift
//  New War Game
//
//  Created by user on 2022-06-16.
//

import SwiftUI

struct GameView: View {
    
    /*MARK: Propeties to include playerScore, cpuScore, cpuCard, playCard*/
    
    @State var playerScore = 0
    @State var cpuScore = 0
    @State var playerCard = "card2"
    @State var cpuCard = "card3"
    
    
    var body: some View {
  
        /* MARK: GREEN ZSTACK*/
        ZStack {
            
                Image ("background")
                    .resizable()
                .ignoresSafeArea()
                
                /*MARK: LOGO*/
            VStack {
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250.0, height: 100.0)
               Spacer()
                /*MARK: HSTACK CARDS*/
            HStack {
                Image (playerCard)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    
                Image (cpuCard)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                }
                .padding()
       
                /*MARK: DEAL BUTTON with Funtion*/
                Button {
                    //Add func here
                    dealCard()
                  
                } label: {
                    Image ("dealbutton")
                }
                Spacer()
                
                /*MARK: HSTACK WITH TWO VSTACK FOR PLAYER CPU SCORE*/
                HStack{
                    //PlayerScore
                    VStack {
                        Text ("Player")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            
                        
                        Text (String(playerScore))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                    }
                    //CpuScore
                    VStack {
                        Text ("CPU")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                        
                        Text (String(cpuScore))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                }
            }
                Spacer()
                
        }
    }
}
    /* MARK: Methods to include dealCard */

    func dealCard () {
        var randPlayerNum = Int.random(in: 2 ... 14)
        
        var randCPUNum = Int.random(in: 2 ... 14)
        
        playerCard = ("card" + String(randPlayerNum))
        
        cpuCard = ("card" + String(randCPUNum))
        
        //MARK: if statement to keep score
        if randPlayerNum > randCPUNum {
            playerScore += 1
        } else if randCPUNum > randPlayerNum {
            cpuScore += 1
        } else {
            print ("It's a tie!")
        }
        
        }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
