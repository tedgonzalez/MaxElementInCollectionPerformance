import XCTest

struct Solution {
    
    static func usingMax(_ given: [UInt32]) -> UInt32! {
        return given.max()
    }
    
    static func usingMaxBy(_ given: [UInt32]) -> UInt32! {
        return given.max(by: { $0 < $1 })
    }
    
    static func usingSortReturnLast(_ given: [UInt32]) -> UInt32! {
        return given.sorted().last!
    }
    
    static func usingReduce(_ given: [UInt32]) -> UInt32! {
        return given.reduce(UInt32.min, { max($0, $1) })
    }
    
}

final class PerformanceTests: XCTestCase {
    
    private var given: [UInt32] = []
    private var maxValue: UInt32!
    
    override func setUp() {
        super.setUp()
        maxValue = 100000
        let maxCount = 100000
        (0..<maxCount).forEach { _ in
            given.append(arc4random() % maxValue)
        }
        given.insert(maxValue, at: Int(arc4random()) % maxCount)
    }
    
    func testUsingMax() {
        measure {
             XCTAssertEqual(maxValue, Solution.usingMax(given))
        }
    }
    
    func testUsingMaxBy() {
        measure {
            XCTAssertEqual(maxValue, Solution.usingMaxBy(given))
        }
    }
    
    func testUsingSortReturnLast() {
        measure {
            XCTAssertEqual(maxValue, Solution.usingSortReturnLast(given))
        }
    }
    func testUsingReduce() {
        measure {
            XCTAssertEqual(maxValue, Solution.usingReduce(given))
        }
    }
    
}

PerformanceTests.defaultTestSuite.run()
