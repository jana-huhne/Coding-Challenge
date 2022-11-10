//
//  TrainingSessionView.swift
//  Coding Challenge
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
                    Button(action: {print("Pause!")}){
                        Image(systemName: "pause.fill")
                        Text("Pause/Stop")
                    }.padding().background(Color("turquoise")).cornerRadius(5).frame(maxWidth: .infinity, alignment: .leading)
                    Text("\( Int(data.passed_seconds) / 60):\(data.passed_seconds % 60)").font(.system(size: 50)).bold().frame(maxWidth: .infinity, alignment: .leading)
                }
                //Level timeline diagram
                TimelineView(data: self.data, type: HistoryData.Level).padding(.vertical)
                //Watt timeline Diagram
                TimelineView(data: self.data, type: HistoryData.Watt).padding(.vertical)
                HStack{
                    ProgressCircleView(progress:$data.kmh, max_progress: TrainingSessionData.max_kmh, name: "km/h", icon:"speedometer").padding(30.0)
                    Spacer()
                    ProgressCircleView(progress:$data.rpm, max_progress: TrainingSessionData.max_rpm, name: "rpm", icon:"repeat").padding(30.0)
                    Spacer()
                    VStack{
                        //accumulated information (km and kcal)
                        HStack{
                            VStack{
                                Text(String(format:"%.1f", data.km)).font(.largeTitle).bold()
                                Text("km").foregroundColor(Color("textGray"))
                            }
                            Divider().background(Color("textGray")).padding(.horizontal)
                            VStack{
                                Text("\(data.kcal)").font(.largeTitle).bold()
                                Text("kcal").foregroundColor(Color("textGray"))
                            }
                        }.padding()
                        //Level increase/decrease buttons
                        ZStack{
                            Color("backgroundGrayLight")
                            HStack{
                                Button(action: {print("Decrease Level")}){
                                    ZStack{
                                        Circle().foregroundColor(Color("turquoise"))
                                        Text("-").font(.largeTitle)
                                    }
                                }.padding()
                                VStack{
                                    Text("\(data.level_history.last!)").font(.largeTitle)
                                    Text("Level").foregroundColor(Color("textGray"))
                                }.padding()
                                Button(action: {print("Increase Level")}){
                                    ZStack{
                                        Circle().foregroundColor(Color("turquoise"))
                                        Text("+").font(.largeTitle)
                                    }
                                }.padding()
                            }
                        }.padding(.bottom, 30).cornerRadius(30).padding(.bottom, -30)
                    }.padding([.top, .leading, .trailing]).frame(width: 300)
                    Spacer()
                    ProgressCircleView(progress:$data.watt_history.last!, max_progress: TrainingSessionData.max_watt, name: "watt", icon:"bolt.circle").padding(30.0)
                    Spacer()
                    ProgressCircleView(progress:$data.bpm, max_progress: TrainingSessionData.max_bpm, name: "bpm", icon:"heart.fill").padding(30.0)
                }.frame(maxWidth: .infinity).padding(.top)

            }.padding([.top, .leading, .trailing], 50.0)
        }.foregroundColor(Color.white).ignoresSafeArea()
    }
    }


struct TrainingSessionView_Previews: PreviewProvider {
    static var previews: some View {
        TrainingSessionView(data: TrainingSessionData(
            passed_seconds: 380,
            level_history: [Int] (repeating: 13, count: 380),
            watt_history: [Int] (repeating: 181, count: 380),
            bpm: 143, rpm: 99, kmh: 26, km : 4.2, kcal : 103
        ))
    }
}
