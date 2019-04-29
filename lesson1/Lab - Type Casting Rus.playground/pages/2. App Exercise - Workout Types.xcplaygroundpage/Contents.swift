/*:
 ## Упражнение для приложения - типы тренировок
 
 >Эти упражнения закрепляют понимание Swift в контексте фитнес-приложения.
 
 Ваше приложение позволяет отслеживать разные типы тренировок.  При проектировании приложения вы решили создать базовый клас `Workout`, от которого будут наследовать все остальные классы с разными типами тренировок.  Ниже определены три класса. `Workout` — базовый класс со свойствами `time` (время) и `distance` (дистанция), а `Run` (бег) и `Swim` (плавание) — классы-наследники, добавляющие специфичные свойства классу `Workout`.
 
 Также определён массив `workouts` (тренировки), представляющий собой журнал предыдущих тренировок.  Вы используете классы и массив для упражнений ниже.
 */
class Workout {             // тренировка
    let time: Double        // время
    let distance: Double    // дистанция
    
    init(time: Double, distance: Double) {
        self.time = time
        self.distance = distance
    }
}

class Run: Workout {    // бег
    let cadence: Double // темп
    
    init(cadence: Double, time: Double, distance: Double) {
        self.cadence = cadence
        super.init(time: time, distance: distance)
    }
}

class Swim: Workout {   // плавание
    let stroke: String  // стиль
    
    init(stroke: String, time: Double, distance: Double) {
        self.stroke = stroke
        super.init(time: time, distance: distance)
    }
}

var workouts: [Workout] = [
    Run(cadence: 80, time: 1200, distance: 4000),
    Swim(stroke: "вольный стиль", time: 32.1, distance: 50),
    Swim(stroke: "баттерфляй", time: 36.8, distance: 50),
    Swim(stroke: "вольный стиль", time: 523.6, distance: 500),
    Run(cadence: 90, time: 358.9, distance: 1600)
]
/*:
 
 Напишите функции `describeRun(runningWorkout:)` и `describeSwim(swimmingWorkout:)`, принимающие объекты типа`Run` и `Swim` соответственно.  Ни одна не должна возвращать значений.  Каждая функция должна вывести описание тренировки, включая темп бега, либо стиль плавания.  Время представлено в секундах, расстояние — в метрах, темп — в шагах в минуту.
 */
func describeRun(runningWorkout: Run) {
    print("---Running workout---")
    print("""
        расстояние: \(runningWorkout.distance) метров
        темп: \(runningWorkout.cadence)
        время: \(runningWorkout.time)
        """)
}

describeRun(runningWorkout: workouts[0] as! Run)

func describeSwim(swimmingWorkout: Swim) {
    print("---Swimming workout---")
    print("""
        расстояние: \(swimmingWorkout.distance) метров
        стиль: \(swimmingWorkout.stroke)
        время: \(swimmingWorkout.time)
        """)
}
print("")

describeSwim(swimmingWorkout: workouts[1] as! Swim)
/*:
 Переберите все тренировки в массиве `workouts` и, с помощью приведения типов, вызовите либо `describeRun(runningWorkout:)`, либо `describeSwim(swimmingWorkout:)` для каждого.  Обратите внимание, что будет выведено в консоль.
 */
for workout in workouts {
    if let runWorkout = workout as? Run {
        describeRun(runningWorkout: runWorkout)
    } else if let swimWorkout = workout as? Swim {
        describeSwim(swimmingWorkout: swimWorkout)
    }
}

/*:
 
 _Copyright © 2017 Apple Inc._
 
 _Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:_
 
 _The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software._
 
 _THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE._
 */
//: [Ранее](@previous)  |  страница 2 из 2
