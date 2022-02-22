//
//  ColorValueTextView.swift
//  StateAndDataFlow
//
//  Created by Aliaksandr Rauko on 22.02.22.
//

import SwiftUI

struct ColorValueTextView: View {
    
    let value: Int
    let color: Color
    
    var body: some View {
        Text("\(value)")
            .foregroundColor(color)
            .frame(width: 40,
                   alignment: .leading)
        
    }
}

struct ColorValueTextView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            ColorValueTextView(value: 0,
                               color: .red)
        }
    }
}
