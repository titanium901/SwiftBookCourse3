/*:
 ## Упражнение - приведение типов и их контроль
 
 Создайте коллекцию типа [Any], включающую несколько вещественных чисел, целых, строк и булевых значений.  Распечатайте содержимое коллекции.
 */
let anyArray: [Any] = [1, 2, 5, "Iury", "Limon", true, 2.5, 28.9]
print(anyArray)

/*:
 Пройдите по всем элементам коллекции.  Для каждого целого, напечайте "Целое число " и его значение.  Повторите то же самое для вещественных чисел, строк и булевых значений.
 */
for item in anyArray {
    if item is Int {
        print("Int: \(item)")
    } else if item is String {
        print("String: \(item)")
    } else if item is Bool {
        print("Bool: \(item)")
    } else if item is Double {
        print("Double: \(item)")
    }
}

/*:
 Создайте словарь [String : Any], где все значения — это смесь вещественных и целых чисел, строк и булевых значений.  Выведите пары ключ/значения для всех элементов коллекции.
 */
let dictAny: [String: Any] = ["One": 15.0, "Two": true, "Three": "Ommmm", "Four": 10]
for (key, value) in dictAny {
    print(key, value)
}

/*:
 Создайте переменную `total` типа `Double`, равную 0.  Переберите все значения словаря, и добавьте значение каждого целого и вещественного числа к значению вашей переменной.  Для каждой строки добавьте 1.  Для каждого булева значения, добавьте 2, в случае, если значение равно `true`, либо вычтите 3, если оно `false`.  Напечатайте значение `total`.
 */
var total: Double = 0
for (_, i) in dictAny {
    if let intValue = i as? Int {
        total += Double(intValue)
    } else if let doubleValue = i as? Double {
        total += doubleValue
    } else if let strValue = i as? String {
        total += 1
    } else if let boolValue = i as? Bool {
        total += boolValue ? 2 : -3
    }
}

print(total)

/*:
 Создайте переменную `total2` типа `Double`, и установите её равной 0.  Снова пройдите по всей коллекции, складывая все целые и вещественные числа.  Для каждой строки, встретившейся на пути, попробуйте сконвертировать её в число, и добавьте это значение к общему.  Игнорируйте булевы значения.  Распечатайте итог.
 */
var total2: Double = 0
for (_, i) in dictAny {
    if let intValue = i as? Int {
        total2 += Double(intValue)
    } else if let doubleValue = i as? Double {
        total2 += doubleValue
    } else if let strValue = i as? String, let doubleFromStr = Double(strValue) {
        total2 += doubleFromStr
    }
}

print(total2)
//: страница 1 из 2  |  [Далее: упражнение для приложения - типы тренировок](@next)
