func lesson(no: String) {
  println("")
  println("********** \(no) *************")
}



// ****************************
// Arrayについて
// ****************************
func arrayFunction() {
  lesson("arrayFunction")

  // []シンタックスで宣言
  var a = [1,2,3,4,5,6,7,8,9]
  println(a)

  // 要素を変更
  // letで宣言している場合は要素の変更は出来ない
  a[0] = 10
  println(a)

  // レンジを指定して切り出す
  // [x...y]ならyを含む
  // [x..<y]ならyを含まず
  // rubyみたいに[x..y]という指定はできず
  var b = a[1...2]
  println(a)        // aのarrayには変更はない
  println(b)        // [2, 3]
  println(a[0...4]) // [10, 2, 3, 4, 5]
  println(a[0..<4]) // [10, 2, 3, 4]

  // レンジを指定して要素を入れ替える
  a[1...2] = [20, 30]
  println(a)        // [10, 20, 30, 4, 5, 6, 7, 8, 9]

  a[1...2] = [1, 1, 1, 1]
  println(a)        // [10, 1, 1, 1, 1, 4, 5, 6, 7, 8, 9]

  // 型を指定してた宣言
  // 指定しなくてもStringやIntといった別の型を持ったオブジェクトは
  // 同じ配列の中には入れることが出来ない
  var c = Array<Int>()
  var d = [Int]()
  var dd: [Int] = [1,2]

  // 要素数と初期値を宣言したinit
  var e = Array(count: 3, repeatedValue: 1)
  println(e) // [1, 1, 1]

  // Anyを指定したらなんでも入れられるっぽい
  var any = [Any]()
  any = [1, "2", 3, "4", [5]]
  var any2: [Any] = [1,2,"3"]

  // append
  // letで宣言されている場合はappendできない
  e.append(2)
  println(e) // [1, 1, 1, 2]

  // insert
  e.insert(10, atIndex: 3)
  println(e) // [1, 1, 1, 10, 2]

  // 存在しないindexを指定するとヤバそうなerrorになる
  // e.insert(10, atIndex: 100) -> error: Array index out of range

  // removeAtIndex
  var atIndex = e.removeAtIndex(0)
  println(e)       // [1, 1, 10, 2]
  println(atIndex) // 1

  // removeLast
  var lastIndex = e.removeLast()
  println(e)         // [1, 1, 10, 2]
  println(lastIndex) // 2

  // removeAll
  e.removeAll()
  println(e) // []

  var f = [1,2,3,4,5,6,7,8,9]

  // count
  println(f.count) // 9

  // isEmpty
  println(f.isEmpty) // false

  // capacity
  println(f.capacity) // 10

  // sorted
  // レシーバを破壊的に変更しないで、結果を返り値として返す
  var beforeSort   = [1,5,3,9,7,4,2,6,8]
  var sortedArrayA = beforeSort.sorted {
    (a: Int, b: Int) -> Bool in
    return a < b
  }
  println(sortedArrayA) // [1, 2, 3, 4, 5, 6, 7, 8, 9]
  // sortedはオブジェクトに破壊的変更を加えない
  println(beforeSort)   // [1,5,3,9,7,4,2,6,8]
  var beforeSort2 = [3,2,1]
  beforeSort2.sort(<)
  // sortはオブジェクトに破壊的変更を加える
  println(beforeSort2)   // [1,2,3]

  // sort/sorted関数を使ってもよい
  // &が何か分からないけど、beforeSortの値が破壊的に変更されてないので
  // rubyのdup的な動作をしてくれるシンタックスか？
  println( sort(&beforeSort) )

  // 型推論を使った省略形
  var sortedArrayB = beforeSort.sorted {a,b in a<b}
  println(sortedArrayB) // [1, 2, 3, 4, 5, 6, 7, 8, 9]

  // プレースホルダを使った省略形
  var sortedArrayC = beforeSort.sorted {$0 < $1}
  println(sortedArrayC) // [1, 2, 3, 4, 5, 6, 7, 8, 9]

  // Operator Functionsを使ってOperatorだけを引数に渡す
  // これは頭おかしい...
  var sortedArrayD = beforeSort.sorted(<)
  println(sortedArrayD) // [1, 2, 3, 4, 5, 6, 7, 8, 9]

  // reverse
  println(sortedArrayD.reverse()) // [9, 8, 7, 6, 5, 4, 3, 2, 1]

  // filter
  println(sortedArrayD.filter({ $0%2 == 0 })) // [2, 4, 6, 8]

  // map
  println(sortedArrayD.map({ $0*10 })) // [10, 20, 30, 40, 50, 60, 70, 80, 90]

  // reduce
  println(sortedArrayD.reduce(0) {$0 + $1}) // 45
  println(sortedArrayD.reduce(0, +))        // 45

  // +=と+ Operators
  var g = [1,2,3],
      h = [4,5,6]
  println(g + h) // [1, 2, 3, 4, 5, 6]
  println(g)     // [1, 2, 3]
  g += h
  println(g)     // [1, 2, 3, 4, 5, 6]
}
arrayFunction()



// ****************************
// Dictionaryについて
// ****************************
func dictionaryFunction() {
  lesson("dictionaryFunction")

  // Arrayに似てる
  var dic = [String: Int]()
  println(dic)
  dic["hoge"] = 1
  println(dic["hoge"]) // Optional(1) なんでもoptionalやな

  var dic1 = ["hoge": 1, "fuga": 2]
  println(dic1)
  println(dic1["hoge"])  // Optional(1)
  println(dic1["hoge"]!) // 1

  // nilを代入するとkeyごと消える。nilを値に持つことは出来ないみたい
  dic1["fuga"] = nil
  println(dic1) // [hoge: 1]


  var dic2 = ["a": 1, "b": 2, "c": 3]
  var oldvalue1 = dic2.updateValue(44, forKey: "a")
  println(dic2) // [b: 2, a: 44, c: 3]
  println(oldvalue1!) // 1


  var oldvalue2 = dic2.removeValueForKey("a")
  println(dic2) // [b: 2, c: 3]
  println(oldvalue2!) // 44


  var oldvalue3: Any = dic2.removeAll()
  println(dic2) // [b: 2, c: 3]
  println(oldvalue3) // () なんやこれ


  var dic3 = ["a": 1, "b": 2, "c": 3]
  println(dic3.count)         // 3
  println(Array(dic3.keys))   //  [b, a, c]
  println(Array(dic3.values)) //  [2, 1, 3]

  // ==演算子はオブジェクトIDの比較ではなく、値の比較っぽい
  var dic4 = ["a": 1, "b": 2, "c": 3]
  println( dic3 == dic4 ) // true
  println( dic3 != dic4 ) // false

  println( dic2 == dic4 ) // false
  println( dic2 != dic4 ) // true
}
dictionaryFunction()
