//: Playground - noun: a place where people can play

import UIKit


struct WatchDevice {
    var pairediPhone:String? = nil
    var appInstalled = false
    
    enum WatchSize {
        case m42,m38
    }
}

var appleWatch:WatchDevice? = nil
appleWatch = WatchDevice(pairediPhone: "링고스타의 아이폰", appInstalled: true)

if let watch = appleWatch {
    if let phoneName = watch.pairediPhone {
        print("AppleWhatch가 \(phoneName)과 쌍을 이룹니다.")
    }
}


typealias Time = (minute:Int, second:Int)

let lunch = (16, 37)
let walk = (18, 48)

// 함수의 인자와 리턴 타입을 명시해주세요
func addTime (time1:Time, time2:Time) -> Time {
    let secondSum = time1.second + time2.second
    let second = secondSum % 60
    let minute = time1.minute + time2.minute + (secondSum / 60)
    
    // minute과 second를 이용해서 적절한 값을 리턴해주세요
    return Time(minute, second)
}

//atNoon의 값은 (35, 25) 이어야 합니다.
let atNoon = addTime(time1:lunch, time2:walk)
print(atNoon)


//-------------
//: Method
class Car {
    var drivingLog:[Driving] = []
    var mileage:Int = 0
    
    // 매개변수로 Driving 인스턴스를 받으세요
    func addLog(driving:Driving) {
        // 인자를 drivingLog 배열에 추가하세요
        self.drivingLog += [driving]
        //  mileage에 운행거리를 더하세요
        self.mileage += driving.distance
    }
}

struct Driving {
    let car:Car
    let distance:Int //운행 거리
    
    func arrived() {
        car.addLog(driving:self)
    }
}

let truck = Car()
let deliver = Driving(car: truck, distance:30)
deliver.arrived()

print(truck.drivingLog)
print(truck.mileage)


//-------------
//: Enum Associated Value
indirect enum Fuel {
    case Gasoline
    case Diesel
    case LPG
    case Electic(hybrid:Fuel?)
}

let mini01Fuel = Fuel.Diesel
let mini02Fuel = Fuel.Gasoline
let sedan01Fuel = Fuel.Electic(hybrid:nil)
    
    print("mini01은 연료로 \(mini01Fuel)을 씁니다.")
    print("mini02는 연료로 \(mini02Fuel)을 씁니다.")
    print("sedan01은 연료로 \(sedan01Fuel)을 씁니다.")
