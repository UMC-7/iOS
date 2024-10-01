
/* 1번 */
// 1. 단항 연산자: 변수 x의 값을 5로 초기화한 후 1 증가시키고, 증가된 값을 출력
var x: Int = 5
x += 1
print(x)


// 2. 이항 연산자: 변수 a와 b를 각각 10과 20으로 초기화한 뒤 더한 결과를 변수 sum에 저장하고, 그 결과를 출력
var a: Int = 10
var b: Int = 20
var sum: Int = a + b
print(sum)

// 3. 삼항 연산자: 변수 score가 60 이상이면 "합격", 그렇지 않으면 "불합격"을 출력
var score: Int = 100
print(score >= 60 ? "합격" : "불합격")


// 4. 논리 연산자: 변수 isMember가 true이고 points가 100 이상이면 "할인 가능", 그렇지 않으면 "할인 불가능"을 출력
var isMember: Bool = true
var points: Int = 100
print(isMember && points >= 100 ? "할인 가능" : "할인 불가능")

// 5. 범위 연산자: 변수 numbers에 1부터 5까지의 숫자를 저장하고, 이 숫자들을 출력
//var numbers: [Int] = 1...5 오류
var numbers: [Int] = Array(1...5)
print(numbers)



/* 2번 */
// 1. if문: temperature가 30 이상이면 "덥다", 10 이상 30 미만이면 "적당하다", 그렇지 않으면 "춥다"를 출력
var temperature: Int = 27
if temperature >= 30 {
    print("덥다")
} else if temperature >= 10 && temperature < 30{
    print("적당하다")
} else {
    print("춥다")
}

// 2. switch문: day에 따른 요일을 출력하고, 1~5는 "주중", 6과 7은 "주말"을 출력

var day : Int = 4
switch day {
case 1:
    print("월, 주중")
case 2:
    print("화, 주중")
case 3:
    print("수, 주중")
case 4:
    print("목, 주중")
case 5:
    print("금, 주중")
case 6:
    print("토, 주말")
case 7:
    print("일, 주말")
default:
    print("해당 요일 X")
}



/* 3번 */
// 1. for-in문: 배열 fruits에 "Apple", "Banana", "Cherry"를 저장하고, 각 과일의 이름을 출력
var fruits: [String] = ["Apple", "Banana", "Cherry"]
for fruit in fruits {
    print("\(fruit)")
}

// 2. while문: 변수 count가 5가 될 때까지 "Count: n" 형식으로 숫자를 출력
var count : Int = 0
while count < 5 {
    count += 1
    print("Count: \(count)")
}
