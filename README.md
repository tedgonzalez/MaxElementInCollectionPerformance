# What’s the best way to find the max int in an array?
**TLDR** array.max() wins

## Solution 1
`array.max()`

## Solution 2
`(array as AnyObject).value(forKeyPath: "@max.self") as? Int`

## Solution 3
`array.max(by: { $0 < $1 })`

## Solution 4
`array.reduce(Int.min, { max($0, $1) })`

## Solution 5
`array.sorted().last!`


## Results
For array with 100000 elements with maxValue 100000

Solution 1 average: 0.052
Solution 2 average: 0.108
Solution 3 average: 2.416
Solution 4 average: 2.493
Solution 5 average: 1.252
	