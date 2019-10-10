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
        sut.roll(2)
        sut.roll(2)
        
        XCTAssertEqual(2+2, sut.score)
    }
    
    func test_whenNoRoll_thenGameIsNotFinished() {
        XCTAssertFalse(sut.isFinished)
    }
    
    func test_when20Roll_thenGameIsFinished() {
        for _ in 1...20 {
            sut.roll(4)
        }
        
        XCTAssertTrue(sut.isFinished)
    }
    
}


class Game {
    var score = 0
    var isFinished: Bool {
        rolls == 20
    }
    
    private var rolls = 0
    
    func roll(_ pins: Int) {
        rolls += 1
        guard pins >= 0  else { return }
        self.score += min(pins, 10)
    }
}
