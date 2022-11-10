//
//  ProgressCircleView.swift
//  Coding Challenge
//
//  Created by Muriel Schiefer on 10.11.22.
//

import SwiftUI

struct ProgressCircleView: View {
    @State var progress:Double
    let max_progress:Double
    let name:String
    let icon:String
    var body: some View {
        ZStack{
            Circle()
                .trim(from:0.0, to:0.85)
                .stroke(lineWidth:7.0)
                .rotationEffect(.degrees(116))
                .foregroundColor(Color("detailGray"))
            Circle()
                .trim(from:0.0, to:(self.progress/self.max_progress)*0.85)
                .stroke(lineWidth:7.0)
                .rotationEffect(.degrees(116))
                .foregroundColor(Color("turquoiseLight"))
        }
    }
}

struct ProgressCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircleView(progress:26, max_progress: 30, name: "km/h", icon:"speedometer")
    }
}
