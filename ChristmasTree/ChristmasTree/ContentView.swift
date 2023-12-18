//
//  ContentView.swift
//  ChristmasTree
//
//  Created by nicola de filippo on 17/12/23.
//

import SwiftUI

import AVFoundation

@Observable
class AudioPlayerViewModel {
  var audioPlayer: AVAudioPlayer?

  var isPlaying = false

  init() {
    if let sound = Bundle.main.path(forResource: "silent", ofType: "mp3") {
      do {
        self.audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound))
      } catch {
        print("AVAudioPlayer could not be instantiated.")
      }
    } else {
      print("Audio file could not be found.")
    }
  }

  func playOrPause() {
    guard let player = audioPlayer else { return }

    if player.isPlaying {
      player.pause()
      isPlaying = false
    } else {
      player.play()
      isPlaying = true
    }
  }
}

struct ContentView: View {
    var widths = [280, 300, 320]
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var colors = [Color.red, Color.purple, Color.blue, Color.orange, Color.gray, Color.yellow, Color.cyan, Color.mint, Color.pink]
    var stars = ["star", "star.fill"]
    @State var indexStar = 0
    @State var currentColors = [Color]( repeating: .gray, count: 22 )
    @State var audioPlayerViewModel = AudioPlayerViewModel()
    
    var body: some View {
        ZStack {
            Color.black.frame(maxWidth: .infinity, maxHeight: .infinity).opacity(0.9).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack(spacing: 0) {
                Image(systemName: stars[indexStar])
                    .resizable()
                    .frame(width: 100, height: 100)
                    .foregroundStyle(.yellow)
                    .offset(y: 20)
                TriangleWidthDecoration(triangleWidth: 260, leftColorDecoration: currentColors[3], rightColorDecoration: currentColors[7])
                
            }.offset(y: -50)
            ForEach(Array(widths.enumerated()), id: \.offset) { index, leaf in
                TriangleWidthDecoration(triangleWidth: Double(leaf), leftColorDecoration: currentColors[index], rightColorDecoration: currentColors[index * 2])
                    .offset(y: 60 * Double( index + 1))
            }
            
            Rectangle()
                .frame(width: 20, height: 60)
                .foregroundStyle(.brown)
                .offset(y: 360)
        }.onReceive(timer) { _ in
            shuffleColor()
            self.indexStar = (self.indexStar + 1) % 2
        }.onAppear {
            audioPlayerViewModel.playOrPause()
        }.onTapGesture {
            audioPlayerViewModel.playOrPause()
        }
    }
    
    func shuffleColor() {
        for i in 0..<currentColors.count {
            currentColors[i] = colors[Int.random(in: 0..<9)]
        }
    }
}


struct TriangleWidthDecoration: View {
    var triangleWidth: Double = 300
    var leftColorDecoration: Color = .yellow
    var rightColorDecoration: Color = .yellow
    let triangleHeight: Double = 300
    
    var body: some View {
        HStack(alignment: .bottom) {
            Image(systemName: "snowflake")
                .foregroundStyle(leftColorDecoration)
            .frame(width: 20, height: 20)
                .offset(x: 10)
            Triangle()
                .frame(width: triangleWidth, height: triangleHeight)
                .foregroundStyle(.green)
            Image(systemName: "snowflake")
                .foregroundStyle(rightColorDecoration)
                .frame(width: 20, height: 20)
                .offset(x: -10)
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))

        return path
    }
}

#Preview {
    ContentView()
}
