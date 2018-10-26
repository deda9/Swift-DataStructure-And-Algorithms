
/**
 * two sum algorithm, take an array and tagert and return the indices which thier sum == this target
 * and this solution cost n2  (n power 2)
 */
class TwoSum {
    static func excute(in array: [Int], target: Int) -> (Int, Int){
        var indices = (-1, -1)
        for i in 0..<array.count {
            for j in 0..<array.count where j != i {
                let sum = array[i] + array[j]
                if sum == target {
                    indices = (j, i)
                }
            }
        }
        return indices
    }
}

let array = [1, 2, 3, 5, 10]
let indices = TwoSum.excute(in: array, target: 11)
print(indices)
