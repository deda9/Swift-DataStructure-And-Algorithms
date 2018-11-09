/**
 Example: Consider the following 6 activities
 sorted by by finish time.
 start[]  =  {1, 3, 0, 5, 8, 5};
 finish[] =  {2, 4, 6, 7, 9, 9};
 A person can perform at most four activities. The
 maximum set of activities that can be executed
 is {0, 1, 3, 4} [ These are indexes in start[] and
 finish[] ]
 */

class GreedyAlgorithm {
    static func findMaxActivity(in array: [(start: Int, end: Int)]) -> [Int] {
        var indices: [Int] = []
        var startIndex = 0
        var endIndex = 1
        
        //Select start time coz its optimal after sort
        indices.append(startIndex)
        
        while endIndex < array.count {
            
            //Compare if the start time of the next work is larger than or equal the next finish time
            if array[endIndex].start >= array[startIndex].end {
                indices.append(endIndex)
                startIndex = endIndex
            }
            endIndex += 1
        }
        return indices
    }
}

class Tester {
    static func test() {
        let work = [(start: 1, end: 2),
                    (start: 3, end: 4),
                    (start: 0, end: 6),
                    (start: 5, end: 7),
                    (start: 8, end: 99),
                    (start: 5, end: 9)]
        
        let maxActivityTimes: [Int] = GreedyAlgorithm.findMaxActivity(in: work)
        print("max activities times user can do", maxActivityTimes)
    }
}

Tester.test()

