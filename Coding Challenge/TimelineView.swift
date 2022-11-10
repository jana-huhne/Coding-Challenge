//
//  TimelineView.swift
//  Coding Challenge
//
//  Created by Muriel Schiefer on 10.11.22.
//

import SwiftUI
import Charts



struct TimelineView: View {
    
    @ObservedObject var data : TrainingSessionData
    @State var type : HistoryData
    
    //parameters specific to the type of plotted data
    private var color : Color{
        switch(self.type){
        case HistoryData.Level: return Color("turquoiseLight")
        case HistoryData.Watt: return Color("red")
        }
    }
    private var interpolationMethod: InterpolationMethod{
        switch(self.type){
        case HistoryData.Level: return InterpolationMethod.stepStart
        case HistoryData.Watt: return InterpolationMethod.cardinal
        }
    }
    private var yAxisLabels : [Int]{
        switch(self.type){
        case HistoryData.Level: return [0,8,16,24]
        case HistoryData.Watt: return [0,200,400,600]
        }
    }
    
    var body: some View {
        ZStack{
            Color("backgroundGrayLight")
            HStack{
                Chart {
                    ForEach(history_data().enumerated().map{
                        IntData(x: $0, y:$1)
                    }){ item in
                        LineMark(x: .value("time", item.x), y: .value(type.rawValue, item.y)).foregroundStyle(self.color)
                        AreaMark(x: .value("time", item.x), y: .value(type.rawValue, item.y)).foregroundStyle(self.color.opacity(0.3))
                    }
                }.chartYAxis{
                    AxisMarks(position: .leading, values: yAxisLabels){ _ in
                        AxisValueLabel().foregroundStyle(Color("textGray")).font(.headline)
                        AxisGridLine().foregroundStyle(Color("textGray"))
                    }
                }
                .chartXScale(domain:0...TrainingSessionData.max_time)
                .padding(.top, 30.0)
                .padding(.leading, 15.0)
                .frame(minWidth: 880)
                VStack(alignment: .leading){
                    Button(action : {print("I'm supposed to change the history view but I don't do anything hehe")}){
                        HStack{
                            Text(type.rawValue).font(.headline)
                            Spacer()
                            Image(systemName: "chevron.down")
                        }.padding()
                    }.background(Color("turquoise")).cornerRadius(5)
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
    
    //data type for the chart to work on because tuples aren't identifiable
    struct IntData : Identifiable{
        let id = UUID()
        let x : Int
        let y : Int
    }
    
    
    private func history_data() -> [Int] {
        switch(self.type){
        case HistoryData.Level: return data.level_history
        case HistoryData.Watt: return data.watt_history
        }
    }
    
}
