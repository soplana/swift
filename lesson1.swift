func lesson(no: String) {
  println("")
  println("********** \(no) *************")
}



// ****************************
// 変数について
// ****************************
func variableFunction() {
  lesson("variableFunction")

  // varは変数の宣言で再代入可能
  var hoge = "hoge"
  println(hoge)
  hoge = "fuga"
  println(hoge)

  // letは定数の宣言で再代入不可
  let piyo = "piyo"
  println(piyo)
  // piyo = "piyopiyo" -> error

  // 型宣言
  var fuga: String
}
variableFunction()



// ****************************
// 関数について
// ****************************
func lessonFunction() {
  lesson("lessonFunction")

  func sayHello(name: String, age: Int) -> String {
    return "\(name) hello! \(age)"
  }
  // 関数はオブジェクトなので代入することも可能
  var hoge = sayHello
  println(hoge("soplana", 29))

  // 名前付き引数で関数を定義した場合
  // 呼び出し元も名前付きが強要される
  func sayHello2(#name: String, #age: Int) -> String {
    return "\(name) hello! \(age)"
  }
  println(sayHello2(name: "soplana", age: 29)) // => sayHello2("soplana", 29)はerror

  // デフォルト引数
  func sayHello3(name: String, age: Int = 30) -> String {
    return "\(name) hello! \(age)"
  }
  println(sayHello3("soplana"))

  // 可変の引数
  func count(nums: Int...) {
    for num in nums {
      println(num)
    }
  }
  count(1,2,3,4,5,6)

  // 関数の引数に、関数を渡す
  func evenOrOddNumberCount(numbers: [Int], condition: Int -> Bool){
    for num in numbers {
      if condition(num) {
        println(num)
      }
    }
  }
  func evenNumber(number: Int) -> Bool {
    return number%2 == 0
  }
  evenOrOddNumberCount([1,2,3,4,5,6], evenNumber)
}
lessonFunction()



// ****************************
// Optionalについて
// ****************************
func lessonOptional(){
  lesson("lessonOptional")

  // ?はオプショナル（nilを許容する）型
  var optionalInt: Int?
  println(optionalInt)
  optionalInt = nil
  println(optionalInt)

  // ?がないとエラーになる
  //var nomalInt: Int
  //println(nomalInt)

  // IntとOptionalIntは異なる型なので
  // アンラップする必要がある（キャスト？）
  func inc(i: Int) -> Int{
    return i + 1
  }
  var nomalInt:    Int
  nomalInt    = 1
  optionalInt = 1
  println(inc(nomalInt))
  // not unwrappedになるので!をつけてラップする
  //println(inc(optionalInt))
  println(inc(optionalInt!))
}
lessonOptional()



// ****************************
// tupleについて
// ****************************
func tupleOptional(){
  lesson("tupleOptional")

  // tupleを使うと別のオブジェクトをまとめて扱える
  var tuple1 = (100, "hoge")
  println(tuple1.0)
  println(tuple1.1)

  // 名前を付けられる
  var tuple2 = (first: 200, second: "fuga", third: "piyo")
  println(tuple2.first)
  println(tuple2.second)
  println(tuple2.third)

  // 代入に使える
  // 不必要な要素は_
  var (first, _, third) = tuple2
  println(first)
  println(third)

  // 単一のtupleには名前を付けられない
  var tuple3 = (a: 1)
  println(tuple3) // => 1が返る。tuple3.aはerror

  // tupleを関数の引数に使う
  // varで宣言したtupleは引数には使用できないっぽい
  func humanInfo(name: String, age: Int) {
    println("\(name) is a \(age) year old")
  }
  let tuple4 = ("soplana", 29)
  humanInfo(tuple4)

  // 名前付き引数で関数を定義した場合
  // 引数に渡すtupleも名前付きで定義する必要がある
  // tupleの順番や, 要素の数が違う場合error
  func humanInfo2(#name: String, #age: Int) {
    println("\(name) is a \(age) year old")
  }
  let tuple5 = (name: "soplana", age: 29)
  humanInfo2(tuple5)
}
tupleOptional()



// ****************************
// クロージャについて
// ****************************
func closureOptional(){
  lesson("closureOptional")

  var numbers = [1,2,3,4,5,6]

  // { (…) -> … in … return … } の形式
  var _numbers1 = numbers.map({
    (number: Int) -> Int in
      let i = number * 100
      return i
  })
  println(_numbers1)

  // 型推論を使って(number: Int) -> Intを省略
  println(numbers.map({ num in num * 10 }))

  // プレースホルダをつかって更に省略
  println(numbers.map({ $0 * 10 }))

  // 関数の引数に、クロージャを渡す
  func evenOrOddNumberCount(numbers: [Int], condition: Int -> Bool){
    for num in numbers {
      if condition(num) {
        println(num)
      }
    }
  }
  evenOrOddNumberCount([1,2,3,4,5,6], {
    (number: Int) -> Bool in
      return number%2 == 0
  })

  // 引数をとらないクロージャ
  func sampleFunc(p: () -> Void){
    p()
  }
  sampleFunc({ println("hogehoge") })

  // 後置記法を使い()の省略が可能
  sampleFunc { println("hogehoge") }

  evenOrOddNumberCount([7,8,9,10,11,12]) {
    (number: Int) -> Bool in
      return number%2 == 0
  }
}
closureOptional()
