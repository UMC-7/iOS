//problem_01

//1.
func calculateTotalPrice(price: Float, Tip: Float) -> Float{
    return price + Tip
}

var totalPrice: Float = calculateTotalPrice(price: 100, Tip: 10)
print("최종 결제 금액: \(totalPrice)원")


//2.
func checkTemperature(temperature: Float){
    if temperature > 30 {print("덥다")}
    else if temperature < 0 {print("춥다")}
    else {print("적당하다")}
}

checkTemperature(temperature: 20)


//3.
func printTravelBudget(city: String, day: Int, dayBudget: Float){
    var totalBudget: Float = Float(day) * dayBudget
    print("\(city)에서의 총 여행 예산은 \(totalBudget)원입니다")
}
printTravelBudget(city: "서울", day: 3, dayBudget: 100000)


//4.
import Foundation

func getCurrentDate() -> String {
    let date = Date() // 현재 날짜를 가져옵니다
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY-MM-dd"
    let currentDate = dateFormatter.string(from: date)
    return currentDate
}

let today = getCurrentDate()
print("오늘 날짜: \(today)")


//problem_02

//1.
let addValue: (Int) -> Int = { number in
    var sum = 0
    for i in 1...number {
        sum += i
    }
    return sum
}

print(addValue(5))


//2.
let addValueShort: (Int) -> Int = {
    var sum = 0
    for i in 1...$0 { // $0은 첫 번째 인자를 의미합니다.
        sum += i
    }
    return sum
}

print(addValueShort(5))
