require "Game/Control/Tools"

function CubeControl()
	
	local this = {}
	local imageObject = nil;
	
	local speed = 3;
	local x = 0;
	local y = 0;

	
	local function Update()
					
		local Input = UnityEngine.Input;
		local horizontal = Input.GetAxis("Horizontal");
		local vertical = Input.GetAxis("Vertical");
		local isChange = false;
		
		if(horizontal > 0) then
			x = imageObject.transform.localPosition.x + speed
			isChange = true
		elseif(horizontal < 0) then
			x = imageObject.transform.localPosition.x - speed	
			isChange = true
		end
		
		if(vertical > 0) then
			y = imageObject.transform.localPosition.y + speed
			isChange = true
		elseif(vertical < 0) then
			y = imageObject.transform.localPosition.y - speed	
			isChange = true
		end
		
		if(isChange) then
			imageObject.transform.localPosition = Vector3.New(x,y,0)
		else
			--imageObject.transform.localPosition = Vector3.MoveTowards(imageObject.transform.localPosition ,  Vector3.New(-311,-311,0) , 5)
		end
		
		--print("MoveTowards x = " .. imageObject.transform.localPosition.x .. " y = " .. imageObject.transform.localPosition.y)
	end
	
		
	local function OnLoadGameObjectFinish(gameObject)
		
		local t = UnityEngine.GameObject.Instantiate(gameObject[0]);
			
		LuaFramework.Util.Log("CubeControl OnLoadGameObjectFinish")
	end
	
	local function OnLoadTFinish(gameObject)
		
		local tPanelObject = UnityEngine.GameObject.Instantiate(gameObject[0]);
		local canvasObject = UnityEngine.GameObject.Find("Canvas")
		
		tPanelObject.transform:SetParent(canvasObject.transform)			--设置父子节点/

		local btn = UnityEngine.GameObject.Find("Button").gameObject
		My.EventHandler.addEvent(canvasObject , "Drag" ,this.OnClick )
		My.EventHandler.addEvent(btn , "Down" ,this.OnButtonClick )
	end
	
	this.OnButtonClick = function(gameObject , position , hovered)
		print("OnButtonClick")
		
		local imageGameObject = gameObject.transform.parent;
		local imageObject = imageGameObject:GetComponent('Image');
		local newSpriteImage = My.Tools.CreateSprite("Sprites/ht_ico")
		imageObject.sprite = newSpriteImage
		--imageObject.color = Color.New(111,0,0)

		local playGameObject = UnityEngine.GameObject.Find("Play_LongTaiZi").gameObject
		local playLongTaiZiAmimation = playGameObject:GetComponent("Animator");
		print("layerCount = "..playLongTaiZiAmimation.layerCount)
		--playLongTaiZiAmimation:Stop();
		playLongTaiZiAmimation:SetTrigger("ZhanLi_YouXia")
		--print("LongTaiZiAmimation = ".. tostring(playLongTaiZiAmimation))
	end
	
	--关闭事件--
	this.OnClick = function(gameObject , position , hovered)
		--LuaFramework.Util.Log("Lua.OnClick")
		local ImageObject = UnityEngine.GameObject.Find("tPanel(Clone)")
		
		if(ImageObject ~= nil) then
			ImageObject.transform.position = position
		end
		
		--print("position = " .. position)
	end
	
	local function init()
		
		imageObject = UnityEngine.GameObject.Find("Image");		--根据名字查找游戏对象
		--local btn = go.transform:FindChild("Button").gameObject		--根据名字查找这个子节点游戏对象
		imageObject.transform.localPosition = Vector3.New(0,0,0)
		
		UpdateBeat:Add(Update, self)
		
		
		local resMgr = LuaFramework.LuaHelper.GetResManager();
		resMgr:LoadPrefab("resources" , {"tPanel"} , OnLoadTFinish)			--加载对应的		
	
		LuaFramework.Util.Log("CubeContraol.init!!!CubeControl.init!!!CubeControl.init!!!CubeControl.init!!!")
		
	end
	



	this.OnCreate = function(obj)
		
		local gameObject = obj;

		local message = gameObject:GetComponent('LuaBehaviour');
		local btnClose = gameObject.transform:FindChild("Button").gameObject;
		
		message:AddClick(btnClose, this.OnClick);

		LuaFramework.Util.Log("Message.OnCreate")
	end

	init()
	
	return this
	
end

