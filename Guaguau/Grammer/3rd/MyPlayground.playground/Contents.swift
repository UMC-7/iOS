//Problem 1

//1
var studentScore: [String: Int] = ["Alice": 100, "Bob": 90, "Min": 80]

//2
studentScore["Alice"] = 95

//3
studentScore["Bob"] = nil

for (name,score) in studentScore{
    print("\(name)의 점수: \(score)")
}

//Problem 2

//1
var fruits: Set<String> = ["Apple", "Banana", "Orange"]

//2
if fruits.contains("Banana"){
    fruits.insert("Mango")
}

//3
for fruit in fruits{
    print(fruit)
}

//Problem 3

//1
enum NetworkState {
    case idle
    case requesting
    case success(String)
    case failure(String)
}

//2
var currentState: NetworkState = .success("데이터 로드 완료")

//3
switch currentState {
case .idle:
    print("현재 대기 상태입니다.")
case .requesting:
    print("요청 중입니다...")
case .success(let success):
    print("요청 성공: \(success)")
case .failure(let error):
    print("요청 실패: \(error)")
}
