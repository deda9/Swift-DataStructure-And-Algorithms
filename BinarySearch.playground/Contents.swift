
/**
 * Take an array and search for the index for the target
 */
class BinarySearch {
    
    static func find(in array: [Int], target: Int, start: Int, end: Int) -> Int {
        let minValue = array[start]
        let maxValue = array[end]
        
        let midIndex = start + (end - start)/2
        let midValue = array[midIndex]
        
        if target < minValue || target > maxValue {
            return -1
        }
        
        if target == midValue {
            return midIndex
        }
        
        if target < midValue {
            return find(in: array, target: target, start: start, end: midIndex - 1)
        }
        
        if target > midValue {
            return find(in: array, target: target, start: midIndex + 1, end: end)
        }
        
        return -1
    }
}

let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let targetIndex = BinarySearch.find(in: array, target: 3, start: 0, end: array.count - 1)
print(targetIndex)

