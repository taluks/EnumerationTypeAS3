package
{
	import flash.display.Sprite;
	
	import enum.Enumeration;
	import enum.UintEnumeration;
	import enum.UnitType;
	
	public class Main extends Sprite
	{
		public function Main()
		{
			new TestEnum();			
			
			var types:Vector.<Enumeration> = Enumeration.getElementsList(UnitType);
			trace("\nAll types:")
			for(var i:int = 0; i < types.length; i++)
			{
				trace("type[", i, "]=", (types[i] as UintEnumeration).value);
			}
			
			var typeForTest:uint = 2;
			var testUnitType:UnitType = Enumeration.getElementByValue(2, UnitType) as UnitType;
			trace("Get enum buy value =",typeForTest,":", testUnitType + ".value = " + testUnitType.value);
		}
	}
}