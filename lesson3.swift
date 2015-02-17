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
  // [x...y]というシンタックスのみ許可されてるっぽい
  // rubyみたいに[x..y]という指定はできず
  var b = a[1...2]
  println(a)        // aのarrayには変更はない
  println(b)        // [2, 3]
  println(a[0...4]) // [10, 2, 3, 4, 5]

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

  // 要素数と初期値を宣言したinit
  var e = Array(count: 3, repeatedValue: 1)
  println(e) // [1, 1, 1]

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
}
arrayFunction()
