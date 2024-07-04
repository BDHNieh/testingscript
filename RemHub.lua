--Remhub

local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "Remhub", HidePremium = false, SaveConfig = true, ConfigFolder = "Remhub"})

--values

_G.autoFarm = true
_G.autoLoad = true

--functions

function autoFarm()
    while _G.autoFarm == true do
        game:GetService("ReplicatedStorage").common.packages._Index:FindFirstChild("sleitnick_knit@1.5.1").knit.Services.EquipmentService.RE.click:FireServer()
        wait(0.0000000001)
    end
end

function autoLoad()
    while _G.autoLoad == true do
        game:GetService("ReplicatedStorage").common.packages._Index:FindFirstChild("sleitnick_knit@1.5.1").knit.Services.EquipmentService.RF.AutoLoad:InvokeServer()
        wait(1)
    end
end

--tabs

local FarmTab = Window:MakeTab({
	Name = "Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--toggles

FarmTab:AddToggle({
	Name = "Auto Farm",
	Default = false,
	Callback = function(Value)
		_G.autoFarm = Value
        autoFarm()
    end
})
FarmTab:AddToggle({
	Name = "Auto Load",
	Default = false,
	Callback = function(Value)
		_G.autoLoad = Value
        autoLoad()
    end
})






--
OrionLib:Init()