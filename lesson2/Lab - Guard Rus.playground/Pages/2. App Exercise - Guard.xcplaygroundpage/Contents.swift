import UIKit
/*:
 ## Упражнение для приложения - оператор guard
 
 >Эти упражнения закрепляют понимание Swift в контексте фитнес-приложения.
 
 В упражнении с опционалами вы создали проваливающийся конструктор для структуры `Workout`, инициализирующий объект типа `Workout` только в том случае, если значения `startTime` и `endTime` отличались друг от друга более, чем на 10 секунд.  Теперь создайте такой же проваливающийся инициализатор с использованием оператора guard, который проверит, что времена начала и окончания находятся не рядом.
 
 Как и в прошлый раз, создайте структуру `Workout` (разминка) со свойствами `startTime` (время начала) и `endTime` (время окончания) типа `Double`.  Вы будете использовать `Double` для представления количества секунд с полуночи, то есть 28800 будет означать 28 800 секунд, что соответствует ровно 8 часам, то есть начало разминки — 8 утра.
 
 Напишите проваливающийся инициализатор, который в качестве параметров принимает время начала и окончания разминки, а затем проверяет, не отстоят ли они друг от друга ближе, чем 10 секунд.  Если это так, ваш инициализатор должен провалиться.  В противном случае, он должен выставить нужные свойства.
 */
struct Workout {
    let startTime: Double
    let endTime: Double
    
    init?(startTime: Double, endTime: Double) {
        guard (endTime - startTime) > 10 else { return nil }
        self.startTime = startTime
        self.endTime = endTime
    }
}

let workoutOne = Workout(startTime: 10_000, endTime: 30_000)
let workoutTwo = Workout(startTime: 10_000, endTime: 10_010)

/*:
 Вы программируете экран отслеживания съеденной еды, где пользователь вводит список поглощённых блюд.  Если пользователь нажимает на кнопку "сохранить" без ввода блюд, вы хотите попросить пользователя заполнить поля ввода.
 
 Используя структуру `Food` и текстовые поля, определённые в коде ниже, создайте функцию с именем `logFood`, которая не принимает параметров и возвращает опциональный объект типа `Food`.  Внутри тела функции используйте оператор guard, чтобы извлечь свойство `text` полей `foodTextField` и `caloriesTextField`.  Кроме извлечения значения `text` из `caloriesTextField`, вам нужно создать и извлечь ещё одну переменную, которая пытается получить `Int` из извлечённого значения `text`.  Если какое-либо извлечение не сработает, верните `nil`.  После оператора guard, создайте и верните объект типа `Food`.
 */
struct Food {
    var name: String
    var calories: Int
}

let foodTextField = UITextField()
let caloriesTextField = UITextField()

foodTextField.text = "Banana"
caloriesTextField.text = "23"

func logFood() -> Food? {
    guard let foodText = foodTextField.text, let caloriesText = caloriesTextField.text, let calories = Int(caloriesText) else { return nil }
    let newFood = Food(name: foodText, calories: calories)
    
    return newFood
}

let food = logFood()
if let food = food {
    print("name: \(food.name), calories: \(food.calories)")
} else {
    print("no food")
}
/*:
 Вызовите созданную вами функцию и сохраните возвращённое ей значение.  Извлеките объект типа `Food` стандартной процедурой привязки опционалов и напечатайте предложение о поглощённой еде, используя полученные свойства.  Попробуйте поменять текст в `caloriesTextField` на строку, которая не может быть конвертирована в число.  Что произойдёт в данном случае?
 */
caloriesTextField.text = "54cal"
let foodTwo = logFood()
print(foodTwo?.calories ?? "nil = no food ")
/*:
 
 _Copyright © 2017 Apple Inc._
 
 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_
 
 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._
 
 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 */
//: [Ранее](@previous)  |  страница 2 из 2
