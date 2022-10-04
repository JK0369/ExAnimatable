//
//  ContentView.swift
//  ExAnimatable
//
//  Created by 김종권 on 2022/10/04.
//

import SwiftUI

struct ContentView: View {
  @State var offset = 150.0
  
  var body: some View {
    MyShape2(offsetY: offset)
      .fill(.blue)
      .onTapGesture {
        withAnimation(.easeIn) {
          offset = Double(Array(50...250).randomElement()!)
        }
      }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct MyShape: Shape {
  func path(in rect: CGRect) -> Path {
    Path {
      $0.move(to: CGPoint(x: rect.midX, y: rect.minY))
      $0.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
      $0.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
      $0.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
    }
  }
}

struct MyShape2: Shape {
  var offsetY: CGFloat
  
//  var animatableData: CGFloat {
//    get { offsetY }
//    set { offsetY = newValue }
//  }
  
  func path(in rect: CGRect) -> Path {
    Path {
      $0.move(to: CGPoint(x: rect.midX, y: rect.minY))
      $0.addLine(to: CGPoint(x: rect.minX, y: offsetY))
      $0.addLine(to: CGPoint(x: rect.maxX, y: offsetY))
      $0.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
    }
  }
}
