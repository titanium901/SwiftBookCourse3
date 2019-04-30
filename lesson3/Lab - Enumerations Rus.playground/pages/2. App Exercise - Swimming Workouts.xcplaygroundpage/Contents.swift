/*:
 ## Упражнение для приложения - тренировки по плаванию
 
>Эти упражнения закрепляют понимание Swift в контексте фитнес-приложения.
 
 В предыдущих заданиях мы обсуждали возможность для вашего фитнес-приложения отслеживать тренировки по плаванию.  Создайте ниже структуру `SwimmingWorkout` со свойствами `distance` (дистанция), `time` (время) и `stroke` (стиль).  `distance` и `time` должны быть типа `Double` и представлять дистанцию в метрах и время в секундах, а `stroke` должен быть типа `String`.
 */
struct SwimmingWorkout {
    let distance: Double
    let time: Double
    let stroke: Stroke
    
    enum Stroke {
        case freestyle
        case butterfly
        case backstroke
        case breaststroke
    }
    
    static var freestyleWorkouts: [SwimmingWorkout] = []
    static var butterflyWorkouts: [SwimmingWorkout] = []
    static var backstrokeWorkouts: [SwimmingWorkout] = []
    static var breaststrokeWorkouts: [SwimmingWorkout] = []
    
}

/*:
 Использование для `stroke` типа `String` не совсем безопасно.  Создайте перечисление `Stroke` внутри структуры `SwimmingWorkout`.  Перечисление должно иметь опции `freestyle` (вольный стиль), `butterfly` (баттерфляй), `backstroke` (на спине) и `breaststroke` (брасс).  Измените тип `stroke` со `String` на `Stroke`.  Создайте два экземпляра объектов `SwimmingWorkout`.
 */
let swimTr = SwimmingWorkout(distance: 1000, time: 60_000, stroke: .backstroke)
let swimTrTwo = SwimmingWorkout(distance: 500, time: 10_000, stroke: .butterfly)

/*:
 Вам нужно заносить в журнал тренировки по плаванию отдельно по каждому виду плавания.  Для этого можно использовать статические массивы внутри типа `SwimmingWorkout`.  Определите четыре переменные типа с именами `freestyleWorkouts` (тренировки вольным стилем), `butterflyWorkouts` (тренировки баттерфляем), `backstrokeWorkouts` (тренировки на спине) и `breaststrokeWorkouts` (тренировки брассом) внутри структуры `SwimmingWorkout`.  Каждое свойство должно быть типа `[SwimmingWorkout]` и по умолчанию должно содержать пустой массив.
 */


/*:
 Добавьте метод в `SwimmingWorkout` под названием `save()`, не принимающий аргументов и не возвращающий значение.  Этот метод добавит свой экземпляр в один из массивов внутри типа `SwimmingWorkout`, соответствующий стилю плавания.  Внутри метода `save()` используйте оператор switch для проверки содержимого свойства `stroke`, и добавьте `self` в нужный массив.  Вызовите save для двух экземпляров `SwimmingWorkout`, которые вы создали ранее, и распечатайте содержимое массивов, чтобы убедиться, что ваш метод `save` работает правильно.
 */
extension SwimmingWorkout {
    func save() {
        switch stroke {
        case .backstroke:
            print("1")
            SwimmingWorkout.backstrokeWorkouts.append(self)
        case .breaststroke:
            print("2")
            SwimmingWorkout.breaststrokeWorkouts.append(self)
        case .butterfly:
            print("3")
            SwimmingWorkout.butterflyWorkouts.append(self)
        case .freestyle:
            print("4")
            SwimmingWorkout.freestyleWorkouts.append(self)
        }
    }
}

swimTr.save()
swimTrTwo.save()
print(SwimmingWorkout.backstrokeWorkouts)
print(SwimmingWorkout.breaststrokeWorkouts)
print(SwimmingWorkout.butterflyWorkouts)
print(SwimmingWorkout.freestyleWorkouts)

/*:
 
 _Copyright © 2017 Apple Inc._
 
 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_
 
 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._
 
 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 */
//: [Ранее](@previous)  |  страница 2 из 2
