//
//  SoundboardView.swift
//  Bredemeier Soundboard
//
//  Created by Dhanush Tipparaju on 11/17/22.
//

import SwiftUI
import AVKit // for the programing stuff related to audio i used this tutorial https://www.youtube.com/watch?v=iBLZ1C4L5Mw

class SoundManager {
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    enum SoundOption: String {
        case rick_roll
        case talk_to_the_duck
        case yes
        case no
        case slay
        case period
        case sheesh
        case dynamite
        case ah
    }
    func playSound(sound: SoundOption) {
        guard let url = Bundle.main.url(forResource: sound.rawValue, withExtension: ".mp3") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("Error playing sound. \(error.localizedDescription)")
        }
    }
}

struct ContentView: View {
    var body: some View{
        VStack {
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(120), spacing: 15), count: 2), spacing: 15) {
                soundboardButton(imageName: "Bredemeier", text: "rick roll") // never gonna give you up never gonna let you down
                    .onTapGesture {
                        SoundManager.instance.playSound(sound: .rick_roll)
                    }
                soundboardButton(imageName: "Bredemeier", text: "duck")
                    .onTapGesture {
                        SoundManager.instance.playSound(sound: .talk_to_the_duck)
                    }
                soundboardButton(imageName: "Bredemeier", text: "yes.")
                    .onTapGesture {
                        SoundManager.instance.playSound(sound: .yes)
                    }
                soundboardButton(imageName: "Bredemeier", text: "no.")
                    .onTapGesture {
                        SoundManager.instance.playSound(sound: .no)
                    }
                soundboardButton(imageName: "Bredemeier", text: "Slay!")
                    .onTapGesture {
                        SoundManager.instance.playSound(sound: .slay)
                    }
                soundboardButton(imageName: "Bredemeier", text: "Period.")
                    .onTapGesture {
                        SoundManager.instance.playSound(sound: .period)
                    }
                soundboardButton(imageName: "Bredemeier", text: "sheeeesh")
                    .onTapGesture {
                        SoundManager.instance.playSound(sound: .sheesh)
                    }
                soundboardButton(imageName: "Bredemeier", text: "dynamite") // "say boom goes the dynamite"
                    .onTapGesture {
                        SoundManager.instance.playSound(sound: .dynamite)
                    }
            }
            soundboardButton(imageName: "Bredemeier", text: "AAAAHHHHHHHHHHHH")
                .onTapGesture {
                    SoundManager.instance.playSound(sound: .ah)
                }
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct soundboardButton: View {
    let imageName: String
    let text: String
    var body: some View {
        VStack {
            Image("\(imageName)")
                .resizable()
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            Text(text)
                .font(Font.custom("Copperplate", size: 25))
        }
    }
}

