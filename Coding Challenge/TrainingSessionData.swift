//
//  TrainingSessionData.swift
//  Coding Challenge
//
//  Created by Muriel Schiefer on 10.11.22.
//

import Foundation

//storing the data accessed by the view, only a dummy class but makes the code reusable in theory
class TrainingSessionData : ObservableObject{
    //global parameters that don't change
    static let max_kmh = 40
    static let max_rpm = 120
    static let max_watt = 200
    static let max_bpm = 220
    
    //changing data
    @Published var passed_seconds : Int = 0
    @Published var level_history = [0]
    @Published var watt_history = [0]
    @Published var bpm : Int = 0
    @Published var rpm : Int = 0
    @Published var kmh : Int = 0
    @Published var km : Double = 0.0
    @Published var kcal : Int = 0
    
    init(passed_seconds: Int, level_history: [Int], watt_history: [Int], bpm: Int, rpm: Int, kmh : Int, km : Double, kcal : Int){
        self.passed_seconds = passed_seconds
        self.level_history = level_history
        self.watt_history = watt_history
        self.bpm = bpm
        self.rpm = rpm
        self.kmh = kmh
        self.km = km
        self.kcal = kcal
    }
}

enum HistoryData : String{
    case Level
    case Watt
}

