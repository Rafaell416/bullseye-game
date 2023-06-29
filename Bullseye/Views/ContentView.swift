import SwiftUI

struct ContentView: View {
    @State private var isAlertVisible: Bool = false
    @State private var sliderValue: Double = 50.0
    @State private var game: Game = Game()
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack {
                InstructionsView(gameInstance: $game)
                SliderView(sliderValue: $sliderValue)
                HitmeButtonView(isAlertVisible: $isAlertVisible, gameInstance: $game, sliderValue: $sliderValue)

            }
        }
    }
}

struct InstructionsView: View {
    @Binding var gameInstance: Game
    var body: some View {
        VStack {
            InstructionsText(
                text: "🎯🎯🎯\nPut the bullseye as close as you can to"
            ).padding(.horizontal, 30)
            BigNumberText(number: gameInstance.target)
        }
    }
}


struct SliderView: View {
    @Binding var sliderValue: Double
    
    var body: some View {
        HStack {
            SliderLabelText(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelText(text: "100")
            
        }
        .padding()
    }
}

struct HitmeButtonView: View {
    @Binding var isAlertVisible: Bool
    @Binding var gameInstance: Game
    @Binding var sliderValue: Double

    
    var body: some View {
        Button("Hit me".uppercased()) {
            isAlertVisible = true
        }
        .padding(20.0)
        .background(
            ZStack {
                Color("ButtonColor")
                LinearGradient(
                    gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            }
        )
        .foregroundColor(Color.white)
        .bold()
        .font(.title3)
        .cornerRadius(21)
        .overlay(
            RoundedRectangle(
                cornerRadius: 21).stroke(
                    .white, lineWidth: 3
                )
        )
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
                Text("The slider value is \(roundedValue) Your scord \(gameInstance.points(sliderValue: roundedValue)) this round")
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewDevice("iPhone 14 Pro")
            .preferredColorScheme(.dark)
    }
}
