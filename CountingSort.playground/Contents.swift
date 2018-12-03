
class CountingSort {
    static func sort(array: [Int]) -> [Int] {
        let max = array.max() ?? 0
        var countingArray = [Int](repeating: 0, count: max+1)
        var sortedArray = [Int](repeating: 0, count: array.count)
        
        for i in 0..<array.count {
            let index = array[i]
            countingArray[index] += 1
        }
        
        for i in 1..<countingArray.count {
            countingArray[i] += countingArray[i-1]
        }
        
        
        for element in array {
            countingArray[element] -= 1
            sortedArray[countingArray[element]] = element
        }
        
        return sortedArray
    }
}

class Tester {
    static func test() {
        let array = [1, 4, 1, 2, 7, 5, 2, 55, 66, 33, 12, 33, 2]
        let sortedArray = CountingSort.sort(array: array)
        print(sortedArray)
    }
}

Tester.test()
