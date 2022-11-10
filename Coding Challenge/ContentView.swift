//
//  ContentView.swift
//  Coding Challenge
//
//  Created by Muriel Schiefer on 10.11.22.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    //Test TrainingSessionView
    @StateObject var data : TrainingSessionData = TrainingSessionData(
        passed_seconds: 380,
        level_history: [Int] (repeating: 13, count: 380),
        watt_history: [Int] (repeating: 181, count: 380),
        bpm: 143, rpm: 99, kmh: 26
    );
    
    var body: some View {
        TrainingSessionView(data: data)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
