using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace My
{
	public class Tools : MonoBehaviour 
	{
		public static Sprite CreateSprite(string path)
		{
			print ("CreateSprite = "  + path);
			//Sprite sprite = Resources.Load(path) as Sprite; 
			Texture2D texture = Resources.Load(path) as Texture2D; 
			Sprite sprite = Sprite.Create(texture, new Rect(0, 0, texture.width, texture.height), Vector2.zero);  
			return sprite;
		}


		public static Object ResourceLoad(string path)
		{
			return Resources.Load (path);
		}

	}

}
