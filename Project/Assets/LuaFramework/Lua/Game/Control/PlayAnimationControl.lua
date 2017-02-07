
function PlayAnimationControl()
	local this = {}

	local playAnimationModeName = "LongTaiZi"			--播放动画的模型名称
	local playAnimationState = "ZhanLi"					--播放动画的状态(站立，跑步，攻击)等。
	local playAnimationDirection="YouXia"				--播放动画的方向

	local playGameObject = nil
	local playGameObjectAnimation = nil

	local function  init()
		playGameObject = UnityEngine.GameObject.Find("PlayObject")
		--playGameObjectAnimation = playGameObject:AddComponent(typeof(UnityEngine.Animator));
		--playGameObjectAnimation.runtimeAnimatorController = My.Tools.ResourceLoad("Animation/LongTaiZi")

		--local playTriggerName = playAnimationModeName.."_"..playAnimationState.."_"..playAnimationDirection
		--print("init playTriggerName = ".. playTriggerName)
		--playGameObjectAnimation:SetTrigger(playTriggerName);
	end


	init()

	return this

end