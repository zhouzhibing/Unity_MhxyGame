using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using LuaInterface;
using LuaFramework;
namespace My
{
	public class TestLuaFun : MonoBehaviour {

		public void Awake()
		{
			Animator a = this.gameObject.AddComponent<Animator> ();
			a.runtimeAnimatorController = Resources.Load ("Animation/PlayAnimation") as RuntimeAnimatorController;

		}

		// Use this for initialization
		public static void Log () {

			Debug.Log("《Unity3D网络游戏实战》是一本好书！");
			Debug.Log("《手把手教你用c#制作rpg游戏》也是一本好书！");
			//this.gameObject.transform.SetParent()
			//Application.LoadLevel("inGame");


		}

	}

}
