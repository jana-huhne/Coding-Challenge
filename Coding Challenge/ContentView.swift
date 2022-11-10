//
//  ContentView.swift
//  Coding Challenge
//
//

import SwiftUI
import Foundation

var testData : TrainingSessionData{
    var level_test_data : [Int] = []
    var watt_test_data : [Int] = []
    for i in (0...380){
        level_test_data.append(Int(sin(Double(i)/100.0)*4.0) + 8)
        watt_test_data.append(Int(Double(i)-0.003*pow(Double(i),2)) + 80)
    }
    return TrainingSessionData(
        passed_seconds: 380,
        level_history: level_test_data,
        watt_history: watt_test_data,
        bpm: 143, rpm: 99, kmh: 26, km : 4.2, kcal : 103
    )
}

struct ContentView: View {
    
    //Test TrainingSessionView
    @StateObject var data : TrainingSessionData = testData
    
    var body: some View {
        TrainingSessionView(data: self.data)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
