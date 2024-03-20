import Foundation


let serialQueue = DispatchQueue(label: "kz.one.lab")

var value = "One"

func changeValue(step: Int) {
    sleep(1)
    value += " lab"
    print("\(value) - \(step)")
}

serialQueue.async {
    changeValue(step: 1)
}

value = "Zero"

serialQueue.sync {
    changeValue(step: 2)
}

print(value)



let lowPriority = BlockOperation {
    print("low priority operation")
}

let highPriority = BlockOperation {
    print("hight priority operation")
}

lowPriority.queuePriority = .low
highPriority.queuePriority = .high


let queue = OperationQueue()
queue.addOperations([lowPriority, highPriority], waitUntilFinished: false)

func task1() async {
    print("Начало первого таска")
    await task2()
    print("не будет работать таск 1")
}

func task2() async {
    print("Начало второго таска")
    await task1()
    print("не будет работать таск 2")
}

await task1()
