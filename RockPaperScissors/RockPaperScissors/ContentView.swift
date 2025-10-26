//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Talaicia Isaacs on 6/24/24.
//

import SwiftUI

struct ProminentTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold())
            .foregroundStyle(.white)
            .frame(height: 100)
    }
}


extension View {
    func ProminentTitle() -> some View {
        modifier(ProminentTitleModifier())
    }
}

struct ContentView: View {
    @State private var gameOptions = ["Paper", "Rock", "Scissors"]
    @State private var appMove = Int.random(in: 0...2)
    @State private var theWin = Bool.random()
    
    @State private var showingScore = false
    @State private var isFinished = false
    @State private var scoreTitle = ""
    
    
    @State private var score = 0
    @State private var round = 1
 
    
    var body: some View {
        ZStack{
            RadialGradient(stops: [
                .init(color: Color.indigo, location: 0.3),
                .init(color: Color.yellow, location: 0.3)
                ], center: .top, startRadius: 200, endRadius: 300)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Rock, Paper, Scissors")
                    .ProminentTitle()
                
               
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                VStack (spacing: 15) {
                    Text("Try your luck")
                        .font(.largeTitle.weight(.semibold))
                        .foregroundColor(.white)
        

                   
                    Text("Computer: ")
                        .font(.subheadline.weight(.heavy))
                    Image(gameOptions[appMove])
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(.circle)
                    
                    
                    Text("Pick One:")
                        .font(.subheadline.weight(.heavy))
                   
                   
                
                }//End Vstack 2
         
                HStack {
                   
                    ForEach(0..<3) { number in
                        Button {
                            gamePick(number)
                        }label: {
                            Image(gameOptions[number])
                                .resizable()
                                .frame(width: 100, height: 100)
                                .clipShape(.circle)
                        }
        
                    }
                
                    
                } //end Hstack
                
             
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundStyle(.black)
                    .font(.title.bold())
                
                Spacer()
            } //End Vstack 1

        }//End Zstack
        
        .alert(scoreTitle, isPresented:$showingScore){
            Button("Continue", action: startNow)
        }message: {
            Text ("Your Score is \(score)")
        }
        
       .alert("Game Finished", isPresented: $isFinished){
            Button("Finished", action: restart)
       } message: {
           Text ("Your Score is \(score)")
       }

    } //End body
    func gamePick (_ number: Int){
        appMove = Int.random(in: 0...2)
        if round >= 5 {
            isFinished = true
        }else {
            if number == 0 && appMove == 0 {
                scoreTitle = "Tie"
                score += 0
            } else if number == 1 && appMove == 2 {
                score += 1
            } else if number == 2 && appMove == 0 {
                score += 1
            } else if number == 1 && appMove == 1{
                scoreTitle = "Draw"
                score += 0
            }else if number == 2 && appMove == 2 {
                scoreTitle = "Tie"
                score += 0
            }else if number == 3 && appMove == 3{
                scoreTitle = "Draw"
                score += 0
            }else if number == 2 && appMove == 1 {
                scoreTitle = "Try Again"
                score -= 1
            } else if number == 0 && appMove == 2{
                scoreTitle = "So Close"
                score -= 1
            }else if number == 0 && appMove == 1{
                score += 1
            } else if number == 1 && appMove == 0 {
                scoreTitle = "Try Again"
                score -= 1
            }
            round += 1
            showingScore = true
        }
    }//end gamePick
    
    func startNow () {
        appMove = Int.random(in: 0...2)
        theWin.toggle()
    }
    
    func restart ()
    {
        appMove = Int.random(in: 0...2)
        theWin.toggle()
        score = 0
        round = 1
    } // restart
}//End Struct

#Preview {
    ContentView()
}
