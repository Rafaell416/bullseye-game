import SwiftUI

struct ContentView: View {
	@State private var isAlertVisible: Bool = false
	@State private var sliderValue: Double = 50.0
	@State private var game: Game = Game()
	
	var body: some View {
		VStack {
            Text("🎯🎯🎯\nPut the bullseye as close as you can to".uppercased())
				.bold()
				.multilineTextAlignment(TextAlignment.center)
				.lineSpacing(4.0)
				.font(Font.footnote)
				.kerning(2.0)
                .padding(.horizontal, 30)
			Text(String(game.target))
				.font(.largeTitle)
				.fontWeight(.black)
				.kerning(-1.0)
			
			HStack {
				Text("1")
					.bold()
				
				Slider(value: $sliderValue, in: 1.0...100.0)
				Text("100")
					.bold()
			}
            .padding()
            Button("Hit me".uppercased()) {
				isAlertVisible = true
            }
            .padding(20.0)
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(21)
            .bold()
            .font(.title3)
            .alert(
				"Hello SwiftUI!",
				isPresented: $isAlertVisible,
				actions: {
					Button("Close Alert") {
						print("Alert closed...")
					}
				},
				message: {
					let roundedValue: Int = Int(sliderValue.rounded())
					Text("The slider value is \(roundedValue) Your scord \(game.points(sliderValue: roundedValue)) this round")
				}
			)
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
		ContentView().previewLayout(.fixed(width: 568, height: 320))
	}
}
