import Foundation


struct Game {
	var target: Int = Int.random(in: 1...100)
	var score: Int = 0
	var round: Int = 1
	
	
	func points(sliderValue: Int) -> Int {
		let difference: Int = abs(target - sliderValue)
		let awardedPoints: Int = 100 - difference
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
            bonus = 50
        } else {
            bonus = 0
        }
		return awardedPoints + bonus
	}
    
    mutating func startNewRound(points: Int) -> Void {
        score += points
        round += 1
        target = Int.random(in: 1...100)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}

