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
