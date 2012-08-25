﻿/////////////////////////////////////////////////////////
//  
//  用于处理常用的数组的操作(排序, 查找)
//  
////////////////////////////////////////////////////////

package cn.geckos.utils
{
public final class ArrayUtil
{
	/**
	 * 
	 * @param	ary
	 * @return
	 * 执行冒泡排序
	 * 算法参考 -- http://www.hiahia.org/datastructure/paixu/paixu8.3.1.1-1.htm
	 */
	public static function bubbleSort (ary:Array):void
	{
		var isExchange:Boolean = false;
		for (var i:int = 0; i < ary.length; i++)
		{
			isExchange = false;
			for (var j:int = ary.length - 1; j > i; j--)
			{
				if (ary[j] < ary[j - 1])
				{
					var temp:Number = ary[j];
					ary[j] = ary[j - 1];
					ary[j - 1] = temp;
					isExchange = true;
				}
			}
			if(!isExchange)
				break;
		}
	}
	
	/**
	 * 执行插入排序
	 * @param	ary
	 */
	public static function insertionSort(ary:Array):void
	{
		var len:Number = ary.length;
		for(var i:Number = 1; i<len; i++)
		{
			var val:Number = ary[i];
			for(var j:Number = i; j > 0 && ary[j - 1] > val; j--)
			{
				ary[j] = ary[j - 1];
			}
			ary[j] = val;
		}
	}

	/**
	 * 执行二分搜索
	 * @param	ary
	 * @param	value
	 * @return  返回匹配结果的数组索引
	 */
	public static function binarySearch(ary:Array, value:Number):Number
	{
		var startIndex:Number = 0;
		var endIndex:Number = ary.length;
		var sub:Number = (startIndex + endIndex) >> 1;
		while(startIndex < endIndex)
		{
			if(value <= ary[sub]) endIndex = sub;
			else if(value >= ary[sub]) startIndex = sub + 1;
			sub = (startIndex + endIndex) >> 1;
		}
		if(ary[startIndex] == value) return startIndex;
		return -1;
	}
	
	
	/**
	 * 返回匹配项的索引
	 * @param	ary
	 * @param	num
	 * @return  返回匹配项的索引
	 */
	public static function findElementIndex(ary:Array, num:int):int
	{
		var len:int = ary.length;
		for(var i:int = 0; i<len; i++)
		{
			if(ary[i] == num)
				return i;
		}
		return -1;
	}
	
	/**
	 * 返回数组中最大值的索引
	 * @param	ary
	 * @return  返回数组中最大值的索引
	 */
	public static function getMaxElementIndex(ary:Array):int
	{
		var matchIndex:int = 0;
		var len:int = ary.length;		
		for(var j:int = 1; j < len; j++)
		{
			if(ary[j] > ary[matchIndex])
				matchIndex = j;
		}
		return matchIndex;
	}
	
	/**
	 * 返回数组中最小值的索引
	 * @param	ary
	 * @return  返回数组中最小值的索引
	 */
	public static function getMinElementIndex(ary:Array):int
	{
		var matchIndex:int = 0;
		var len:int = ary.length;
		for(var j:int = 1; j < len; j++)
		{
			if(ary[j] < ary[matchIndex])
				matchIndex = j;
		}
		return matchIndex;	
	}
	
	/**
	 * 
	 * @param	ary
	 * @return
	 * 返回一个"唯一性"数组
	 * 比如: [1, 2, 2, 3, 4]
	 * 返回: [1, 2, 3, 4]
	 */
	public static function getUniqueAry(ary:Array):Array
	{
		var uObj:Object = new Object();
		var newAry:Array = new Array();
		for(var j:int = 0; j<ary.length; j++)
		{
			if(!uObj[ary[j]]) uObj[ary[j]] = ary[j];
		}
		for(var i:String in uObj)
			newAry.unshift(uObj[i]);
		return newAry;
	}
	
	
	/**
	* 
	* 返回2个数组中不同的部分
	* 比如数组A = [1, 2, 3, 4, 6]
	*     数组B = [0, 2, 1, 3, 4]
	* 
	* 返回[6, 0]
	*/
	public static function getDifferAry (aryA:Array, aryB:Array):Array
	{
		aryA = getUniqueAry(aryA);
		aryB = getUniqueAry(aryB);
		var ary:Array = aryA.concat(aryB);
		var uObj:Object = new Object ();
		var newAry:Array = new Array ();
		for (var j:int = 0; j < ary.length; j++)
		{
			if (!uObj[ary[j]])
			{
				uObj[ary[j]] = new Object();
				uObj[ary[j]].count = 0;
				uObj[ary[j]].key = ary[j];
				uObj[ary[j]].count++;
			}
			else
			{
				if(uObj[ary[j]] is Object)
				{
					uObj[ary[j]].count++;
				}
			}
		}
		for (var i:String in uObj)
		{
			if(uObj[i].count != 2)
			{
				newAry.unshift (uObj[i].key);
			}
		}
		return newAry;
	}

	
	
	/**
	 * 
	 * @param	itemNum  数组长度
	 * @param	value    数组值
	 * @return
	 * 初始化指定长度的数组, 用初始值填充数组
	 */
	public static function initialize(itemNum:uint, value:Object):Array
	{
		var newArr:Array = new Array(itemNum);
		for(var i:Number = 0; i<itemNum; i++)
			newArr[i] = value;
		return newArr;
	}
	
    public static function swap(array:Array, index1:uint, index2:uint):void
    {
        var temp:* = array[index1];
        array[index1] = array[index2];
        array[index2] = temp;
    }
	
	/**
	 * 清除列表
	 * @param	ary 列表
	 */
	public static function clearList(ary:Array):void
	{
		if (!ary) return;
		var length:int = ary.length;
		for (var i:int = length - 1; i >= 0; i -= 1)
		{
			ary.splice(i, 1);
		}
	}
	
	/**
	 * 克隆一个数组
	 * @param	ary 需要克隆的数组
	 * @return  克隆的数组
	 */
	public static function cloneList(ary:Array):Array
	{
		if (!ary) return null
		var length:int = ary.length;
		var list:Array = [];
		for (var i:int = 0; i < length; i++) 
		{
			list.push(ary[i]);
		}
		return list;
	}
	
}
}

