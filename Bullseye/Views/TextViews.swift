//
//  TextViews.swift
//  Bullseye
//
//  Created by Rafael Villarreal on 28/06/23.
//

import SwiftUI

struct InstructionsText: View {
	var text: String
	
	var body: some View {
		Text(text.uppercased())
			.bold()
			.multilineTextAlignment(TextAlignment.center)
			.lineSpacing(4.0)
			.font(Font.footnote)
			.kerning(2.0)
			.foregroundColor(Color("TextColor"))
	}
}

struct BigNumberText: View {
	var number: Int
	
	var body: some View {
		Text(String(number))
			.font(.largeTitle)
			.fontWeight(.black)
			.kerning(-1.0)
			.foregroundColor(Color("TextColor"))
	}
}

struct SliderLabelText: View {
	var text: String
	
	var body: some View {
		Text(text)
			.bold()
			.foregroundColor(Color("TextColor"))
	}
}

struct LabelText: View {
	var text: String
	
	var body: some View {
		Text(text.uppercased())
			.bold()
			.font(.caption)
			.lineSpacing(14.0)
			.kerning(1.5)
			.multilineTextAlignment(.center)
			.foregroundColor(Color("TextColor"))
		
	}
}

struct BodyText: View {
	var text: String
	
	var body: some View {
		Text(text)
			.font(.subheadline)
			.fontWeight(.semibold)
			.lineSpacing(12)
			.multilineTextAlignment(.center)
			.foregroundColor(Color("TextColor"))
	}
}

struct ButtonText: View {
	var text: String
	
	var body: some View {
		Text(text)
			.padding()
			.bold()
			.font(.system(size: 17))
			.foregroundColor(.white)
			.multilineTextAlignment(.center)
			.lineSpacing(16)
			.frame(maxWidth: .infinity)
			.background(
				Color.accentColor
			)
			.cornerRadius(12)
	}
}

struct TextViews_Previews: PreviewProvider {
	static var previews: some View {
		VStack {
			InstructionsText(text: "🎯🎯🎯\nPut the bullseye as close as you can to")
			BigNumberText(number: 69)
			SliderLabelText(text: "1")
			LabelText(text: "score")
			BodyText(text: "You scored 200 Points \n 🎉🎉🎉")
			ButtonText(text: "Start New Round")
		}.padding()
	}
}
