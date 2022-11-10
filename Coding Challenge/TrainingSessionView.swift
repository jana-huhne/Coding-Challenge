//
//  TrainingSessionView.swift
//  Coding Challenge
//
//  Created by Muriel Schiefer on 10.11.22.
//

import SwiftUI

struct TrainingSessionView: View {
    @ObservedObject var data : TrainingSessionData
    var body: some View {
        ZStack{
            //background color
            Color("backgroundGray")
            //content
            VStack {
                //pause button and time
                HStack(spacing: 0){
                    Button(action: {print("Button pressed :")}){
                        Image(systemName: "pause.fill")
                        Text("Pause/Stop")
                    }.padding().background(Color("turquoise")).cornerRadius(5).frame(maxWidth: .infinity, alignment: .leading)
                    Text("\( Int(data.passed_seconds) / 60):\(data.passed_seconds % 60)").font(.largeTitle).bold().frame(maxWidth: .infinity, alignment: .leading)
                }
                //Level timeline diagram
                TimelineView()
                //Watt timeline Diagram
                TimelineView()
                HStack{
                    ProgressCircleView(progress:data.kmh, max_progress: TrainingSessionData.max_kmh, name: "km/h", icon:"speedometer")
                    Spacer()
                    ProgressCircleView(progress:data.rpm, max_progress: TrainingSessionData.max_rpm, name: "rpm", icon:"repeat")
                    Spacer()
                    VStack{
                        //accumulated information (km and kcal)
                        HStack{
                            VStack{
                                Text("")
                            }
                        }
                        //Level increase/decrease buttons
                        HStack{
                            
                        }
                    }.padding()
                    Spacer()
                    ProgressCircleView(progress:data.watt_history[data.watt_history.count - 1], max_progress: TrainingSessionData.max_watt, name: "watt", icon:"bolt.circle")
                    Spacer()
                    ProgressCircleView(progress:data.bpm, max_progress: TrainingSessionData.max_bpm, name: "bpm", icon:"heart.fill")
                }.frame(maxWidth: .infinity).padding(.vertical)

            }.padding(50.0)
        }.foregroundColor(Color.white).ignoresSafeArea()
    }
    }


struct TrainingSessionView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingSessionView(data: TrainingSessionData(
            passed_seconds: 380,
            level_history: [Int] (repeating: 13, count: 380),
            watt_history: [Int] (repeating: 181, count: 380),
            bpm: 143, rpm: 99, kmh: 26
        ))
    }
}
