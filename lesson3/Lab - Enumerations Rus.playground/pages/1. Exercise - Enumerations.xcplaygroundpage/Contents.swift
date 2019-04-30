/*:
 ## Упражнение - перечисления
 
 Определите перечисление `Suit` (масть) с четырьмя возможными вариантами: `clubs` (трефы), `spades` (пики), `diamonds` (бубны), and `hearts` (черви).
 */
enum Suit {
    case clubs, spades, diamonds, hearts
}

/*:
 Вы должны выбрать карту и запомнить её масть.  Создайте экземпляр переменной типа `Suit` с именем `cardInHand` и присвойте ей значение `hearts`.  Распечатайте переменную.
 */
var cardInHand: Suit = .hearts
print(cardInHand)
/*:
 Теперь вам нужно положить карту обратно и выбрать другую.  Измените значение переменной на пики вместо червей.
 */
cardInHand = .spades
print(cardInHand)
/*:
 Вы пишете приложение, которое отображает шуточные предсказания (например, «Скоро вы найдёте то, что ищите»), в зависимости от выпавших карт.  Напишите функцию `getFortune(cardSuit:)`, которая принимает параметр типа `Suit`.  Внутри тела функции используйте оператор switch для определения значения `cardSuit`.  Выводите разные предсказания для разных значений типа `Suit`.  Вызовите функцию несколько раз, каждый раз передавая ей разные значения `cardSuit`.
 */
func getFortune(cardSuit: Suit) {
    switch cardSuit {
    case .clubs:
        print("Жди к получке прибавленья, иль в семействе пополненья!")
    case .diamonds:
        print("Спонсор найдется, судьба улыбнется, если чулок там, где нужно порвется.")
    case .hearts:
        print("Задуманное случится, если включить устаревший кран в обновленной квартире: найди крашеную дверь.")
    case .spades:
        print("Когда закроется старая страничка, жди новостей от старинных друзей: удивительных и бодрящих")
    }
}
getFortune(cardSuit: cardInHand)
getFortune(cardSuit: .diamonds)
/*:
 Создайте структуру `Card` (карта) ниже.  У неё должно быть два свойства, одно для масти (`suit`) типа `Suit`, другое — для значения (`value`) типа `Int`.
 */
//struct Card {
//    let suit: Suit
//    let value: Int
//}

/*:
 Как много значений могут иметь игральные карты?  Как много значений может быть у `Int`?  Будет безопаснее использовать перечисление не только для масти, но и для значения карты.  Внутри структуры создайте перечисление `Value`.  Это перечисление должно содержать опции для `ace` (туз), `two` (2), `three` (3), `four` (4), `five` (5), `six` (6), `seven` (7), `eight` (8), `nine` (9), `ten` (10), `jack` (валет), `queen` (дама), `king` (король).  Поменяйте тип `value` с `Int` на `Value`.  Инициализируйте два объекта типа `Card` и выведите сообщение для каждого, описывающее значение карты и её масть.
 */
//extension Card {
//    enum Value {
//        case ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
//    }
//}

struct Card {
    let suit: Suit
    let value: Value
    enum Value {
        case ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
    }
}

let card = Card(suit: .clubs, value: .king)
print(card)
let cardTwo = Card(suit: .diamonds, value: .ace)
print(cardTwo)
//: страница 1 из 2  |  [Далее: упражнение для приложения - тренировки по плаванию](@next)

