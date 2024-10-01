/* first */

//1
var x: Int = 5
x += 1
print(x)

//2
var a: Int = 10
var b: Int = 20
var sum = a + b
print(sum)

//3
let score: Int = 100
print(score >= 60 ? "합격" : "불합격" )

//4
let isMember: Bool = true
let points: Int = 130
print(isMember == true && points >= 100 ? "할인가능" : "할인불가능")

//5
var numbers = 1...5

for number in numbers {
    if(number != 5){
        print(number, terminator: ",")
    }
    else{
        print(number)
    }
}


/* second */

//1
var temperature: Int = 22

if temperature >= 30{
    print("덥다")
}
else if temperature < 30 && temperature >= 10{
    print("적당하다")
}
else{
    print("춥다")
}

//2
var day: Int = 1

switch day{
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
    print("잘못된 입력")
}


/* third */

//1
var fruits: [String] = []

for fruit in ["Apple", "Banana", "Cherry"]{
    fruits.append(fruit)
}
for fruit in fruits{
    print(fruit)
}

//2
var count: Int = 1
while(count <= 5){
    print("Count: \(count)")
    count+=1
}
