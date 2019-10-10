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

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_initialScoreIsZero() {
        let game = Game()
        
        XCTAssertEqual(0, game.score)
    }
    
    
}


class Game {
    var score = 0
    
    
}
