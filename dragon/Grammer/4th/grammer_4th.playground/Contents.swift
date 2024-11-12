import UIKit

// 1. "최종 결제 금액: (최종 결제 금액)원"과 같이 출력되도록 작성해주세요!
func calculateTotalPrice(orderCost: Int, tipCost: Int) -> Int {
    return orderCost + tipCost
}

// 2. "덥다", "춥다", "적당하다"와 같이 출력되도록 작성해주세요!
func checkTemperature(temperature: Double) {
    if temperature >= 30 {
        print("덥다")
    }
    else if temperature>=20 && temperature < 30 {
        print("적당하다")
    }
    else {
        print("춥다")
    }
}

// 3. "(여행지)에서의 총 여행 예산은 (총 예산)원입니다."와 같이 출력되도록 작성해주세요!
func printTravelBudget(cityName: String, nights: Int, dailyBudget: Double) {
    let totalBudget = dailyBudget * Double(nights)
    print("\(cityName)에서의 총 여행 예산은 \(totalBudget)원 입니다.")
}

// 4. "오늘 날짜: 2024-09-19"와 같이 오늘 날짜가 "YYYY-MM-DD" 형식으로 출력되도록 작성해주세요!
func getCurrentDate() -> String {
    let date = Date()
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: date)
}

print("오늘 날짜: \(getCurrentDate())")


// 1. Int 변수를 파라미터로 받는 addValue 클로저를 선언하고 출력해주세요! 값은 임의로 넣어주세요.
let addValue = {(number: Int) -> Int in
    var sum = 0
    for i in 1...number {
        sum += i
    }
    return sum
}

let result = addValue(10)
print("누적 합: \(result)")

// 2. 1번에서 선언한 addValue 클로저를 $를 이용해 경량화 시킨 코드를 아래 넣어주세요!
let addValueSimplified: (Int) -> Int = {
    var sum = 0
    for i in 1...$0 {
        sum += i
    }
    return sum
}

let simplifiedResult = addValueSimplified(10)
print("경량화된 클로저의 누적 합: \(simplifiedResult)")

