//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Rafael Villarreal on 30/06/23.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("TextColor"))
            .frame(width: 56, height: 56)
            .overlay(
                Circle().strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2)
            )
        
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56, height: 56)
            .background(
                Circle().fill(Color("ButtonFilledBackgroundColor"))
            )
        
    }
}

struct RoundRectTextView: View {
    var text: String
    var body: some View {
        Text(text)
          .multilineTextAlignment(.center)
          .foregroundColor(Color("TextColor"))
          .font(.title3)
          .bold()
          .kerning(-0.2)
          .frame(width: 68, height: 55)
          .overlay(
            RoundedRectangle(cornerRadius: 21)
              .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2)
          )
          
        
    }
}

struct Preview: View {
    var body: some View {
        VStack(spacing: 20) {
            RoundedImageViewStroked(systemName: "list.dash")
            RoundedImageViewFilled(systemName: "arrow.counterclockwise")
            RoundRectTextView(text: "999")
        }
    }
}

struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        Preview()
        Preview().preferredColorScheme(.dark)
    }
}
