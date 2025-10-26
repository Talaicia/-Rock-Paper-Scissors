# -Rock-Paper-Scissors

# ✊🖐✌️ Rock Paper Scissors – SwiftUI Game

A simple and fun **Rock Paper Scissors** game built using **Swift** and **SwiftUI**.  
Play against the computer, track your score, and enjoy smooth animations and a clean UI.

---

##  Overview

This app allows players to choose between **Rock**, **Paper**, or **Scissors** and see if they can beat the computer’s random choice.  
The app instantly displays the result — **Win**, **Lose**, or **Draw** — and updates the score accordingly.

---

##  Features

-  Clean and minimal **SwiftUI interface**  
-  Random computer moves using `Int.random(in:)`  
-  Real-time score tracking  
-  Smooth animations for results  
-  Light & dark mode support  
-  “Play Again” button to restart the game  

---

##  Game Logic

| Player Choice | Computer Choice | Result |
|----------------|------------------|---------|
| Rock | Scissors |  Player Wins |
| Paper | Rock |  Player Wins |
| Scissors | Paper |  Player Wins |
| Same | Same |  Draw |

---

##  How It Works

The app uses a simple comparison system between player and computer choices.

```swift
enum Move: String, CaseIterable {
    case rock = "✊"
    case paper = "🖐"
    case scissors = "✌️"
}

