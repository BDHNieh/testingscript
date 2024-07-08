--values

getgenv().mobs= {}
getgenv().worlds= {}
getgenv().autoegg = false

--mobs
if  game:GetService("Workspace").Snow:FindFirstChild("EnemySpawners") 
then for _,v in pairs(game:GetService("Workspace").Snow.EnemySpawners:GetChildren()) do
	table.insert(mobs, v.Name) end
else

for _,v in pairs(game:GetService("Workspace").Worlds.DBZ.EnemySpawners:GetChildren()) do
	table.insert(mobs, v.Name) end
end
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
	local args = {
		[1] = workspace:WaitForChild("Worlds"):WaitForChild("DBZ"):WaitForChild("DBZOrb"),
		[2] = 1
	}
	game:GetService("ReplicatedStorage"):WaitForChild("Remote"):WaitForChild("Orbs"):WaitForChild("OpenOrbs"):FireServer(unpack(args))
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
