--values

getgenv().mobs= {}
getgenv().worlds= {}
getgenv().autoegg = false

--mobs

--worlds
for _,v in pairs(game:GetService("Workspace").Worlds:GetChildren()) do
table.insert(worlds, v.Name)
end

--Remhub
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()
local Window = OrionLib:MakeWindow({Name = "ACS | Remhub", HidePremium = false, SaveConfig = true, ConfigFolder = "Remhub"})

--functions
function autoegg()
	while getgenv().autoegg == true	do
		function getNil(name,class) for _,v in next, getnilinstances() do if v.ClassName==class and v.Name==name then return v;end end end

		local args = {
			[1] = {
				[1] = {
					["Target"] = getNil("Marine1", "Model"),
					["Damage"] = 526
				}
			},
			[2] = "21"
		}
		
		game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Player"):WaitForChild("Clicker"):FireServer(unpack(args))
		
	wait(0.0000000001)
	end
	end
--tabs

local FarmTab = Window:MakeTab({
	Name = "Farm",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

--dropdowns
FarmTab:AddDropdown({
	Name = "Mobs",
	Default = "1",
	Options = {mobs[1],mobs[2]},
	Callback = function(Value)
		print(Value)
	end    
})

--toggles
FarmTab:AddToggle({
	Name = "Auto Open Egg",
	Default = false,
	Callback = function(Value)
		getgenv().autoegg = Value
		autoegg()
	end    
})

	
	
	
	



--


OrionLib:Init()
