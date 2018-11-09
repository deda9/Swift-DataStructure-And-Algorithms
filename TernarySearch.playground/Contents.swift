class TernarySearch {
    
    static func findIndex(of value: Int, in array: [Int], start: Int, end: Int) -> Int {
        let mid1 = start + (end - start) / 3
        let mid2 = end - (end - start) / 3
        
        if start > end {
            return -1
        }
        if array[mid1] == value {
            return mid1
        }
        
        if array[mid2] == value {
            return mid2
        }
    
        if value < array[mid1] {
            return findIndex(of: value, in: array, start: 1, end: mid1 - 1)
        } else if value > array[mid2] {
            return findIndex(of: value, in: array, start: mid2 + 1, end: end)
        }else{
            return findIndex(of: value, in: array, start: mid1 + 1, end: mid2 - 1)
        }
    }
}

class Tester {
    static func test() {
        let array = [1, 2, 3, 4, 5, 6, 7, 8]
        let index = TernarySearch.findIndex(of: 8, in: array, start: 0, end: array.count)
        print("Index of 3 is: ", index)
    }
}

Tester.test()
