# What’s the best way to find the max int in an array?
**TLDR** array.max() wins

## Solution 1
`array.max()`

## Solution 2
`(array as AnyObject).value(forKeyPath: "@max.self") as? Int`

## Solution 3A
`array.max(by: < )`

## Solution 3B
`array.max(by: { $0 < $1 })`

## Solution 4A
`array.reduce(Int.min, max)`

## Solution 4B
`array.reduce(Int.min, { max($0, $1) })`

## Solution 5
`array.sorted().last!`


## Results
For array with 100000 elements with maxValue 100000

Solution 1	average: 0.051
Solution 2	average: 0.104
Solution 3A	average: 0.058
Solution 3B	average: 2.359
Solution 4A	average: 0.074
Solution 4B	average: 2.587
Solution 5	average: 1.244
	