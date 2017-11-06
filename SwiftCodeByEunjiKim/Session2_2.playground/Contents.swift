//: Playground - noun: a place where people can play

import UIKit

//----------------------
//: Optional & Function

var title:String = "Storyboard Prototyping"
var ratings : [Double]? = nil
var supportURL : String? = nil

supportURL = "www.cordershigh.com"
ratings = [4.5, 3.0, 5.0, 2.5]

func ratingRecord (history:[Double]) -> (average:Double, min:Double, max:Double){
    var sum = 0.0, min = history[0], max = history[0]
    
    for value in history {
        if min > value { min = value }
        if max < value { max = value }
        sum += value
    }
    
    let average = sum / Double(history.count)
    
    return (average, min, max)
}

var bookDescription:String = "\(title)"
//if ratings != nil {
//    bookDescription += "has \(ratings!.count) ratings."
//}
//if supportURL != nil {
//    bookDescription += "\r\nsupport web page: \(supportURL!)"
//}
if let theRatings = ratings { //optional binding
    let record = ratingRecord(history: theRatings)
    bookDescription += " has \(theRatings.count) ratings, \r\naverage is \(record.average), from \(record.min) to \(record.max)."
}
//if let theURL = supportURL {
//    bookDescription += "\r\nsupport web page: \(theURL)"
//}
bookDescription += "\r\nsupport web page: \(supportURL!)"
print("\(bookDescription)")

//print("\(title) has \(ratings!.count) ratings. \r\nsupport web page: \(supportURL)")


//----------------------
//: Structure & Class & Enumerations

struct Task {
    var title:String //Stored property
    var time:Int?
    
    var owner:Employee
    //var participant:Employee?
    
    var type:TaskType
    
    enum TaskType {
        case Call(number:String)
        case Report(to:Employee, when:String)
        case Meet(with:Employee, location:String)
        case Support(who:Employee, duration:Int)
        
        var typeTitle:String { //Computed property
            get {
                let titleString:String
                switch self {
                case .Call:
                    titleString = "Call"
                case .Report:
                    titleString = "Report"
                case .Meet:
                    titleString = "Meet"
                case .Support:
                    titleString = "Support"
                }
                return titleString
            }
        }
    }
 
    init (type:TaskType, owner:Employee){
        self.type = type
        self.title = type.typeTitle
        self.owner = owner
        self.time = nil
        //self.participant = nil
    }
    
    func doBasicTask() -> String {
        let taskDescription:String
        switch type {
        case .Call(let number) :
            taskDescription = "\(owner.name) make a call to \(number)"
        case .Report(let receiver, let time) :
            taskDescription = "\(owner.name) report to \(receiver.name) at \(time)"
        case .Meet(let participant, let location) :
            taskDescription = "\(owner.name) meet \(participant.name) at \(location)"
        case .Support(let taskOwner, let duration) :
            taskDescription = "\(owner.name) support \(taskOwner.name) for \(duration) days"
        default:
            taskDescription = "Need more information for task."
        }
        return taskDescription
    }
}

class Employee {
    var name:String?
    var phoneNumber:String?
    var boss:Employee?
    
    init (name:String){
        self.name = name
    }
    
    convenience init (name:String, phone:String){
        self.init(name:name)
        self.phoneNumber = phone
    }
    
    func report() {
        if let myBoss = boss {
            print("\(self.name) reported to \(myBoss.name)")
        } else {
            print("\(String(describing: name)) don't have boss")
        }
    }
    
    func callTaskToBoss() -> Task? {
        if let myBoss = boss, let callTo = myBoss.phoneNumber {
            var callTask = Task(type: .Call(number: callTo), owner: self)
            return callTask
        }
        return nil
    }
}

let me:Employee = Employee(name: "Alex", phone: "010-1234-5678") //class는 let으로 만들더라도 내부의 값이 var라면 수정 가능
//me.name = "Alex"
//me.phoneNumber = "010-1234-5678"

let toby = Employee(name: "Toby")
//toby.name = "Toby"
toby.phoneNumber = "011-5678-1234"

me.boss = toby
me.report()
var todayTask:[Task] = []

//var callTask = Task(title: "Call to Toby", time: 10*60, owner: me, participant: toby, type:.Call) //let으로 struct를 만들면 수정 불가
//var reportTask = Task(title: "Report to Boss", time: nil, owner: me, participant: nil, type:Task.TaskType.Report)

//var callTask = Task(type: .Call, owner: me)
//callTask.time = 10*60
var reportTask = Task(type: .Report(to:toby, when:"Afternoon"), owner: me)
todayTask += [reportTask]
if let callTask = me.callTaskToBoss() {
    todayTask += [callTask]
    callTask.doBasicTask()
}
reportTask.doBasicTask()

//callTask.participant?.phoneNumber = "010-5678-1234"
//print("\(toby.phoneNumber)")

//todayTask += [callTask, reportTask] //todayTask에는 callTask의 값이 복사되어 들어간다
//callTask.title = "Call to Randy"
//print("today task = \(todayTask), callTask=\(callTask)")



