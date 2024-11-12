class UMC {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {   //생성자
        self.name = name
        self.age = age
    }
    
    func message() {
        print("안녕하세요! UMC입니다")
    }
}

let umc1 = UMC(name: "UMC1", age: 21)
let umc2 = UMC(name: "UMC2", age: 22)
let umc3 = UMC(name: "UMC3", age: 23)

print("Name: \(umc1.name), Count: \(umc1.age)")  // 출력: Name: UMC1, age: 21
print("Name: \(umc2.name), Count: \(umc2.age)")  // 출력: Name: UMC2, age: 22
print("Name: \(umc3.name), Count: \(umc3.age)")  // 출력: Name: UMC3, age: 23
