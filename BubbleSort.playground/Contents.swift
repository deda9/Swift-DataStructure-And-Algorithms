/**
 * Time Complexity: O(n*n)
 * That works by repeatedly swapping the adjacent elements if they are in wrong order by value.
 */
class BubbleSort {
    static func sort(array: inout [Int]) -> [Int] {
        for i in 0..<array.count {
            for j in 0..<array.count - i - 1 {
                if array[j] > array[j+1] {
                    let temp = array[j]
                    array[j] = array[j+1]
                    array[j+1] = temp
                }
            }
        }
        return array
    }
}

class Tester {
    static func test() {
        var array = [2, 1, 99, 8989, 7, 4, 1, 4, 3, 9]
        BubbleSort.sort(array: &array)
        print(array)
    }
}

Tester.test()
