//
//  BowlingKataTests.swift
//  BowlingKataTests
//
//  Created by Alexander Spirichev on 10/10/2019.
//  Copyright © 2019 Alexander Spirichev. All rights reserved.
//

import XCTest
@testable import BowlingKata


// цель - сколько очков мы набрали
// начальный счет - 0
// один бросок - получили счет
// количество бросков
//


class BowlingKataTests: XCTestCase {

    var sut: Game!
    
    override func setUp() {
        sut = Game()
    }

    override func tearDown() {
        sut = nil
    }
    
    func test_initialScoreIsZero() {
        XCTAssertEqual(0, sut.score)
    }
    
    func test_whenFirstRollHas6Pins_scoreIs6() {
        sut.roll(6)
        
        XCTAssertEqual(6, sut.score)
    }
    
    func test_whenFirstRollHas3Pins_scoreIs3() {
        sut.roll(3)
        
        XCTAssertEqual(3, sut.score)
    }
    
    func test_whenFirstRollHas16Pins_scoreIs10() {
        sut.roll(16)
        
        XCTAssertEqual(10, sut.score)
    }
    
    func test_whenFirstRollHasMinus5_scoreIs0() {
        sut.roll(-5)
        
        XCTAssertEqual(0, sut.score)
    }
    
    func test_whenRoll2PinsTwoTimes_thenScoreIs4() {
        sut.roll(2, times: 2)
        
        XCTAssertEqual(2+2, sut.score)
    }
    
    func test_whenNoRoll_thenGameIsNotFinished() {
        XCTAssertFalse(sut.isFinished)
    }
    
    func test_when20Roll_thenGameIsFinished() {
        sut.roll(4, times: 20)
        
        XCTAssertTrue(sut.isFinished)
    }
    
    func testMaxScore() {
        sut.roll(10, times: 10)
        
        XCTAssertEqual(10*10, sut.score)
    }
    
    func test_whenSumOfTwoRollsIs10_itsSpare_shouldDoubleNextRoll() {
        sut.roll(4)
        sut.roll(6)
        sut.roll(5)
        
        XCTAssertEqual(4+6+5*2, sut.score)
    }
    
}


class Game {
    var score: Int {
        var allScore = rolls.reduce(0, +)
        allScore += calculateSpare()        
        
        return allScore
    }
    
    var isFinished: Bool {
        rolls.count == 20
    }
    
    private var rolls: [Int] = []
    
    
    func calculateSpare() -> Int {
        guard rolls.count == 3 else { return 0 }
        
        var additionalScore = 0
        let isSpare = rolls[0] + rolls[1] == 10
        
        if isSpare {
            additionalScore += rolls[2]
        }
        
        
        return additionalScore
    }
    
    func roll(_ pins: Int) {
        guard pins >= 0  else { return }
        rolls.append(min(pins, 10))
    }
}

extension Game {
    func roll(_ pins: Int, times: Int) {
        for _ in 1...times {
            roll(pins)
        }
    }
}
