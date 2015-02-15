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

  monsterB.damage = 3000
  println(monsterB.description())
}
classFunction()
