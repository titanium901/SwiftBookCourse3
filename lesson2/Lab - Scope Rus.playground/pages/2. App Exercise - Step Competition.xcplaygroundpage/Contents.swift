/*:
 ## Упражнение для приложения - соревнование
 
 >Эти упражнения закрепляют понимание Swift в контексте фитнес-приложения.
 
 Ниже определена структура `User` и три экземпляра типа `User`.  Далее они будут использоваться в упражнении для имитации соревнований в приложении.
 */
struct User {
    var name: String
    var stepsToday: Int
}

let stepMaster = User(name: "Мастер шагов", stepsToday: 8394)
let activeSitter = User(name: "Яростный бегун", stepsToday: 9132)
let monsterWalker = User(name: "Монстр-пешеход", stepsToday: 7193)

let competitors = [stepMaster, activeSitter, monsterWalker]
/*:
 Функция ниже получает массив объектов типа `User` и возвращает того из них, кто прошёл больше всех шагов.  В теле функции сначала объявляется опциональная переменная типа `User?`, затем циклом проходятся все пользователи в массиве.  На каждой итерации цикла проверяется, содержит или нет значение переменная `topCompetitor`.  Если `topCompetitor` не содержит значение, то текущий пользователь итерации получает максимальное количество очков и становится `topCompetitor`.  Если значение у `topCompetitor` есть, оно сравнивается с текущим пользователем и, если у того больше шагов, он должен стать `topCompetitor`.
 
 Далее мы пытаемся присвоить пользователя с максимальным количеством шагов переменной `topCompetitor`.  Однако, из-за неправильного затенения переменных компилятор выдаёт ошибку — оригинальная переменная `topCompetitor` не доступна там, где мы хотим обновить её значение.  Исправьте ошибку и вызовите `getWinner(competitors:)`, передав в качестве параметра массив `competitors`.  Напечатайте содержимое свойства `name` возвращённого объекта `User`.  Если вы всё сделали правильно, то функция должна вернуть пользователя с именем `Яростный бегун`.
 */
func getWinner(competitors: [User]) -> User? {
    var topCompetitor: User?
    
    for competitor in competitors {
        if let mayBeTopCompetitor = topCompetitor {
            if competitor.stepsToday > mayBeTopCompetitor.stepsToday {
                topCompetitor = competitor
            }
        } else {
            topCompetitor = competitor
            
        }
    }
    return topCompetitor
}
let newComp = getWinner(competitors: competitors)
print(newComp?.name)
/*:
 Напишите поэлементный конструктор структуры `User`, который использует затенение переменных для именования своих параметров.
 */
//struct User {
//    var name: String
//    var stepsToday: Int
//
//    init(name: String, stepsToday: Int) {
//        self.name = name
//        self.stepsToday = stepsToday
//    }
//}

/*:
 Теперь создайте проваливающийся инициализатор для структуры `User`, который в качестве параметров принимает `name` и `stepsToday` с опциональными типами `String?` и `Int?` соответственно.  Конструктор должен вернуть `nil`, если хотя бы один из входных параметров равен `nil`.  Используйте затенение переменных при извлечении обоих параметров.
 */
extension User {
    
    init?(name: String?, stepsToday: Int?) {
        guard let name = name, let stepsToday = stepsToday else { return nil }
        self.name = name
        self.stepsToday = stepsToday
    }
}

let userOne = User(name: "Oleg", stepsToday: 1000)
print(userOne)

let userTwo = User(name: nil, stepsToday: 10001)
print(userTwo)
  
/*:
 
 _Copyright © 2017 Apple Inc._
 
 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_
 
 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._
 
 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 */
//: [Ранее](@previous)  |  страница 2 из 2
