/**
 * two sum algorithm, take an array and tagert and return the indices which thier sum == this target
 * and this solution cost log(n)
 */

class TwoSum {
    static func excute(in array: [Int], target: Int) -> (Int, Int) {
        
        var lowIndex = 0
        var heighIndex = array.count - 1
        
        while lowIndex < heighIndex {
            
            let sum = array[lowIndex] + array[heighIndex]
            if target == sum {
                return (lowIndex, heighIndex)
            }
            else if sum < target {
                lowIndex += 1
            }
            else if sum > target  {
                heighIndex -= 1
            }
        }
        return (-1, -1)
    }
}


let array = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
let indices = TwoSum.excute(in: array, target: 5)
print(indices)
