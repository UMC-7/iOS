import UIKit

/* 문제 1 */

// 1번
// 단항 연산자를 이용해 변수 x의 값을 5로 초기화한 후 1 증가시키고, 증가된 값을 출력하세요.
var x: Int = 5
x += 1
print(x)

// 2번
//이항 연산자를 이용해 변수 `a`와 `b`를  각각 10과 20으로 초기화한 뒤 더한 결과를 변수 `sum`에 저장하고, 그 결과를 출력하세요.

var a: Int = 10
var b: Int = 20
var sum = a+b
print(sum)

// 3번
// 삼항 연산자를 이용해 변수 `score`가 60 이상이면 "합격"을, 그렇지 않으면 "불합격"을 출력하세요. `score` 의 값은 임의로 지정해주세요.

var score: Int = 40
print(score >= 60 ? "합격" : "불합격")


//4번
// 논리 연산자를 이용해 변수 `isMember`가 `true`이고 `points`가 100 이상이면 "할인 가능"을 출력하고, 그렇지 않으면 "할인 불가능"을 출력하세요.

let isMember: Bool = true
let points: Int = 100
print((isMember == true) && (points >= 100) ? "할인가능" : "할인 불가능")


// 5번
// 범위 연산자를 이용해 변수 `numbers`에 1부터 5까지의 숫자를 저장하고  숫자들을 출력하세요.

for numbers in 1...5{
    print(numbers)
}



/* 문제 2 */

// 1번
// if문을 이용해 변수 temperature가 30 이상이면 "덥다"를 출력하고, 10 이상 30 미만이면 "적당하다"를 출력하며, 그렇지 않으면 "춥다"를 출력하세요. temperature 의 값은 임의로 지정해주세요.

var temperature: Int = 40
if temperature >= 30 {
    print("덥다")
} else if temperature > 10 && temperature < 30 {
    print("적당하다")
} else {
    print("춥다")
}


// 2번
// switch문을 이용해 변수 day에 요일을 나타내는 정수(1부터 7까지, 1은 월요일)를 저장하고, 해당 요일에 따라 "주중" 또는 "주말"을 출력하세요. 예를 들어, 1부터 5까지는 "주중", 6과 7은 "주말"을 출력하세요. day 값은 임의로 지정해주세요.

var day: Int = 5
switch day {
case 1:
    print("주중")
case 2:
    print("주중")
case 3:
    print("주중")
case 4:
    print("주중")
case 5:
    print("주중")
case 6:
    print("주말")
case 7:
    print("주말")
default:
    print("잘못된 숫자를 입력했습니다")
}



/* 문제 3 */

// 1번
// for-in문을 이용해 배열 fruits에 "Apple", "Banana", "Cherry"를 저장하고, 각 과일의 이름을 출력하세요.

let fruits = ["Apple", "Banana", "Cherry"]
for fruit in fruits {
    print(fruit)
}

// 2번
// while문을 이용해 변수 count가 5가 될 때까지 "Count: n" 형식으로 숫자를 출력하세요. (n은 현재 숫자를 나타냅니다.)

var count: Int = 1
while count <= 5  {
    print("Count: \(count)")
    count+=1
}
