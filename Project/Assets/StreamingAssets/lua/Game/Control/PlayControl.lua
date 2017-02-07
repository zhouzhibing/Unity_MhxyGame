require "Game/Control/PlayAnimationControl"

function PlayControl()

	local this = {}

	local playGameObject = nil							--玩家角色整体控制对象
	local playAnimationControl = nil					--玩家动画控制器


	local testCount = 1;

	local function  init()
		playAnimationControl = PlayAnimationControl();
	end

	this.changeAnimation = function()
		if(testCount == 1) then
			playAnimationModeName = "LongTaiZi"
		elseif(testCount == 2)then
			playAnimationModeName = "GuJingLing"
			testCount = 0
		end

		local playTriggerName = "Play_"..playAnimationModeName.."_"..playAnimationState.."_"..playAnimationDirection
		playGameObjectAnimation:SetBool(playTriggerName , true);
		
		print("changeAnimation playTriggerName = ".. playTriggerName)

		testCount = testCount + 1;

		--print("testCount = " .. testCount)
	end

	init();

	return this;
end