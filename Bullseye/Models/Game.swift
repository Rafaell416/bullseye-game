import Foundation


struct Game {
	var target: Int = Int.random(in: 1...100)
	var score: Int = 0
	var round: Int = 1
	
	
	func points(sliderValue: Int) -> Int {
		let difference: Int = abs(target - sliderValue)
		let awardedPoints: Int = 100 - difference
		return awardedPoints
	}
    
    mutating func startNewRound(points: Int) -> Void {
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
	
}

