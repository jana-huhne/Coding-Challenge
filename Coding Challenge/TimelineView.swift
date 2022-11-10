//
//  TimelineView.swift
//  Coding Challenge
//
//  Created by Muriel Schiefer on 10.11.22.
//

import SwiftUI

struct TimelineView: View {
    
    @ObservedObject var data : TrainingSessionData
    var type : HistoryData
    
    var body: some View {
        ZStack{
            Color("backgroundGrayLight")
            HStack{
                Rectangle() //TODO add diagram
                VStack{
                    Button(action : {print("I'm supposed to change the history view but I don't do anything hehe")}){
                        HStack{
                            Text(type.rawValue).font(.headline)
                            Spacer()
                            Image(systemName: "chevron.down")
                        }
                    }.padding().background(Color("turquoise")).cornerRadius(5)
                    HStack{
                        Text("\(history_data().last!)").font(.largeTitle)
                        Text(type.rawValue).foregroundColor(Color("textGray"))
                    }
                    HStack{
                        Image(systemName: "circle.slash").rotationEffect(.degrees(90))
                        Text("\(history_data().reduce(0, +)/history_data().count)")
                        Spacer()
                        Image(systemName: "arrow.up.circle.fill")
                        Text("\(history_data().max()!)")
                    }.foregroundColor(Color("textGray"))
                }.padding()
            }
        }.cornerRadius(15)
    }
    
    
    private func history_data() -> [Int] {
        switch(self.type){
        case HistoryData.Level: return data.level_history
        case HistoryData.Watt: return data.watt_history
        }
    }
    
    
}
