//
//  ContentView.swift
//  SwiftUIPlay
//
//  Created by Pete Schwamb on 12/15/22.
//

import SwiftUI
import Charts

// This view reproduces a bug where a rounded corner
// background disappears under certain conditions.

// The top view illustrates the bug (rounded background
// is missing).

// The bottom view shows one way to get around it, by
// removing a conditional.

struct ContentView: View {

    // Simulating a wide pannable chart that is clipped.
    // Changing this to 400 also fixes the issue
    let chartWidth: CGFloat = 1000

    // The "viewport" is smaller than the full chart
    // Not clipping also fixes the issue
    let viewPortWidth: CGFloat = 300

    var body: some View {
        VStack {
            withConditional
            withoutConditional
        }
    }

    var withConditional: some View {
        VStack {
            HStack {
                if true {
                    Text("Hello")
                        .padding()
                        .background(.quaternary, in: RoundedRectangle(cornerRadius: 10))
                        .position(x: chartWidth/2, y: 50)
                }
            }
            .frame(width: chartWidth, height: 100)
            .background(.red)
        }
        .frame(width: viewPortWidth, height: 200)
        .background(.blue)
        .clipped()
    }

    var withoutConditional: some View {
        VStack {
            HStack {
//                if true {
                    Text("Hello")
                        .padding()
                        .background(.quaternary, in: RoundedRectangle(cornerRadius: 10))
                        .position(x: chartWidth/2, y: 50)
//                }
            }
            .frame(width: chartWidth, height: 100)
            .background(.red)
        }
        .frame(width: viewPortWidth, height: 200)
        .background(.blue)
        .clipped()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
