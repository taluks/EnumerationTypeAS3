package enum
{
	import flash.system.System;
	import flash.utils.Dictionary;
	import flash.utils.describeType;
	import flash.utils.getQualifiedClassName;
	
	public class Enumeration
	{
		private static const dictionaryInstances:Dictionary = new Dictionary();		
		public function Enumeration()
		{
			var classConstructor:Class = this["constructor"];
			if(!dictionaryInstances[classConstructor])
			{
				CONFIG::debugging
					{
						var className:String = getQualifiedClassName(this);
						if(className == getQualifiedClassName(Enumeration))
							throw new ArgumentError("Enumeration class cannot be instantiated.");
						
						var describeXML:XML = describeType(classConstructor);
						var list:XMLList = describeXML.factory.variable.(@name != "value");
						if(list.length()) 
						{
							var variables:String = new String();
							for each(var item:XML in list)
							variables += "\n"+item.@name;
							trace("Warning!!! Class \"" + className + "\" has variables:"+ variables);
						}	 
						list = describeXML.factory.constant;
						if(list.length()) 
						{			
							var constants:String = new String();
							for each(item in list)
							constants += "\n"+item.@name;
							trace("Warning!!! Class \"" + className + "\" has  not static constants:" + constants);
						}
						
						System.disposeXML(describeXML);
					}
				dictionaryInstances[classConstructor] = new <Enumeration>[this];
				
			}else
			{
				dictionaryInstances[classConstructor].push(this);
			}
			
		}
		public static function getElementsList(enumerationClass:Class):Vector.<Enumeration>
		{
			return dictionaryInstances[enumerationClass];
		}
		public static function getElementByValue(value:*, enumClass:Class):Enumeration
		{
			var vectorEnumeration:Vector.<Enumeration> = dictionaryInstances[enumClass];
			if(!vectorEnumeration) return null;
			for(var i:int = 0, n:int = vectorEnumeration.length; i < n; i++)
			{
				if(vectorEnumeration[i].value == value)
				{
					return vectorEnumeration[i];
				}
			}
			return null;	
		}
	}
}