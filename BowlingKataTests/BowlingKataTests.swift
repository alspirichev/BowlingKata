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
    
}


class Game {
    var score = 0
    
    func roll(_ pins: Int) {
        guard pins >= 0  else { return }
        self.score = min(pins, 10)
    }
}
