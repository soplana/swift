func lesson(no: String) {
  println("")
  println("********** \(no) *************")
}



// ****************************
// classについて
// ****************************
func classFunction() {
  lesson("classFunction")

  // monster classを作成
  class Monster {
    // プロパティ
    var level: Int = 1
    var name: String?

    init(){}

    func description() -> String {
      if name == nil {
        return "不明 : Lv\(level)"
      } else {
        return "\(name!) : Lv\(level)"
      }
    }
  }
  var monster = Monster()
  monster.name = "おおきづち"
  println(monster.description())


  // *************** initializer ***************
  class MonsterA {
    // プロパティ
    var level: Int
    var name: String

    // イニシャライザ
    init(name: String, level: Int = 1){
      self.name  = name
      self.level = level
    }

    // デイニシャライザ
    deinit{}

    func description() -> String {
      return "\(name) : Lv\(level)"
    }

    func levelUp() {
      self.level += 1
    }
  }
  // 引数なしでインスタンス化することは出来ない
  let monsterA = MonsterA(name: "アトラス", level: 3)
  println(monsterA.description())

  // インスタンス変数を変更
  monsterA.levelUp()
  println(monsterA.description())


  // *************** 継承 ***************
  class Zombie : MonsterA {
    var type: String = "ゾンビ系"

    // overrideする場合はプレフィックスが必要
    // ないとerrorになる
    override func description() -> String {
      return "\(super.description()) (\(self.type))"
    }
  }
  let zombie = Zombie(name: "くさった死体", level: 10)
  println(zombie.description())
  zombie.levelUp()
  println(zombie.description())


  // *************** getter setter ***************
  class MonsterB : MonsterA {
    var currentDamage: Int = 0

    // set getキーワードで定義する
    var damage: Int {
      set(i) {
        self.currentDamage += i
      }
      get {
        return self.currentDamage
      }
    }

    var hitPoint: Int {
      get {
        return maxHitPoint() - damage
      }
    }

    func maxHitPoint() -> Int {
      return level * 120
    }

    override func description() -> String {
      return "\(super.description()) HP.\(self.hitPoint)/\(self.maxHitPoint())"
    }
  }

  let monsterB = MonsterB(name: "バズズ", level: 98)
  println(monsterB.description())

  monsterB.damage = 2090
  println(monsterB.description())

  // インスタンスの代入は参照渡し
  let monsterC = monsterB

  monsterB.damage = 3000
  println(monsterB.description())
  println(monsterC.description())
}
classFunction()



// ****************************
// 構造体について
// ****************************
func structFunction() {
  lesson("structFunction")

  struct Monster {
    // メンバ変数を宣言した順番で
    // メンバ変数を引数にもつinitializerが自動で生成される
    var name:  String
    var level: Int

    func description() -> String {
      return "\(name) : Lv\(level)"
    }
  }
  var monster  = Monster(name: "タコメット", level: 39)
  var monsterB = monster
  println(monster.description())

  // Structは参照渡しではないので
  // メンバ変数を変更してもmonsterBの値は変わらない
  // ちなみにletで宣言した構造体のプロパティには
  // 変更を加えることは出来ない
  monster.level = 40
  println(monster.description())
  println(monsterB.description())

  // SwiftのString, Array, Dictionaryは構造体を使って実装されている
}
structFunction()



// ****************************
// プロパティについて
// ****************************
lesson("propertyFunction")

struct Attack {
  var monster: Monster

  var str: Int {
    get {
      return monster.level * 10
    }
  }
  var mag: Int {
    get {
      return monster.level * 20
    }
  }

  func description() -> String {
    return "\(monster.description())\nSTR: \(self.str) MAG: \(self.mag)"
  }
}

class Monster {
  var name:  String

  // 読み取り専用のプロパティの宣言になるのかな？
  // get {} を省略することが出来る
  var dropItem: String {
    return "\(self.name) : バトルチョーカー"
  }

  // propertyの監視
  var level: Int {
    // propertyが変更される前に実行される
    // newValueで変更後の値を取得出来る(引数で名前を設定することも出来る)
    // self.levelは変更前の値を指す
    willSet {
      println("テレレレッテッテッテー！")
    }
    // propertyが変更された後に実行される
    // oldValueで変更後の値を取得出来る(引数で名前を設定することも出来る)
    // self.levelは変更前の後を指す
    didSet(beforeLevel) {
      println("level Up : \(beforeLevel) -> \(self.level)")
    }
  }

  // propertyの遅延評価
  // 参照されるまでattackを評価しない
  lazy var attack: Attack = {
    // selfに対する循環参照を防ぐためにunownedで
    // selfへの参照を持たないように宣言する
    [unowned self] in
    return Attack(monster: self)
  }()

  init(name: String, level: Int = 1){
    self.name  = name
    self.level = level
  }

  func description() -> String {
    return "\(name) : Lv\(level)"
  }

  func levelUp() {
    self.level += 1
  }
}
var monster = Monster(name: "アトラス", level: 3)
// ↑この時点では, attackはnil（なの？）

println(monster.attack.description())
monster.levelUp()
println(monster.attack.description())
println(monster.dropItem)
