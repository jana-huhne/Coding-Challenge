//
//  ProgressCircleView.swift
//  Coding Challenge
//

import SwiftUI

struct ProgressCircleView: View {
    @Binding var progress:Int
    let max_progress:Int
    let name:String
    let icon:String
    var body: some View {
        ZStack{
            Circle()
                .trim(from:0.0, to:0.85)
                .stroke(lineWidth:3.0)
                .rotationEffect(.degrees(116))
                .foregroundColor(Color("detailGray"))
            Circle()
                .trim(from:0.0, to:(Double(self.progress)/Double(self.max_progress))*0.85)
                .stroke(lineWidth:3.0)
                .rotationEffect(.degrees(116))
                .foregroundColor(Color("turquoiseLight"))
            VStack(spacing: 0){
                Spacer()
                //VStack{
                    Text("\(progress)").font(.largeTitle).bold()
                    Text(name).foregroundColor(Color("textGray"))
                //}//.frame(maxHeight: .infinity, alignment: .center)
                Spacer()
                Image(systemName: icon).foregroundColor(Color("turquoiseLight"))//.frame(maxHeight: .infinity, alignment: .bottom)
            }
        }
    }
}
