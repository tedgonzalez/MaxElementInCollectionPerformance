import XCTest

struct Solution {
    
    static func usingMax(_ given: [UInt32]) -> UInt32! {
        return given.max()
    }
    
    static func usingKeyPath(_ given: [UInt32]) -> UInt32! {
        return (given as AnyObject).value(forKeyPath: "@max.self") as? UInt32
    }
    
    static func usingMaxBy(_ given: [UInt32]) -> UInt32! {
        return given.max(by: < )
    }
    
    static func usingMaxByCustom(_ given: [UInt32]) -> UInt32! {
        return given.max(by: { $0 < $1 })
    }
    
    static func usingReduce(_ given: [UInt32]) -> UInt32! {
        return given.reduce(UInt32.min, max)
    }
    
    static func usingReduceCustom(_ given: [UInt32]) -> UInt32! {
        return given.reduce(UInt32.min, { max($0, $1) })
    }
    
    static func usingSortReturnLast(_ given: [UInt32]) -> UInt32! {
        return given.sorted().last!
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
    
    func testSolution1() {
        measure {
            XCTAssertEqual(maxValue, Solution.usingMax(given))
        }
    }
    
    func testSolution2() {
        measure {
            XCTAssertEqual(maxValue, Solution.usingKeyPath(given))
        }
    }
    
    
    func testSolution3A() {
        measure {
            XCTAssertEqual(maxValue, Solution.usingMaxBy(given))
        }
    }
    
    func testSolution3B() {
        measure {
            XCTAssertEqual(maxValue, Solution.usingMaxByCustom(given))
        }
    }
    
    func testSolution4A() {
        measure {
            XCTAssertEqual(maxValue, Solution.usingReduce(given))
        }
    }
    
    func testSolution4B() {
        measure {
            XCTAssertEqual(maxValue, Solution.usingReduceCustom(given))
        }
    }
    
    func testSolution5() {
        measure {
            XCTAssertEqual(maxValue, Solution.usingSortReturnLast(given))
        }
    }
    
}

PerformanceTests.defaultTestSuite.run()
