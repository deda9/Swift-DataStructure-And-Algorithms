/**
  * Time Complexity: O(n2)
  * It works by repeatedly finding the minimum element from unsorted part and putting it at the beginning
 */
class SelectionSort {
    static func sort(array: inout [Int]) -> [Int] {
       
        for i in 0..<array.count-1 {
            var minIndex = i
            
            for j in i+1..<array.count {
                if array[j] < array[minIndex]{
                    minIndex = j
                }
            }
            let temp = array[minIndex]
            array[minIndex] = array[i]
            array[i] = temp
        }
        return array
    }
}

class Tester {
    static func test() {
        var array = [2, 1, 99, 8989, 7, 4, 1, 4, 3, 9]
        SelectionSort.sort(array: &array)
        print(array)
    }
}

Tester.test()
