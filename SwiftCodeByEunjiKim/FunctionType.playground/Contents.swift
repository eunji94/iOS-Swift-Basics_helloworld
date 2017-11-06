//: Playground - noun: a place where people can play

import UIKit

//: Function Type

func addVAT(source:Double) -> Double {
    return source * 1.1
}
func couponDiscount(source:Double) -> Double {
    return source * 0.9
}

var additional:(Double) -> Double

let transaction102101 = 120.7
additional = addVAT

let price102301 = additional(transaction102101)

func finalPrice(source:Double, additional:(Double) -> Double) -> Double {
    let price = additional(source)
    return price
}

let price102102 = finalPrice(source: 350.0, additional: couponDiscount)


//: Closure

let addVATClosure = { (source:Double) -> Double in
    return source * 1.1
}
let addVATClosure2 = { source in
    return source * 1.1
}
let addVATClosure3 = { source in
    source * 1.1
}
let addVATClosure4 = {$0 * 1.1}
let couponDiscountCloser = { (source:Double) -> Double in
    return source * 0.9
}
let couponDiscountCloser2 = { source in
    return source * 0.9
}
let couponDiscountCloser3 = { source in
    source * 0.9
}
let couponDiscountCloser4 = {$0 * 0.9}

let price102103 = addVATClosure4(157.6)
let price102104 = couponDiscountCloser(200.0)

func makeAdder (x:Int) -> (Int) -> Int {
    func adder(a:Int) -> Int {
        return x + a
    }
    return adder
}
func makeAdder2 (x:Int) -> (Int) -> Int {
    let adder:(Int) -> Int = {
        return $0 + x
    }
    return adder
}
func makeAdder3 (x:Int) -> (Int) -> Int {
    return {
        return $0 + x
    }
}

let add5 = makeAdder2(x: 5)
let add10 = makeAdder2(x: 10)

print(add5(2))
print(add10(2))
print(makeAdder3(x:5)(2))


//: map
let transactions = [560.0, 321.5, 190.0, 672.8, 1190.0, 450.0]

var vatPrices:[Double] = []

for transaction in transactions {
    vatPrices += [addVAT(source: transaction)]
}

let vatMapPrices = transactions.map({ transaction -> Double in
    return transaction * 1.1
})
let vatMapPrices2 = transactions.map({$0*1.1})
print(vatMapPrices2)


//: filter

var bigTransactions:[Double] = []
for price in vatPrices {
    if price >= 500 {
        bigTransactions += [price]
    }
}
let bigFilterTransactions = vatPrices.filter {$0 >= 500}
print(bigFilterTransactions)

var meetingRooms:[String:Int] = ["Banksy":4, "Rivera":8, "Kahlo":8, "Picasso":10, "Cezanne":20, "Matisse":30]
print(meetingRooms)

let members = 9
let available = meetingRooms.filter{$0.1 > members}
print(available.first!)
print(Array(available)[0])

//: sort
func ascendantSort (sort1:Double, sort2:Double) -> Bool {
    return sort1 > sort2
}
let sortedPrices = vatPrices.sorted(by:ascendantSort)
let sortedPrices2 = vatPrices.sorted(by:{ sort1, sort2 in
    return sort1>sort2
})
let sortedPrices3 = vatPrices.sorted(by:{$0>$1})
print("\(sortedPrices3)")
let sortedPrices4 = vatPrices.sorted(by:>)

let sortedMeetingRooms = meetingRooms.sorted(by: {$0.1>$1.1})
print("\(sortedMeetingRooms)")


//: reduce

func priceSum (base:Double, adder:Double) -> Double {
    return base + adder
}
var sum:Double = 0.0
for price in vatPrices {
    sum = priceSum(base: sum, adder: price)
}
print("\(sum)")

var sum2:Double = 0.0
let sumReduce = vatPrices.reduce(sum2, priceSum)
let sumReduce2 = vatPrices.reduce(0.0, {base, adder in
    base + adder
})
let sumReduce3 = vatPrices.reduce(0.0, +)

let pricesInString = vatPrices.reduce("",{ $0 + "\($1)\n"})
print(pricesInString)

let descriptionString = meetingRooms.reduce("We have meeting rooms : \n", {$0 + "\($1.0) for \($1.1) person \n"})
print(descriptionString)
