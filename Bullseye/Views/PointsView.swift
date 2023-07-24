//
//  PointsView.swift
//  Bullseye
//
//  Created by Rafael Villarreal on 23/07/23.
//

import SwiftUI

struct PointsView: View {
	@Binding var isAlertVisible: Bool
	@Binding var gameInstance: Game
	@Binding var sliderValue: Double
	
	var body: some View {
		let roundedValue = Int(sliderValue.rounded())
		let points = gameInstance.points(sliderValue: roundedValue)
		
		VStack(spacing: 10) {
			InstructionsText(text: "THE SLIDERS VALUE IS")
			BigNumberText(number: roundedValue)
			BodyText(text: "You scored \(points) Points \n 🎉🎉🎉")
			Button {
				withAnimation {
					isAlertVisible = false
				}
				gameInstance.startNewRound(points: points)
			} label: {
				ButtonText(text: "Start New Round")
			}
		}
		.padding()
		.frame(maxWidth: 315, maxHeight: 250)
		.background(Color("BackgroundColor"))
		.cornerRadius(21)
		.shadow(radius: 10, x: 5, y: 5)
	}
}

struct PointsView_Previews: PreviewProvider {
	static private var isAlertVisible = Binding.constant(false)
	static private var sliderValue = Binding.constant(89.0)
	static private var game = Binding.constant(Game())
	
	static var previews: some View {
		PointsView(isAlertVisible: isAlertVisible, gameInstance: game, sliderValue: sliderValue)
		PointsView(isAlertVisible: isAlertVisible, gameInstance: game, sliderValue: sliderValue)
			.preferredColorScheme(.dark)
			.previewInterfaceOrientation(.landscapeRight)
	}
}
