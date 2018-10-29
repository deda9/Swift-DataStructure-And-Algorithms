/**
 * two sum algorithm, take an array and tagert and return the indices which thier sum == this target
 * and this solution cost (n(log(n))
 */

class TwoSum {
    static func excute(in array: [Int], target: Int) -> (Int, Int) {
        
        for index in 0..<array.count {
            let compliment = target - array[index]
            var temArray = array
            temArray.remove(at: index)
            let complimentIndex = BinarySearch.find(in: temArray, target: compliment, start: 0, end: temArray.count - 1)
            if complimentIndex != -1 {
              return (index, array.index(of: compliment) ?? -1)
            }
        }
        return (-1, -1)
    }
}

class BinarySearch {
    static func find(in array: [Int], target: Int, start: Int, end: Int) -> Int {
        let minValue = array[start]
        let maxValue = array[end]
        let midIndex = start + (end - start) / 2
        let midValue = array[midIndex]
        
        if target > maxValue || target < minValue {
            return -1
        }
        
        if target == midValue {
            return midIndex
        }
        
        if target < midValue {
            return BinarySearch.find(in: array, target: target, start: start, end: midIndex - 1)
        }
        
        if target > midValue {
            return BinarySearch.find(in: array, target: target, start: midIndex + 1, end: end)
        }
        return -1
    }
}

let array = [1, 2, 3, 4, 5, 6, 8, 9, 10]
let twoSum = TwoSum.excute(in: array, target: 9)
print(twoSum)



