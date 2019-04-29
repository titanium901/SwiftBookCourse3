/*:
 ## Упражнение - проваливающиеся инициализаторы
 
 Создайте структуру `Computer` с двумя свойствами, `ram` и `yearManufactured`, оба — типа `Int`.  Создайте проваливающийся инициализатор, который создаст экземпляр типа `Computer`, только если `ram` больше 0, а `yearManufactured` — больше 1970 и меньше, чем 2019.
 */
struct Computer {
    var ram: Int
    var yearManufactured: Int
    
    init?(ram: Int, yearManufactured: Int) {
        if ram > 0 && yearManufactured > 1970 && yearManufactured < 2019 {
            self.ram = ram
            self.yearManufactured = yearManufactured
        } else {
            return nil
        }
    }
}

/*:
 Создайте два экземпляра типа `Computer?`, используя проваливающийся инициализатор.  Один экземпляр должен передать значения, которые приведут к созданию объекта, а при создании второго должен получиться `nil`.  Используйте синтаксис if-let, чтобы извлечь каждый из объектов типа `Computer?`, и напечатайте значения `ram` и `yearManufactured`, если объект их содержит.
 */
let comp = Computer(ram: 8, yearManufactured: 2011)
print(comp)

let comp2 = Computer(ram: 6, yearManufactured: 1900)
print(comp2)

//: [Ранее](@previous)  |  страница 5 из 6  |  [Далее: упражнение для приложения - разминка или nil](@next)
