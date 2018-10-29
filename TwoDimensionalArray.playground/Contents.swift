/**
 * Learn how to write 2D array in swift
 */

struct Array2D<T> {
    
    private var array =  [[T]]()
    
    init(column: Int, row: Int, initialValue: T) {
        array = fillArray(count: column, with: fillArray(count: row, with: initialValue))
    }
    
    private func fillArray<T>(count: Int, with value: T) -> [T]{
        return [T] (repeating: value, count: count)
    }
    
    subscript(index: Int) -> [T] {
        get {
            return array[index]
        }
        set {
            array[index] = newValue
        }
    }
}

var array = Array2D(column: 2, row: 8, initialValue: 7)

print("Column 2: ", array[1])
print("Row 3 in Column 2: ", array[1][2], "\n")

print("Updating the Row 3 in Column 2 with value : ", 9, "\n")
array[1][2] = 9

print("Column 2 after updating: ", array[1])
print("Row 3 in Column 2 after updating: ", array[1][2], "\n")
