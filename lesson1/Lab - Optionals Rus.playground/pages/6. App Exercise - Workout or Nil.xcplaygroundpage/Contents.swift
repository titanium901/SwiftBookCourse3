/*:
 ## Упражнение для приложения - разминка или nil
 
  >Эти упражнения закрепляют понимание Swift в контексте фитнес-приложения.
 
 Вы когда-нибудь случайно нажимали кнопку в приложении?  Это происходит часто.  В вашем фитнес-приложении, в случае, если пользователь случайно нажмёт кнопку начала разминки, а затем её закончит в течение 10 секунд, то разминка не будет создаваться и записываться.  В противном случае, пользователю нужно будет удалить разминку вручную.
 
 Создайте структуру `Workout` (разминка) со свойствами `startTime` (время начала) и `endTime` (время окончания) типа `Double`.  С датами работать сложно, поэтому вы будете использовать `Double` для представления количества секунд с полуночи, то есть 28800 будет означать 28 800 секунд, что соответствует ровно 8 часам, то есть начало разминки — 8 утра.
 
 Напишите проваливающийся инициализатор, который в качестве параметров принимает время начала и окончания разминки, а затем проверяет, не отстоят ли они друг от друга ближе, чем 10 секунд.  Если это так, ваш инициализатор должен провалиться.  В противном случае, он должен выставить нужные свойства.
 */
struct Workout {
    var startTime: Double
    var endTime: Double
    
    init?(startTime: Double, endTime: Double) {
        if (endTime - startTime) > 10 {
            self.startTime = startTime
            self.endTime = endTime
        } else {
            return nil
        }
    }
}

/*:
 Инициализируйте два экземпляра объекта `Workout` и напечатайте каждый из них.  Один из них не должен инициализироваться, так как время начала и конца будут слишком близки друг к другу.  Другой должен успешно создать объект типа `Workout`.
 */
let workOut = Workout(startTime: 28_800, endTime: 30_000)
print(workOut)
let workOut2 = Workout(startTime: 28_800, endTime: 28_806)
print(workOut2)

/*:
 
 _Copyright © 2017 Apple Inc._
 
 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_
 
 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._
 
 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 */
//: [Ранее](@previous)  |  страница 6 из 6
