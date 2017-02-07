using UnityEngine;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using LuaInterface;
namespace My
{
	/*确定接收的注册事件字符串为
 * Click			//单击
 * Enter			//进入
 * Exit				//离开
 * Down				//按下
 * Up				//松开
 * Drag				//拖拽
 */
	public class EventHandler : MonoBehaviour, IPointerClickHandler, IPointerEnterHandler, IPointerExitHandler, IPointerDownHandler,IPointerUpHandler, IDragHandler
	{
		class MyEvent
		{
			public const string Click = "Click";			//单击
			public const string Enter = "Enter";			//进入
			public const string Exit = "Exit";			//离开
			public const string Down = "Down";			//按下
			public const string Up = "Up";				//松开
			public const string Drag = "Drag";			//拖拽

			public string name;
			private LuaFunction luafunc;
			private GameObject go; 

			public MyEvent(string name , GameObject go , LuaFunction luafunc)
			{
				this.name = name;
				this.go = go;
				this.luafunc = luafunc;
			}

			public void Call (PointerEventData eventData)
			{
				luafunc.Call(go , eventData.position , eventData.hovered);
			}

		}

		private ArrayList eventList = new ArrayList();

		public void OnPointerClick(PointerEventData eventData)
		{
			//Debug.Log("Pointer Click");
			executeEvent (MyEvent.Click, eventData);			//执行对应的事件函数
		}

		public void OnPointerEnter(PointerEventData eventData)
		{
			//Debug.Log("Pointer Enter");
			executeEvent (MyEvent.Enter, eventData);			//执行对应的事件函数
		}

		public void OnPointerExit(PointerEventData eventData)
		{
			//Debug.Log("Pointer Exit");
			executeEvent (MyEvent.Exit, eventData);				//执行对应的事件函数
		}

		public void OnPointerDown(PointerEventData eventData)
		{
			//Debug.Log("Pointer Down");
			executeEvent (MyEvent.Down, eventData);				//执行对应的事件函数
		}

		public void OnPointerUp(PointerEventData eventData)
		{
			//Debug.Log("Pointer Up");
			executeEvent (MyEvent.Up, eventData);				//执行对应的事件函数
		}

		public void OnDrag(PointerEventData eventData)
		{
			//Debug.Log("Dragged");
			executeEvent (MyEvent.Drag, eventData);				//执行对应的事件函数
		}

		private MyEvent getEventByName(string eventName)
		{
			if (eventList == null)
				return null;
			foreach(MyEvent myEvent in eventList)
			{
				if (myEvent.name.Equals (eventName))
					return myEvent;
			}
			return null;
		}

		private MyEvent addEvent(string eventName, GameObject go, LuaFunction luafunc)
		{
			MyEvent myEvent = getEventByName (eventName);
			if (myEvent == null) 
			{
				myEvent = new MyEvent (eventName, go, luafunc);
				eventList.Add (myEvent);
			}
			return myEvent;
		}

		private void executeEvent (string eventName , PointerEventData eventData)
		{
			MyEvent myEvent = getEventByName (eventName);		//获得这个注册事件
			if (myEvent != null)
				myEvent.Call (eventData);
		}



		//添加监听
		public static void addEvent(GameObject go, string eventName ,  LuaFunction luafunc)
		{
			EventHandler eventHandler = go.GetComponent<EventHandler>();
			if (eventHandler == null) 
			{
				eventHandler = go.AddComponent<EventHandler> ();
			}

			eventHandler.addEvent (eventName, go, luafunc);
		}
	}
}
