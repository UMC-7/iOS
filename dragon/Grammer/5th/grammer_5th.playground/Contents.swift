/* practice 1 */

class BankAccount {
    /* 요구사항에 맞춰 구현해주세요! */
    let accountNumber: String
    private(set) var balance: Double
    
    init(accountNumber: String, initialBalance: Double) {
        self.accountNumber = accountNumber
        self.balance = initialBalance >= 0 ? initialBalance : 0
    }
    
    func deposit(amount: Double) {
        guard amount > 0 else {
            print("입금 금액은 0보다 커야 합니다.")
            return
        }
        balance += amount
        print("입금된 금액: \(amount), 현재 잔액: \(balance)")
    }

    func withdraw(amount: Double) {
        guard amount > 0 else {
            print("출금 금액은 0보다 커야 합니다.")
            return
        }
        
        if amount > balance {
            print("Insufficient funds")
        } else {
            balance -= amount
            print("출금된 금액: \(amount), 현재 잔액: \(balance)")
        }
    }
}

/* 코드 시나리오, 위 클래스 구현 후 실행 시켜주세요! */

let account = BankAccount(accountNumber: "123-456", initialBalance: 100.0)

account.deposit(amount: 50.0) // 출력: "Deposited 50.0. Current balance: 150.0"
account.withdraw(amount: 30.0) // 출력: "Withdrew 30.0. Current balance: 120.0"
account.withdraw(amount: 200.0) // 출력: "Insufficient funds. Current balance: 120.0"



/* practice 2 */
struct Car {
    // Properties
    var make: String
    var model: String
    var year: Int
    var mileage: Double
    var isRunning: Bool

    // Initializer
    init(make: String, model: String, year: Int, mileage: Double, isRunning: Bool) {
        self.make = make
        self.model = model
        self.year = year
        self.mileage = mileage
        self.isRunning = isRunning
    }

    // Start method
    mutating func start() {
        if isRunning {
            print("차 이미 시동 중.")
        } else {
            isRunning = true
            print("차 시동 걸림.")
        }
    }

    // Stop method
    mutating func stop() {
        if isRunning {
            isRunning = false
            print("차 시동 꺼짐.")
        } else {
            print("차 이미 꺼짐.")
        }
    }

    // Drive method
    mutating func drive(distance: Double) {
        if isRunning {
            mileage += distance
            print("이동거리 \(distance) km. 현재 mileage: \(mileage) km")
        } else {
            print("이동 불가능. 차 시동 꺼짐.")
        }
    }
}

/* 코드 시나리오, 위 클래스 구현 후 실행 시켜주세요! */

var myCar = Car(make: "한국", model: "KIA", year: 2024, mileage: 15000.0, isRunning: false)

myCar.start() // 출력: "차 시동 걸림."
myCar.drive(distance: 100) // 출력: "이동거리 100 km. 현재 mileage: 15100 km"
myCar.stop() // 출력: "차 시동 꺼짐."
myCar.drive(distance: 50) // 출력: "이동 불가능. 차 시동 꺼짐."
myCar.start() // 출력: "Car started."
myCar.start() // 출력: "차 이미 시동 중."


/* Practice 3 */
actor OrderProcessor {
        private var orders: [String] = []
    
    // 주문 추가 메서드
    func addOrder(_ order: String) {
            orders.append(order)
            print("추가된 주문: \(order)")
    }

    // 주문 처리 메서드
    func processOrder() {
        if orders.isEmpty {
                print("처리할 주문 없음")
        } else {
                let order = orders.removeFirst()
                print("처리된 주문: \(order)")
        }
    }

    // 현재 남아있는 주문 출력 메서드
    func printAllOrder() {
        if orders.isEmpty {
                print("남아 있는 주문 없음")
        } else {
                print("남아 있는 주문: \(orders.joined(separator: ", "))")
        }
    }
}

// OrderProcessor 인스턴스 생성
let orderProcessor = OrderProcessor()

// 비동기 작업을 수행하기 위한 Task
Task {
    // 1. 주문 추가
    await orderProcessor.addOrder("Pizza")
    await orderProcessor.addOrder("Burger")
    await orderProcessor.addOrder("Pasta")
    
    // 2. 첫 번째, 두 번째 주문 처리
    await orderProcessor.processOrder() // 처리된 주문: Pizza
    await orderProcessor.processOrder() // 처리된 주문: Burger
    
    // 3. 남은 주문 확인 (Pasta가 남아있어야 함)
    await orderProcessor.printAllOrder()
    
    // 4. 나머지 주문 처리
    await orderProcessor.processOrder() // 처리된 주문: Pasta
    await orderProcessor.processOrder() // 처리할 주문 없음
    
    // 5. 마지막 남은 주문 확인 (남은 주문 없음)
    await orderProcessor.printAllOrder()
}
