# What’s the fastest way to find the max int in an array?
*TLDR* array.max() wins

## Solution 1
`array.max()`
## Solution 2
`array.max(by: { $0 < $1 })`
## Solution 3
`array.sorted().last!`
## Solution 4
`array.reduce(Int.min, { max($0, $1) })`

## Results
For array with 100000 elements with maxValue 100000
Solution 1:
	Average: **0.069**
Solution 2:
	Average: **2.881**
Solution 3:
	Average: **1.410**
Solution 4:
	Average: **2.875**
	
