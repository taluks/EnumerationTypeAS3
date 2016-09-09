# EnumerationTypeAS3

Написать на ActionScript перечисляемый тип и объяснить, почему это хорошо.
Реализуется классами Enumeration, IntEnumeration, UintEnumeration, StringEnumeration.

	public class UintEnumeration extends Enumeration
	{
		public var value:uint;
	}

	public class UnitType extends UintEnumeration
	{
		public static const HERO:UnitType = 		new UnitType(1);
		public static const WARRIOR:UnitType = 		new UnitType(2);
		public static const MAGE:UnitType = 		new UnitType(3);
		
		public static const ENEMY:UnitType = 		new UnitType(4);
		
		
		
		public function UnitType(val:uint)
		{
			value = val;
		}
	}

Ничего больше в классах UintEnumeration и UnitType быть не должно.

Все значения перечисляемого типа могут быть объявлены его статическими константами и только ими.
Если это не так - проект падает сразу после компиляции или содержит варнинги.

Есть метод function getElementsList(enumerationClass:Class):Vector.<Enumeration> - отдает все значения перечисления.
Есть метод getElementByValue(value:*, enumClass:Class):Enumeration - отдает элемент перечисления по значению.