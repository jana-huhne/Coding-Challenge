//
//  ContentView.swift
//  Coding Challenge
//
//  Created by Muriel Schiefer on 10.11.22.
//

import SwiftUI

struct ContentView: View {
    @State var passed_seconds = 380
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
                    Text("\(passed_seconds / 60):\(passed_seconds % 60)").font(.largeTitle).bold().frame(maxWidth: .infinity, alignment: .leading)
                }
                //Level timeline diagram
                TimelineView()
                //Watt timeline Diagram
                TimelineView()
                HStack{
                    ProgressCircleView(progress:26, max_progress: 40, name: "km/h", icon:"speedometer")
                    Spacer()
                    ProgressCircleView(progress:99, max_progress: 120, name: "rpm", icon:"repeat")
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
                    ProgressCircleView(progress:142, max_progress: 200, name: "watt", icon:"bolt.circle")
                    Spacer()
                    ProgressCircleView(progress:26, max_progress: 40, name: "bpm", icon:"heart.fill")
                }.frame(maxWidth: .infinity).padding(.vertical)

            }.padding(50.0)
        }.foregroundColor(Color.white).ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
