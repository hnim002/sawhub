getgenv().FixLag = false
getgenv().FpsCap = 30

if getgenv().FixLag then
    spawn(function()
        setfpscap(getgenv().FpsCap)
        while wait() do
            for i, v in pairs(game.Workspace["_WorldOrigin"]:GetChildren()) do
                if v.Name == "CurvedRing" or v.Name == "SlashHit" or v.Name == "DamageCounter" or v.Name == "SwordSlash" or v.Name == "SlashTail" or v.Name == "Sounds" then
                    v:Destroy() 
                end
            end
            game:GetService("RunService"):Set3dRenderingEnabled(false)
        end
    end)
    for i,v in pairs(game:GetDescendants()) do
        pcall(function()
            v.Transparency = 1
        end)
    end
    for i,v in pairs(getnilinstances()) do
        pcall(function()
            for i2,v2 in pairs(v) do
                if v2:IsA("BasePart") then
                    v2.Transparency =1
                end
            end
            v.Transparency =1 
        end)
    end
end

getgenv().Config = {
    Team="Pirates",
    Auto_Farm_Level = true,
    Triple_Quest = true,
    Auto_Factory = true,
    Auto_Buy_Sword_Legend = true,
    Fast_Attack = false,
    Kill_Player_Quest = true,
    Kill_Sky_Mob = true,
    Stats_Kaitun = "Sword",
    Auto_Superhuman = true,
    Auto_Saber=true,
    Auto_Pole=true,
    Auto_Second_Sea=true,
    Auto_Store = true,
    Teleport_Fruit = true,
    Auto_Random = true,
    Auto_Buy_Fruit = "Bomb",
    Bartilo_Quest=true,
    Fragment_Lock = 5000,
    Microchip="Dark",
    RedeemCode = {
        Enabled = true,
        Level = 1,
    },
    Buy_Item = {
        Enabled = true,
        Level = 700,
    },
    Webhook = {
        Webhook_Url = "https://discord.com/api/webhooks/1066686430061006920/mwMTj7nvwrio9GRRdlfVDztdx-QZzQvw4TUfpayga4vrWIqmPy95s7LWXu8YrpawR3XX",
        Webhook_Information=true,
        Webhook_Time = 600,
    }
}

repeat wait() until game:IsLoaded()
repeat wait()
until game.Players.LocalPlayer
repeat wait()
until game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("LoadingScreen") == nil
repeat wait()
    if game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Main"):FindFirstChild("ChooseTeam") then
           for i,v in pairs(getconnections(game:GetService("Players").LocalPlayer.PlayerGui.Main.ChooseTeam.Container[Config["Team"]].Frame.ViewportFrame.TextButton.Activated)) do
            v.Function()
        end 
    end
until game.Players.LocalPlayer.Team ~= nil and game:IsLoaded() 
repeat wait()
until game.Players.LocalPlayer.Character

getgenv().SelectFarm = "AutoFarmLevel"
getgenv().Weapon = "Melee"

if game.PlaceId == 2753915549 then
    FirstSea = true
 elseif game.PlaceId == 4442272183 then
    SecondSea = true
 elseif game.PlaceId == 7449423635 then
    ThirdSea = true
 end

local LP = game.Players.LocalPlayer

function SendWebHook(t1,t2)
    if Config["Webhook"]["Webhook_Url"] ~=  "" then
        local msg = {
            ["username"] = "Saw Hub Kaitun",
            ["avatar_url"] = "https://tr.rbxcdn.com/9b78e73ecff59b92a0d23e0cf4b40292/512/512/Image/Png",
            ["embeds"] = {{
                ["title"] = "Saw Hub",
                ["fields"] = {
                    {
                        ["name"] = "Account : ",
                        ["value"] = "||"..game:GetService("Players").LocalPlayer.Name.."||",
                        ["inline"] = false
                    },
                    {
                        ["name"] = t1.." : ",
                        ["value"] = "```"..t2.."```",
                        ["inline"] = false
                    }
                }, 
                ["type"] = "rich",
                ["color"] = tonumber(47103),
                ["footer"] = {
                    ["text"] = "Saw Hub (" .. os.date("%X") .. ")"
                }
            }}
        }
        request({
            Url ="https://discord.com/api/webhooks/1061653657826902146/a6XJzZHNic6NeVlzKTLOQKswODBxM1WQaFtGjXWiqGkGNTtHxbg4cljeJnB1uArlGTMc",
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode(msg)
        })
    end
end

getgenv().QuestBoss = {
    NameMob = "???",
    NameQuest = "???",
    LevelReq = 9999
}

function getRoot(char)

    if char then
       local rootPart = char:FindFirstChild('HumanoidRootPart')
       return rootPart
    end
    return false
end

function HopServer()
    local Settings = {}
    local HttpService = game:GetService("HttpService")

    local SaveFileName = "Sawhubjoin.json"

    local function SaveSettings()
        local HttpService = game:GetService("HttpService")
        if not isfolder("Saw Hub") then
            makefolder("Saw Hub")
        end
        writefile("Saw Hub/" .. SaveFileName, HttpService:JSONEncode(Settings))
    end

    local function ReadSetting()
        local s,e = pcall(function()
            local HttpService = game:GetService("HttpService")
            if not isfolder("Saw Hub") then
                makefolder("Saw Hub")
            end
            return HttpService:JSONDecode(readfile("Saw Hub/" .. SaveFileName))
        end)
        if s then return e
        else
            SaveSettings()
            return ReadSetting()
        end
    end
    Settings = ReadSetting()

    function HopServer2()
    local function Hop()
        for i=1,100 do
            local huhu = game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer(i)
            for k,v in pairs(huhu) do
                if k~=game.JobId and v.Count < 9 then
                    if not Settings[k] or tick() - Settings[k].Time > 60*10  then
                        Settings[k] = {
                            Time = tick()
                        }
                        SaveSettings()
                        game:GetService("ReplicatedStorage").__ServerBrowser:InvokeServer("teleport",k)
                        return true
                    elseif tick() - Settings[k].Time > 60*60 then
                        Settings[k] = nil
                    end
                end
            end
        end
        return false
    end	

    if not getgenv().Loaded then
        local function child(v)
            if v.Name == "ErrorPrompt" then
                if v.Visible then
                    if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                        HopServer()
                    end
                end
                v:GetPropertyChangedSignal("Visible"):Connect(function()
                    if v.Visible then
                        if v.TitleFrame.ErrorTitle.Text == "Teleport Failed" then
                            HopServer()
                        end
                    end
                end)
            end
        end
        for k,v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetChildren()) do
            child(v)
        end
        game.CoreGui.RobloxPromptGui.promptOverlay.ChildAdded:Connect(child)
        getgenv().Loaded = true
    end
    while not Hop() do wait() end
    SaveSettings()
    end
    HopServer2()
end

function SaberProgress()
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("ProQuestProgress")) do
        if typeof(v) == "table" then
            Plates = 0
            for i2,v2 in pairs(v) do
                if v2 == true then
                    Plates = Plates + 1
                end
            end
        end
        if i == "UsedTorch" and v == true then
            --  print(i,v)
            UsedTorch = true
        end
        if i == "UsedCup" and v == true then
            --  print(i,v)
            UsedCup = true
        end
        if i == "KilledMob" and v == true then
            -- print(i,v)
            KilledMob = true
        end
        if i == "KilledShanks" and v == true then
            -- print(i,v)
            KilledShanks = true
        end
        if i == "UsedRelic" and v == true then
            --print(i,v)
            UsedRelic = true
        end
        if i == "TalkedSon" and v == true then
            -- print(i,v)
            TalkedSon = true
        end
    end
end

function BartiloProgress()
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BartiloQuestProgress")) do
       if i == "KilledBandits" and v == true then
          KilledBandits = true
       end
       if i == "KilledSpring" and v == true then
          KilledSpring = true
       end
       if i == "DidPlates" and v == true then
          DidPlates = true
       end
    end
end

function DoTween(targetCFrame)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local Distance = (targetCFrame.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
        local Speed = 250
        if Distance < 500 then
            Speed = 500
        elseif Distance < 1000 then
            Speed = 275
        elseif Distance >= 1000 then
            Speed = 250
        end        
        local info = TweenInfo.new(Distance/Speed,Enum.EasingStyle.Linear)
        local tween2 = game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = targetCFrame})
        tween2:Play()
        
        if targetCFrame.Y >= 6 then
            tween2:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,targetCFrame.Y,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
        end
        

        local tweenfunc = {}
    
        local Dis2 = (targetCFrame.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
        local Speed2 = 250
        if Distance < 500 then
            Speed2 = 500
        elseif Distance < 1000 then
            Speed2 = 275
        elseif Distance >= 1000 then
            Speed2 = 250
        end   
        local info2 = TweenInfo.new(Dis2/Speed2,Enum.EasingStyle.Linear)
        local tween = game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info2, {CFrame = targetCFrame})
        tween:Play()
    
        tween.Completed:wait()
    end
end

local FruitHave = {}

local FruitList = {
    ["Bomb Fruit"] =  "Bomb-Bomb",
    ["Spike Fruit"] =  "Spike-Spike",
    ["Chop Fruit"] =  "Chop-Chop",
    ["Spring Fruit"] =  "Spring-Spring",
    ["Kilo Fruit"] =  "Kilo-Kilo",
    ["Spin Fruit"] =  "Spin-Spin",
    ["Bird: Falcon Fruit"] = "Bird-Bird: Falcon",
    ["Smoke Fruit"] =  "Smoke-Smoke",
    ["Flame Fruit"] =  "Flame-Flame",
    ["Ice Fruit"] =  "Ice-Ice",
    ["Sand Fruit"] =  "Sand-Sand",
    ["Dark Fruit"] =  "Dark-Dark",
    ["Revive Fruit"] =  "Revive-Revive",
    ["Diamond Fruit"] =  "Diamond-Diamond",
    ["Light Fruit"] =  "Light-Light",
    ["Love Fruit"] =  "Love-Love",
    ["Rubber Fruit"] =  "Rubber-Rubber",
    ["Barrier Fruit"] =  "Barrier-Barrier",
    ["Magma Fruit"] =  "Magma-Magma",
    ["Door Fruit"] =  "Door-Door",
    ["Quake Fruit"] =  "Quake-Quake",
    ["Human: Buddha Fruit"] =  "Human-Human: Buddha",
    ["String Fruit"] =  "String-String",
    ["Bird: Phoenix Fruit"] =  "Bird-Bird: Phoenix",
    ["Rumble Fruit"] =  "Rumble-Rumble",
    ["Paw Fruit"] =  "Paw-Paw",
    ["Gravity Fruit"] =  "Gravity-Gravity",
    ["Dough Fruit"] =  "Dough-Dough",
    ["Venom Fruit"] =  "Venom-Venom",
    ["Shadow Fruit"] =  "Shadow-Shadow",
    ["Control Fruit"] =  "Control-Control",
    ["Soul Fruit"] =  "Soul-Soul",
    ["Dragon Fruit"] =  "Dragon-Dragon",
    ["Leopard Fruit"] =  "Leopard-Leopard"
}

function ResetList()
    table.clear(FruitHave)
    pcall(function()
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")) do
            table.insert(FruitHave,v.Name)
        end
    end)

end
ResetList()

function GetFruit(c)
    local toable = {}
    ResetList()
    for i,v in pairs(workspace:GetChildren()) do
        if v.Name == "Fruit " then
            local sdas = {}
            
        elseif string.find(v.Name,"Fruit") then
            if not table.find(FruitHave,FruitList[v.Name]) or c then
                table.insert(toable,v)
            end
        end
    end
    return toable
end

function TeleportFruit(d,bypass)
    pcall(function()
        for i,v in pairs(GetFruit(d)) do
            if v.Name == "Fruit " then
                repeat wait(0.1)
                    if GetMagnitude(v.Handle.Position) >= 2000 and bypass then
                        BypassTp(v.Handle.Position)
                    end
                    toTarget(v.Handle.CFrame)
                until not game:GetService("Workspace"):FindFirstChild(v.Name) or not v.Parent
            else
                repeat wait(0.1)
                    if game.Players.LocalPlayer:DistanceFromCharacter(v.Handle.Position) >= 800 then
                        if GetMagnitude(v.Handle.Position) >= 2000 and bypass then
                            BypassTp(v.Handle.Position)
                        end
                        toTarget(v.Handle.CFrame)
                    else
                        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart,v.Handle,0) 
                    end
                until not game:GetService("Workspace"):FindFirstChild(v.Name) or not v.Parent
            end
        end
    end)
end

function Item()
    local out = {}

    pcall(function()
        for k,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryWeapons")) do
            table.insert( out, v.Name )
        end
    end)

    return out
end

function CheckItem(itemt)
    local finded = Item()
    if table.find(finded,itemt) then
        return true
    else
        return false
    end
    return false
end

if SecondSea then
    MaxLevelSea = 1500
elseif ThirdSea then
    MaxLevelSea = 2450
elseif FirstSea then
    MaxLevelSea = 700
end

SaberProgress()

function CheckFarm()
    if FirstSea then
        if Config['Teleport_Fruit'] and #GetFruit() ~= 0 then
            getgenv().SelectFarm = "TeleportFruit"
        elseif Config['Auto_Second_Sea'] and LP.Data.Level.Value >= 700 and FirstSea and (CheckItem("Pole (1st Form)") or Config["Auto_Pole"] == false) and (CheckItem("Saber") or Config["Auto_Saber"] == false) then
            getgenv().SelectFarm = "AutoSecondSea"
        elseif Config['Auto_Pole'] and FirstSea and LP.Data.Level.Value >= 575 and CheckItem("Pole (1st Form)") == false then
            if (workspace.Enemies:FindFirstChild("Thunder God [Lv. 575] [Boss]") or game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God [Lv. 575] [Boss]")) then
                getgenv().SelectFarm = "AutoPole"
            else
                HopServer()
            end
        elseif Config['Auto_Saber'] and not KilledShanks and FirstSea and LP.Data.Level.Value >= 200 then
            getgenv().SelectFarm = "AutoSaber"
        elseif Config['Kill_Player_Quest'] and LP.Data.Level.Value >= 50 and FirstSea and game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter") ~= "I don't have anything for you right now. Come back later." then
            getgenv().SelectFarm = "KillPlayerQuest"
        elseif Config['Kill_Sky_Mob'] and LP.Data.Level.Value <= 50 then
            getgenv().SelectFarm = "KillSkyMob"
        elseif Config['Auto_Farm_Level'] then
            getgenv().SelectFarm = "AutoFarmLevel"
        end
    elseif SecondSea then
        if Config['Teleport_Fruit'] and #GetFruit() ~= 0 then
            getgenv().SelectFarm = "TeleportFruit"
        elseif Config['Auto_Third_Sea'] and LP.Data.Level.Value >= 1500 then
            getgenv().SelectFarm = "AutoThirdSea"
        elseif Config['Bartilo_Quest'] and LP.Data.Level.Value >= 850 and SecondSea and not BartiloQuestB and CheckItem("Warrior Helmet") ==false then
            getgenv().SelectFarm = "BartiloQuest"
        elseif LP.Data.Level.Value >= 1100 and Config["Fragment_Lock"] >= 1000 and LP.Data.Fragments.Value < Config["Fragment_Lock"] then
            getgenv().SelectFarm = "TeleportFruitAndRaid"
        elseif Config['Auto_Farm_Level'] then
            getgenv().SelectFarm = "AutoFarmLevel"
        end
    end
end

function IsAlive(Object,HaveHRP,HaveHumanoid)
    if Object and Object.Parent and getRoot(Object) and Object:FindFirstChild('Humanoid') then
       if Object:FindFirstChild('Humanoid').Health > 0 then
          return true
       end
    end
    return false
end

function RemoveS(str)
    local a = str:split("")
    local textt = ""
    if a[#a] == "s" then
        for i,v in pairs(a) do
            if tonumber(i) ~= tonumber(#a) then
                textt = textt..v
            end
        end
    else
        textt = str
    end
    if str == "Mil. Spy" then
        textt = "Military Spy"
    elseif str == "Mil. Soldier" then
        textt = "Military Soldier"
    end
    return textt
end

function CheckQuest(dbq)
   local PlrLevel = LP.Data.Level.Value
   local Minlv=0
    for i,v in pairs(require(game:GetService("ReplicatedStorage").Quests)) do
        if typeof(v) == "table" and i ~= "BartiloQuest" and i~= "CitizenQuest" and i ~= "MarineQuest" then
            for i2,v2 in pairs(v) do
                if i2 ~= 3 then
                    if PlrLevel >= v2["LevelReq"] and v2["LevelReq"] >= Minlv and v2["LevelReq"] < MaxLevelSea then
                        if (not dbq or i2 == 1) then
                            getgenv().NameQuest = i
                            Minlv= v2["LevelReq"]
                            getgenv().LevelQuest = i2
                            getgenv().NameMob = RemoveS(v2["Name"])
                            getgenv().LevelReq = v2["LevelReq"]
                        else
                            getgenv().NameQuest = i
                            Minlv= v[1]["LevelReq"]
                            getgenv().LevelQuest = 1
                            getgenv().NameMob =  RemoveS(v[1]["Name"])
                            getgenv().LevelReq = v[1]["LevelReq"]
                        end
                        if v[3] ~= nil then
                            if PlrLevel >= v[3]["LevelReq"] and v[3]["LevelReq"] >= Minlv then
                                getgenv().QuestBoss["NameQuest"] = i
                                getgenv().QuestBoss["LevelReq"] = v[3]["LevelReq"]
                                getgenv().QuestBoss["NameMob"] = RemoveS(v[3]["Name"])
                            else
                                getgenv().QuestBoss["NameMob"] = "???"
                                getgenv().QuestBoss["NameQuest"] = "???"
                                getgenv().QuestBoss["LevelReq"] = 9999
                            end
                        else
                            getgenv().QuestBoss["NameMob"] = "???"
                            getgenv().QuestBoss["NameQuest"] = "???"
                            getgenv().QuestBoss["LevelReq"] = 9999
                        end
                    end
                end
            end
        end
    end
   return
end

CheckQuest(false)

function Float(a)
    if a then
        pcall(function()
            if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                local Noclip = Instance.new("BodyVelocity")
                Noclip.Name = "BodyClip"
                Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                Noclip.MaxForce = Vector3.new(100000,100000,100000)
                Noclip.Velocity = Vector3.new(0,0,0)
            end
        end)
    elseif game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip"):Destroy()
    end
end

function toTarget(targetCFrame,bp)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local Distance = (targetCFrame.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
        local Speed = 250
        if Distance < 500 then
            Speed = 500
        elseif Distance < 1000 then
            Speed = 275
        elseif Distance >= 1000 then
            Speed = 250
        end        
        local info = TweenInfo.new(Distance/Speed,Enum.EasingStyle.Linear)
        local tween2 = game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = targetCFrame})
        tween2:Play()
        
        if targetCFrame.Y >= 6 then
            tween2:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,targetCFrame.Y,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
        end
        

        local tweenfunc = {}
    
        local Dis2 = (targetCFrame.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
        local Speed2 = 250
        if Distance < 500 then
            Speed2 = 500
        elseif Distance < 1000 then
            Speed2 = 275
        elseif Distance >= 1000 then
            Speed2 = 250
        end   
        local info2 = TweenInfo.new(Dis2/Speed2,Enum.EasingStyle.Linear)
        local tween = game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info2, {CFrame = targetCFrame})
        tween:Play()
    
        function tweenfunc:Stop()
            tween:Cancel()
        end
    
        if not tween then return tween end
        return tweenfunc
    end
end

function EquipWeapon(ToolSe)
	if game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe) then
		local tool = game.Players.LocalPlayer.Backpack:FindFirstChild(ToolSe)
		game.Players.LocalPlayer.Character.Humanoid:EquipTool(tool)
	end
end

function EquipToolTip(ToolTip)
	for i,v in pairs(LP.Backpack:GetChildren()) do
		if v:IsA("Tool") then
			if v.ToolTip == ToolTip then
				EquipWeapon(v.Name)
			end
		end
	end
end

local Bypass

if ThirdSea then
    Bypass = {
        ["Mansion"] = Vector3.new(-12550.169921875, 340.94024658203, -7500.677734375),
        ["Castle"] = Vector3.new(-5058.05, 314.551, -3156.41),
        ["Hydra"] = Vector3.new(5758.77, 610.459, -235.079),
        ["Mansion2"] = Vector3.new(-11992.5977, 331.842743, -8881.40527),
        ["Hydra2"] = Vector3.new(5314.58203, 25.5193882, -125.942276) 
    }
elseif SecondSea then
    
end

function CheckTP(targetpos)
    local cf
    local memaybeo = game:GetService("Players").LocalPlayer:DistanceFromCharacter(targetpos)
    for i,v in pairs(Bypass) do
        local memaykobeo = (v-targetpos).Magnitude
        if memaybeo > memaykobeo then
            memaybeo=memaykobeo
            cf = v
        end
    end
    if memaybeo >= 3000 then
        cf = nil
    end
    return cf
end

function Alive()
    if LP.Character then
       if getRoot(LP.Character) and LP.Character:FindFirstChild('Humanoid') then
          if LP.Character:FindFirstChild('Humanoid').Health > 0 then
             return true
          end
       end
    end
    return false
end

function BypassTp(pos)
        local b1
        local b2
        local max1 = math.huge
        local max2 = math.huge
        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].PlayerSpawns.Pirates:GetDescendants()) do
            if v:IsA("BasePart") then
                if (pos-v.Position).Magnitude < max1 then
                    max1 = (pos-v.Position).Magnitude
                    b1 = v
                end
            end
        end
        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemyRegions:GetChildren()) do
            if v:IsA("BasePart") then
                if (pos-v.Position).Magnitude < max2 then
                    max2 = (pos-v.Position).Magnitude
                    b2 = v
                end
            end
        end
        
        if game:GetService("Players").LocalPlayer.Data.LastSpawnPoint.Value ~= b1.Parent.Name then
            repeat task.wait()
                pcall(function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame *= CFrame.new(0,10000,0)
                    game:GetService("ReplicatedStorage").Remotes.Location:FireServer(nil)
                    wait(0.1)
                    game:GetService("ReplicatedStorage").Remotes.Location:FireServer(b2)

                    local ohString1 = "SetLastSpawnPoint"
                    local ohString2 = b1.Parent.Name

                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(ohString1, ohString2)
                    
                    getRoot(LP.Character).CFrame = b1.CFrame
                    if LP.Character:FindFirstChild("Head") then
                        LP.Character.Head:Destroy()
                    end
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("SetSpawnPoint")
                end)
            until game:GetService("Players").LocalPlayer.Data.LastSpawnPoint.Value == b1.Parent.Name or game:GetService("Players").LocalPlayer.Data.SpawnPoint.Value == b1.Parent.Name
            game:GetService("ReplicatedStorage").Remotes.Location:FireServer(nil)
            pcall(function()
                LP.Character.Humanoid.Health = 0
            end)
        end
 
end

function FFM(object,name) 
    for i,v in pairs(object:GetChildren()) do
        if v.Name == name or string.find(v.Name,name) then
            return v
        end
    end
    return false
end

function GetMagnitude(pos)
    return LP:DistanceFromCharacter(pos)
end 

function CheckRange(pos,pos2)
    return (pos-pos2).Magnitude
end 

function AutoBuso()
    if not game.Players.LocalPlayer.Character:FindFirstChild("HasBuso") then
        local args = {
            [1] = "Buso"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
    end
end

local CbFw = getupvalues(require(LP.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]
   
function GetCurrentBlade() 
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then return end
    while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
    return ret
end


game:GetService("RunService").Stepped:Connect(function()
    if Usefastattack then
        game:GetService('VirtualUser'):CaptureController()
        game:GetService('VirtualUser'):ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
    end
end)

local CombatFrameworkROld = require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework) 
local CombatFrameworkR = getupvalues(CombatFrameworkROld)[2]
local CameraShakerR = require(game.ReplicatedStorage.Util.CameraShaker)
CameraShakerR:Stop()
spawn(function()
	game:GetService("RunService").Stepped:Connect(function()
		if Usefastattack then
            pcall(function()
                CombatFrameworkR.activeController.timeToNextAttack = -(math.huge^math.huge^math.huge)
                CombatFrameworkR.activeController.attacking = false
                CombatFrameworkR.activeController.increment = 4
                CombatFrameworkR.activeController.blocking = false   
                CombatFrameworkR.activeController.hitboxMagnitude = 150
                CombatFrameworkR.activeController.humanoid.AutoRotate = true
                CombatFrameworkR.activeController.focusStart = 0
                CombatFrameworkR.activeController.currentAttackTrack = 0
     
            end)	
		end
	end)
end)

task.spawn(function()
    pcall(function()
        while wait(.1) do
            if Config["Auto_Store"] then
                for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and string.find(v.Name, "Fruit") then
                        ResetList()
                        if not table.find(FruitHave,FruitList[v.Name]) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",FruitList[v.Name],v)
                            webhook("Fruit",v.Name)
                        end
                    end
                end
                for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                    if v:IsA("Tool") and string.find(v.Name, "Fruit")  then
                        ResetList()
                        if not table.find(FruitHave,FruitList[v.Name]) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",FruitList[v.Name],v)
                            webhook("Fruit",v.Name)
                        end
                    end
                end
            end
        end
    end)
end)

task.spawn(function()
    local t = tick()
    while wait(0.1) do
        if Usefastattack then
            pcall(function()
                if tick()-t > 3 then t = tick() wait(0.5) end
                game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))
                game:GetService('VirtualUser'):CaptureController()
                game:GetService('VirtualUser'):ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
            end)
        end
    end
end)

task.spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if getgenv().KillAura then
            pcall(function()
                for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
                    if v.Name == "Humanoid" then
                        v.Health = 0
                    end
                    sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                end
            end)
        end
    end)
end)

function CheckDis(n)
    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].Locations:GetChildren()) do
        if v.Name == n and game.Players.LocalPlayer:DistanceFromCharacter(v.Position) < 3000 then
            return v
        end
    end
end

function GetIsland()
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 5") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
        local c = CheckDis("Island 5")
        if c then
            return c
        end
    end
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 4") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
        local c = CheckDis("Island 4")
        if c then
            return c
        end
    end
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 3") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
        local c = CheckDis("Island 3")
        if c then
            return c
        end
    end
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 2") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
        local c = CheckDis("Island 2")
        if c then
            return c
        end
    end
    if game:GetService("Workspace")["_WorldOrigin"].Locations:FindFirstChild("Island 1") and game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true then
        local c = CheckDis("Island 1")
        if c then
            return c
        end
    end
end

for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
    if v["Disable"] then
       v["Disable"](v)
    elseif v["Disconnect"] then
       v["Disconnect"](v)
    end
 end

spawn(function()
    while wait() do
        pcall(function()
            if getgenv().NearNextIsland then
                local g = GetIsland()
                if g then
                    toTarget(g.CFrame * CFrame.new(0,30,0)) 
                end
            end
        end)
    end
end)

local AutoRaidJoined = false

function CheckFruit()
    for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
        if string.find(v.Name,"Fruit") then
            return true
        end
    end
    for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
        if string.find(v.Name,"Fruit") then
            return true
        end
    end
    return false
end

function AutoRaid()
    pcall(function()
        TeleportFruit(true,false)
        if CheckFruit() then
            repeat wait()
                for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA("Tool") and string.find(v.Name, "Fruit") then
                        ResetList()
                        if not table.find(FruitHave,FruitList[v.Name]) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",FruitList[v.Name],v)
                        end
                    end
                end
                for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
                    if v:IsA("Tool") and string.find(v.Name, "Fruit")  then
                        ResetList()
                        if not table.find(FruitHave,FruitList[v.Name]) then
                            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StoreFruit",FruitList[v.Name],v)
                        end
                    end
                end
                local args = {
                    [1] = "RaidsNpc",
                    [2] = "Select",
                    [3] = getgenv().Config["Microchip"]
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                    wait(0.5)
                for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if string.find(v.Name,"Microchip") then
                    if not AutoRaidJoined then
                        if ThirdSea then
                            --DoTween(CFrame.new(-5034.16309, 314.9664, -2948.1499),getgenv().TweenSpeedTeleportPlace)
                            fireclickdetector(game:GetService("Workspace").Map["Boat Castle"].RaidSummon2.Button.Main.ClickDetector, 1)
                        elseif SecondSea then
                        -- DoTween(CFrame.new(-6438.73535, 250.645355, -4501.50684),getgenv().TweenSpeedTeleportPlace)
                            fireclickdetector(game:GetService("Workspace").Map.CircleIsland.RaidSummon2.Button.Main.ClickDetector, 1)
                        end
                            AutoRaidJoined = true
                    else AutoRaidJoined = true
                    end
                    end
                end
                repeat wait()
                until game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == true
                repeat wait()
                    getgenv().NearNextIsland = true
                    getgenv().KillAura = true
                until game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false
                wait(5)
                AutoRaidJoined = false
                getgenv().NearNextIsland = false
                getgenv().KillAura = false
            until CheckFruit() == false and game:GetService("Players").LocalPlayer.PlayerGui.Main.Timer.Visible == false
        else
            HopServer()
        end
    end)
end

local DoubleQuest = false

function Tp(posss)
    pcall(function()
    	if FirstSea and (string.find("Fishman Commando [Lv. 400]",getgenv().NameMob) or string.find("Fishman Warrior [Lv. 375]",getgenv().NameMob)) and (Vector3.new(61163.8515625, 11.6796875, 1819.7841796875) - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 50000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(61163.8515625, 11.6796875, 1819.7841796875))
        elseif SecondSea and string.find(getgenv().NameMob, "Ship") and (Vector3.new(923.21252441406, 126.9760055542, 32852.83203125) - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(923.21252441406, 126.9760055542, 32852.83203125))
        elseif SecondSea and not string.find(getgenv().NameMob, "Ship") and (Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422) - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).magnitude > 30000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
        end 
        if pos then
            if GetMagnitude(posss) >= 50000 and SecondSea then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(-6508.5581054688, 89.034996032715, -132.83953857422))
            elseif GetMagnitude(posss) >= 50000 and FirstSea then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("requestEntrance",Vector3.new(3864.8515625, 6.6796875, -1926.7841796875))
            end
        end
    end)

end

function AutoFarmLevel()
    if Alive() then
        if FFM(game.Workspace.Enemies,getgenv().QuestBoss['NameMob']) or FFM(game.ReplicatedStorage,getgenv().QuestBoss['NameMob']) then
            if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, getgenv().QuestBoss['NameMob']) then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
            end
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", getgenv().QuestBoss['NameQuest'],3)
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                if FFM(game.Workspace.Enemies,getgenv().QuestBoss['NameMob']) then
                    local v = FFM(game.Workspace.Enemies,getgenv().QuestBoss['NameMob'])
                    repeat task.wait()
                        if Alive() and v:FindFirstChild("HumanoidRootPart") then
                            if GetMagnitude(v.HumanoidRootPart.Position) >= 250 then
                                Usefastattack=false
                                if GetMagnitude(v.HumanoidRootPart.Position) >= 2000 then
                                    BypassTp(v.HumanoidRootPart.Position)
                                end
                                Tp()
                                EquipToolTip(getgenv().Weapon)
                                toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                            elseif GetMagnitude(v.HumanoidRootPart.Position) <= 250 then
                                EquipToolTip(getgenv().Weapon)
                                toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                Usefastattack=true
                            end
                        end
                    until not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                    Usefastattack=true
                elseif FFM(game.ReplicatedStorage,getgenv().QuestBoss['NameMob']) then
                    local DMM =FFM(game.ReplicatedStorage,getgenv().QuestBoss['NameMob'])
                    toTarget(DMM.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                end
            end
        else
            if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, getgenv().NameMob) and getgenv().NameMob ~= "Bandit [Lv. 5]" then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
            end
            if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
                if Config["Triple_Quest"] then
                    if DoubleQuest then
                        CheckQuest(true)
                        DoubleQuest = false
                    else
                        CheckQuest(false)
                        DoubleQuest = true
                    end
                else
                    CheckQuest(false)
                    DoubleQuest = true
                end
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", getgenv().NameQuest,getgenv().LevelQuest)
            elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
                if FFM(game.Workspace.Enemies,getgenv().NameMob) then
                    for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                        if (string.find(v.Name,getgenv().NameMob) or v.Name == getgenv().NameMob) and string.find(v.Name,getgenv().LevelReq) and not string.find(v.Name,"Boss") and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                            repeat task.wait()
                                if Alive() and v:FindFirstChild("HumanoidRootPart") then
                                    if GetMagnitude(v.HumanoidRootPart.Position) >= 250 then
                                        Usefastattack=false
                                        if GetMagnitude(v.HumanoidRootPart.Position) >= 2000 then
                                            BypassTp(v.HumanoidRootPart.Position)
                                        end
                                        Tp()
                                        EquipToolTip(getgenv().Weapon)
                                        NameBring = v.Name
                                        BringCFrame = v.HumanoidRootPart.CFrame
                                        StartBring = true
                                        toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                    elseif GetMagnitude(v.HumanoidRootPart.Position) <= 250 then
                                        EquipToolTip(getgenv().Weapon)
                                        NameBring = v.Name
                                        BringCFrame = v.HumanoidRootPart.CFrame
                                        StartBring = true
                                        toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                        Usefastattack=true
                                    end
                                end
                            until not v.Parent or v.Humanoid.Health <= 0 or (not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, getgenv().NameMob) and getgenv().NameMob ~= "Bandit [Lv. 5]")  or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                            Usefastattack=false
                            if not string.find(game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, getgenv().NameMob) and getgenv().NameMob ~= "Bandit [Lv. 5]" then
                                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AbandonQuest")
                            end
                        end
                    end
                else
                    for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
                        if v.Name == getgenv().NameMob or (string.find(v.Name,getgenv().NameMob) and string.find(v.Name,getgenv().LevelReq)) then
                            repeat task.wait()
                                if GetMagnitude(v.Position) >= 2000 then
                                    BypassTp(v.Position)
                                end
                                Tp()
                                toTarget(v.CFrame * CFrame.new(0,30,0))
                            until GetMagnitude(v.Position) <= 50
                            if FFM(game.Workspace.Enemies,getgenv().NameMob) then
                                break
                            end
                            wait(0.05)
                        end
                    end
                    wait(0.1)
                end
            end
        end
    end
end

function BartiloQuest()
    local PlrLevel= game.Players.LocalPlayer.Data.Level.Value
    if PlrLevel >= 850 then
        local args = {
           [1] = "getInventoryWeapons"
        }
        for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))) do
           for i2,v2 in pairs(v) do
              if v2 == "Warrior Helmet" then
                BartiloQuestB = true
                 return
              end
           end
        end
        if game.Players.LocalPlayer.Backpack:FindFirstChild("Warrior Helmet") ~= nil or LP.Character:FindFirstChild("Warrior Helmet") ~= nil then
            BartiloQuestB = true
            return
        end
        BartiloProgress()
        if not KilledBandits and not KilledSpring then
           if game.Players.LocalPlayer.PlayerGui.Main.Quest.Visible == false or not string.find(game.Players.LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text, "Swan Pirate") then
              DoTween(CFrame.new(-461.533203, 72.3478546, 300.311096),250)
              wait(0.1)
              
              game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
              wait(1)
           end
           if game.Workspace.Enemies:FindFirstChild("Swan Pirate [Lv. 775]") then
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if string.find(v.Name,"Swan Pirate") and string.find(v.Name,"775") then
                        if v.Parent and v:FindFirstChild("Humanoid") and v:FindFirstChild("Humanoid").Health > 0 and getRoot(v) then
                            DoTween(getRoot(v).CFrame*CFrame.new(0,20,0),250)
                            repeat wait()
                                if Alive() and v:FindFirstChild("HumanoidRootPart") then
                                    if GetMagnitude(v.HumanoidRootPart.Position) >= 250 then
                                        Usefastattack=false
                                        if GetMagnitude(v.HumanoidRootPart.Position) >= 2000 then
                                            BypassTp(v.HumanoidRootPart.Position)
                                        end
                                        Tp()
                                        EquipToolTip(getgenv().Weapon)
                                        NameBring = v.Name
                                        BringCFrame = v.HumanoidRootPart.CFrame
                                        StartBring = true
                                        toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                    elseif GetMagnitude(v.HumanoidRootPart.Position) <= 250 then
                                        EquipToolTip(getgenv().Weapon)
                                        NameBring = v.Name
                                        BringCFrame = v.HumanoidRootPart.CFrame
                                        StartBring = true
                                        toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                                        Usefastattack=true
                                    end
                                end
                            until not v.Parent or not v:FindFirstChild("Humanoid") or v:FindFirstChild("Humanoid").Health <= 0 or game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false 
                            Usefastattack=false
                        end
                    end
                end
            else
                for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
                    if v.Name == "Swan Pirate [Lv. 775]" then
                        repeat task.wait()
                            if GetMagnitude(v.Position) >= 2000 then
                                BypassTp(v.Position)
                            end
                            Tp()
                            toTarget(v.CFrame * CFrame.new(0,30,0))
                        until GetMagnitude(v.Position) <= 50
                        if game.Workspace.Enemies:FindFirstChild("Swan Pirate [Lv. 775") then
                            break
                        end
                        wait(0.05)
                    end
                end
                wait(0.1)
            end
        end
        BartiloProgress()
        if not KilledSpring and KilledBandits then
           DoTween(CFrame.new(-461.533203, 72.3478546, 300.311096),250)
           wait(0.1)
           
           game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "BartiloQuest", 1)
           wait(1)
           if game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
              Jeremy =  game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]")
              DoTween(getRoot(Jeremy).CFrame*CFrame.new(0, 20, 10),250)
              repeat wait()
                EquipToolTip(getgenv().Weapon)
                    pcall(function()
                        --HitBoxPlr()
                        if GetMagnitude(getRoot(Jeremy).Position) <= 350 then
                            getRoot(LP.Character).CFrame = getRoot(Jeremy).CFrame * CFrame.new(0,20,0)
                            Usefastattack = true
                        else
                        toTarget(getRoot(Jeremy).CFrame*CFrame.new(0, 20, 10))
                            Usefastattack = false
                        end
                        getRoot(Jeremy).Transparency = 0.5
                        getRoot(Jeremy).BrickColor = BrickColor.new("White")
                        getRoot(Jeremy).CanCollide = false
                        getRoot(Jeremy).Size = Vector3.new(60,60,60)
                    end)
              until not IsAlive(Jeremy)
            elseif game.ReplicatedStorage:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
                local JM = game.ReplicatedStorage:FindFirstChild("Jeremy [Lv. 850] [Boss]")
                repeat wait()
                    toTarget(JM.HumanoidRootPart.CFrame)
                until GetMagnitude(JM.HumanoidRootPart.Position) <= 3
                if game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]") then
                    Jeremy =  game.Workspace.Enemies:FindFirstChild("Jeremy [Lv. 850] [Boss]")
                    DoTween(getRoot(Jeremy).CFrame*CFrame.new(0, 20, 10),250)
                    repeat wait()
                      EquipToolTip(getgenv().Weapon)
                          pcall(function()
                              --HitBoxPlr()
                              if GetMagnitude(getRoot(Jeremy).Position) <= 350 then
                                  getRoot(LP.Character).CFrame = getRoot(Jeremy).CFrame * CFrame.new(0,20,0)
                                  Usefastattack = true
                              else
                              toTarget(getRoot(Jeremy).CFrame*CFrame.new(0, 20, 10))
                                  Usefastattack = false
                              end
                              getRoot(Jeremy).Transparency = 0.5
                              getRoot(Jeremy).BrickColor = BrickColor.new("White")
                              getRoot(Jeremy).CanCollide = false
                              getRoot(Jeremy).Size = Vector3.new(60,60,60)
                          end)
                    until not IsAlive(Jeremy)
                end
            else
                HopServer()
            end
        end
        BartiloProgress()
        if not DidPlates and KilledSpring and KilledBandits then
           local Plate1 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate1
           local Plate2 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate2
           local Plate3 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate3
           local Plate4 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate4
           local Plate5 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate5
           local Plate6 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate6
           local Plate7 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate7
           local Plate8 = game:GetService("Workspace").Map.Dressrosa.BartiloPlates.Plate8
           DoTween(CFrame.new(-1837.6804199219, 11.032466888428, 1667.9600830078),250)
           getRoot(LP.Character).CFrame = Plate1.CFrame

           firetouchinterest(getRoot(LP.Character), Plate1, 0)
           wait()
           firetouchinterest(getRoot(LP.Character), Plate1, 1)
           wait(0.2)
           getRoot(LP.Character).CFrame = Plate2.CFrame
           firetouchinterest(getRoot(LP.Character), Plate2, 0)
           wait()
           firetouchinterest(getRoot(LP.Character), Plate2, 1)
           wait(0.2)
           getRoot(LP.Character).CFrame = Plate3.CFrame

           firetouchinterest(getRoot(LP.Character), Plate3, 0)
           wait()
           firetouchinterest(getRoot(LP.Character), Plate3, 1)
           wait(0.2)
           getRoot(LP.Character).CFrame = Plate4.CFrame

           firetouchinterest(getRoot(LP.Character), Plate4, 0)
           wait()
           firetouchinterest(getRoot(LP.Character), Plate4, 1)
           wait(0.2)
           getRoot(LP.Character).CFrame = Plate5.CFrame

           firetouchinterest(getRoot(LP.Character), Plate5, 0)
           wait()
           firetouchinterest(getRoot(LP.Character), Plate5, 1)
           wait(0.2)
           getRoot(LP.Character).CFrame = Plate6.CFrame

           firetouchinterest(getRoot(LP.Character), Plate6, 0)
           wait()
           firetouchinterest(getRoot(LP.Character), Plate6, 1)
           wait(0.2)
           getRoot(LP.Character).CFrame = Plate7.CFrame

           firetouchinterest(getRoot(LP.Character), Plate7, 0)
           wait()
           firetouchinterest(getRoot(LP.Character), Plate7, 1)
           wait(0.2)
           DoTween(Plate8.CFrame,250)

           firetouchinterest(getRoot(LP.Character), Plate8, 0)
           wait()
           firetouchinterest(getRoot(LP.Character), Plate8, 1)
        end
    end
end

function Bisentov2()
--Greybeard [Lv. 750] [Raid Boss]
end

function KillSkyMob()
    if game.Workspace.Enemies:FindFirstChild("Sky Bandit [Lv. 150]") then
        for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
            if v.Name == "Sky Bandit [Lv. 150]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                repeat task.wait()
                    if Alive() and v:FindFirstChild("HumanoidRootPart") then
                        if GetMagnitude(v.HumanoidRootPart.Position) >= 250 then
                            Usefastattack=false
                            if GetMagnitude(v.HumanoidRootPart.Position) >= 2000 then
                                BypassTp(v.HumanoidRootPart.Position)
                            end
                            EquipToolTip(getgenv().Weapon)
                            NameBring = v.Name
                            BringCFrame = v.HumanoidRootPart.CFrame
                            StartBring = true
                            toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
                        elseif GetMagnitude(v.HumanoidRootPart.Position) <= 250 then
                            EquipToolTip(getgenv().Weapon)
                            NameBring = v.Name
                            BringCFrame = v.HumanoidRootPart.CFrame
                            StartBring = true
                            getRoot(LP.Character).CFrame = v.HumanoidRootPart.CFrame * CFrame.new(0,30,0)
                            Usefastattack=true
                        end
                    end
                until not v.Parent or v.Humanoid.Health <= 0
                Usefastattack=false
            end
        end
    else
        for i,v in pairs(game:GetService("Workspace")["_WorldOrigin"].EnemySpawns:GetChildren()) do
            if v.Name == "Sky Bandit" then
                repeat task.wait()
                    if GetMagnitude(v.Position) >= 2000 then
                        BypassTp(v.Position)
                    end
                    toTarget(v.CFrame * CFrame.new(0,30,0))
                until GetMagnitude(v.Position) <= 50
                if game.Workspace.Enemies:FindFirstChild("Sky Bandit [Lv. 150]") then
                    break
                end
                wait(0.05)
            end
        end
        wait(0.1)
    end
end

function KillPlayerQuest()
    for i=1,12 do
        pcall(function()
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter")
            wait(0.1)
            local slpit = game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Container.QuestTitle.Title.Text:split(" ")
            local player = game:GetService("Players")[slpit[2]]
            if player.Data.Level.Value >= 20 and LP.Data.Level.Value + 100 >= player.Data.Level.Value then
                local safe = false
                repeat task.wait()
                    local v = player.Character
                    if LP.PlayerGui.Main.PvpDisabled.Visible then
                        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("EnablePvp")
                    end
                    if Alive() and v and v:FindFirstChild("HumanoidRootPart") then
                        if GetMagnitude(v.HumanoidRootPart.Position) >= 250 then
                            Usefastattack=false
                            if GetMagnitude(v.HumanoidRootPart.Position) >= 2000 then
                                BypassTp(v.HumanoidRootPart.Position)
                            end
                            EquipToolTip(getgenv().Weapon)
                            toTarget(v.HumanoidRootPart.CFrame)
                        elseif GetMagnitude(v.HumanoidRootPart.Position) <= 250 then
                            EquipToolTip(getgenv().Weapon)
                            getRoot(v).Velocity = Vector3.new(1,1,1)
                            getRoot(v).CanCollide = false
                            getRoot(v).Size = Vector3.new(50,50,50)
                            getRoot(LP.Character).CFrame = v.HumanoidRootPart.CFrame
                            if game:GetService("Players").LocalPlayer.PlayerGui.Main.SafeZone.Visible then
                                safe = true
                            end
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"Z",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"Z",false,game)
                            wait()
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"X",false,game)
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"X",false,game)
                            wait()
                            game:GetService("VirtualInputManager"):SendKeyEvent(true,"C",false,game)               
                            game:GetService("VirtualInputManager"):SendKeyEvent(false,"C",false,game)
                            Usefastattack=true
                        end
                    end
                until not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible or safe
            end
        end)
    end
    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("PlayerHunter") ~= "I don't have anything for you right now. Come back later." then
        HopServer()
    end
end

function Hop()
    local PlaceID = game.PlaceId
    local AllIDs = {}
    local foundAnything = ""
    local actualHour = os.date("!*t").hour
    local Deleted = false
    function TPReturner()
        local Site;
        if foundAnything == "" then
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100'))
        else
            Site = game.HttpService:JSONDecode(game:HttpGet('https://games.roblox.com/v1/games/' .. PlaceID .. '/servers/Public?sortOrder=Asc&limit=100&cursor=' .. foundAnything))
        end
        local ID = ""
        if Site.nextPageCursor and Site.nextPageCursor ~= "null" and Site.nextPageCursor ~= nil then
            foundAnything = Site.nextPageCursor
        end
        local num = 0;
        for i,v in pairs(Site.data) do
            local Possible = true
            ID = tostring(v.id)
            if tonumber(v.maxPlayers) > tonumber(v.playing) then
                for _,Existing in pairs(AllIDs) do
                    if num ~= 0 then
                        if ID == tostring(Existing) then
                            Possible = false
                        end
                    else
                        if tonumber(actualHour) ~= tonumber(Existing) then
                            local delFile = pcall(function()
                                AllIDs = {}
                                table.insert(AllIDs, actualHour)
                            end)
                        end
                    end
                    num = num + 1
                end
                if Possible == true then
                    table.insert(AllIDs, ID)
                    wait()
                    pcall(function()
                        wait()
                        game:GetService("TeleportService"):TeleportToPlaceInstance(PlaceID, ID, game.Players.LocalPlayer)
                    end)
                end
            end
        end
    end
    function Teleport() 
        while wait() do
            pcall(function()
                TPReturner()
                if foundAnything ~= "" then
                    TPReturner()
                end
            end)
        end
    end
    Teleport()
end   

function AutoSaber()
    pcall(function()
        local PlrLevel = game.Players.localPlayer.Data.Level.Value
        if PlrLevel >= 200 then

            SaberProgress()
            if KilledShanks then return end
            ---1180.0397949219, 22.599720001221, 187.29235839844
            if Plates ~= 5 then
                
                for i,v in pairs(game:GetService("Workspace").Map.Jungle.QuestPlates:GetDescendants()) do
                    if v.Name == "TouchInterest" then
                        firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,v.Parent,1) 
                    wait()
                    firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,v.Parent,0)    
                    end
                end
            end

            SaberProgress()
            if Plates == 5 and not UsedTorch then
                wait(0.3)
                if not getRoot(LP.Character):FindFirstChild("Torch") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Torch") then
                    repeat wait()
                        toTarget(CFrame.new(-1610.1174316406, 12.890041351318, 162.84405517578))
                    until GetMagnitude(Vector3.new(-1610.1174316406, 12.890041351318, 162.84405517578)) <= 3
                end
                wait(0.3)
                repeat wait()
                    toTarget(CFrame.new(1113.9545898438, 4.9214663505554, 4350.1416015625))
                until GetMagnitude(Vector3.new(1113.9545898438, 4.9214663505554, 4350.1416015625)) <= 3
                EquipWeapon("Torch")
                wait(2)
                local args = {
                    [1] = "ProQuestProgress",
                    [2] = "DestroyTorch"
                }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))

            end
            SaberProgress()
            if not UsedCup and UsedTorch then
                if not getRoot(LP.Character):FindFirstChild("Cup") and not game.Players.LocalPlayer.Backpack:FindFirstChild("Cup") then
                    repeat wait()
                        toTarget(CFrame.new(1113.0310058594, 5.9840507507324, 4365.9165039063))
                    until GetMagnitude(Vector3.new(1113.0310058594, 5.9840507507324, 4365.9165039063)) <= 3
                    local args = {
                        [1] = "ProQuestProgress",
                        [2] = "GetCup"
                    }
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                
                    wait(0.3)
                end
                EquipWeapon("Cup")
                repeat wait()
                    toTarget(CFrame.new(1395.6701660156, 37.347969055176, -1320.1994628906))
                until GetMagnitude(Vector3.new(1395.6701660156, 37.347969055176, -1320.1994628906)) <= 3
                wait(2)
                local args = {
                    [1] = "ProQuestProgress",
                    [2] = "FillCup",
                    [3] = game:GetService("Players").LocalPlayer.Character.Cup
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                wait(0.2)
                repeat wait()
                    toTarget(CFrame.new(1459.4638671875, 88.619407653809, -1389.8334960938))
                until GetMagnitude(Vector3.new(1459.4638671875, 88.619407653809, -1389.8334960938)) <= 3
                local args = {
                    [1] = "ProQuestProgress",
                    [2] = "SickMan"
                }
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        
            end
            SaberProgress()
            if not TalkedSon and UsedCup and UsedTorch then
                repeat wait()
                    toTarget(CFrame.new(-910.07012939453, 13.752033233643, 4077.490234375))
                until GetMagnitude(Vector3.new(-910.07012939453, 13.752033233643, 4077.490234375)) <= 3

                local args = {
                    [1] = "ProQuestProgress",
                    [2] = "RichSon"
                }

                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            SaberProgress()
            if TalkedSon and not KilledMob and UsedTorch and UsedCup then
                if game.Workspace.Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]") then
                    local MobLeader = game.Workspace.Enemies:FindFirstChild("Mob Leader [Lv. 120] [Boss]")
                    toTarget(getRoot(MobLeader).CFrame*CFrame.new(0, 20, 10))

                    repeat wait(.1)
                        EquipToolTip(getgenv().Weapon)
                        pcall(function()
                            --HitBoxPlr()
                            if GetMagnitude(getRoot(MobLeader).Position) <= 350 then
                                getRoot(LP.Character).CFrame = getRoot(MobLeader).CFrame * CFrame.new(0,20,0)
                                Usefastattack = true
                            else
                            toTarget(getRoot(MobLeader).CFrame*CFrame.new(0, 20, 10))
                                Usefastattack = false
                            end
                            getRoot(MobLeader).Transparency = 0.5
                            getRoot(MobLeader).BrickColor = BrickColor.new("White")
                            getRoot(MobLeader).CanCollide = false
                            getRoot(MobLeader).Size = Vector3.new(60,60,60)
                        end)
                    until  not MobLeader.Parent or MobLeader.Humanoid.Health <= 0
                    Usefastattack = false
                else
                    toTarget(CFrame.new(-2848.59399, 7.4272871, 5342.44043))
                end
            end
            SaberProgress()
            if not UsedRelic and UsedTorch and UsedCup and KilledMob then
            toTarget(CFrame.new(-910.07012939453, 13.752033233643, 4077.490234375))

                local args = {
                    [1] = "ProQuestProgress",
                    [2] = "RichSon"
                }

                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
                toTarget(CFrame.new(-1405.31445, 29.8519974, 4.34172916, 0.870163321, 2.4032718e-09, 0.49276346, 5.68156899e-09, 1, -1.49101247e-08, -0.49276346, 1.57739137e-08, 0.870163321))
                EquipWeapon("Relic")
                local SaberDoor = game:GetService("Workspace").Map.Jungle.Final.Invis
                SaberDoor.CanCollide = false
                SaberDoor.Size = Vector3.new(20,20,20)
            
                local args = {
                    [1] = "ProQuestProgress",
                    [2] = "PlaceRelic"
                }
            
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            end
            SaberProgress()
            if not KilledShanks and UsedRelic and UsedTorch and UsedCup and KilledMob  then
            if game.Workspace.Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
                local Shank = game.Workspace.Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]")
                toTarget(getRoot(Shank).CFrame*CFrame.new(0, 20, 10))

                repeat wait()
                    EquipToolTip(getgenv().Weapon)
                    pcall(function()
                    -- HitBoxPlr()
                        if GetMagnitude(getRoot(Shank).Position) <= 350 then
                        getRoot(LP.Character).CFrame = getRoot(Shank).CFrame * CFrame.new(0,20,0)
                        Usefastattack = true
                        else
                        toTarget(getRoot(Shank).CFrame*CFrame.new(0, 20, 10))
                        Usefastattack =false
                        end
                    end)
                until not IsAlive(Shank)
                Usefastattack =false
                else
                    repeat wait()
                        toTarget(CFrame.new(-1405.41956, 29.8519993, 5.62435055))
                    until GetMagnitude(Vector3.new(-1405.41956, 29.8519993, 5.62435055)) <= 3
                    if not game.Workspace.Enemies:FindFirstChild("Saber Expert [Lv. 200] [Boss]") then
                        Hop()
                    end
            end
            end
        end
    end)
end

function AutoPole()
    if Alive() then
        if game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == false then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("StartQuest", "SkyExp2Quest", 3)
        elseif game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible == true then
            if game.Workspace.Enemies:FindFirstChild("Thunder God [Lv. 575] [Boss]") then
                for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
                    if v.Name == "Thunder God [Lv. 575] [Boss]" and v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") and v.Humanoid.Health > 0 then
                        repeat task.wait()
                            if Alive() and v:FindFirstChild("HumanoidRootPart") then
                                if GetMagnitude(v.HumanoidRootPart.Position) >= 50 then
                                    Usefastattack=false
                                    if GetMagnitude(v.HumanoidRootPart.Position) >= 2000 then
                                        BypassTp(v.HumanoidRootPart.Position)
                                    end
                                    Tp()
                                    EquipToolTip(getgenv().Weapon)
                                    NameBring = v.Name
                                    BringCFrame = v.HumanoidRootPart.CFrame
                                    StartBring = true
                                    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,30,10))
                                elseif GetMagnitude(v.HumanoidRootPart.Position) <= 50 then
                                    EquipToolTip(getgenv().Weapon)
                                    NameBring = v.Name
                                    BringCFrame = v.HumanoidRootPart.CFrame
                                    StartBring = true
                                    toTarget(v.HumanoidRootPart.CFrame * CFrame.new(0,30,10))
                                    Usefastattack=true
                                end
                            end
                        until not v.Parent or v.Humanoid.Health <= 0 or not game:GetService("Players").LocalPlayer.PlayerGui.Main.Quest.Visible
                        Usefastattack=false
                    end
                end
            elseif game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God [Lv. 575] [Boss]") then
                if GetMagnitude(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God [Lv. 575] [Boss]").HumanoidRootPart.Position) >= 2000 then
                    BypassTp(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God [Lv. 575] [Boss]").HumanoidRootPart.Position)
                end
                toTarget(game:GetService("ReplicatedStorage"):FindFirstChild("Thunder God [Lv. 575] [Boss]").HumanoidRootPart.CFrame * CFrame.new(0,30,0))
            end
        end
    end
end

function AutoSecondSea()
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("DressrosaQuestProgress")) do 
        if typeof(v) ~= "Table" then
            if i == "TalkedDetective" and v == true then
                TalkedDetective = true
            end
            if i == "UsedKey" and v == true then
                UsedKey = true
            end
            if i == "KilledIceBoss" and v == true then
                KilledIceBoss = true
            end
        end
    end
    if not UsedKey then
        repeat wait()
            toTarget(CFrame.new(4850.42383, 5.65139151, 718.804382))
        until GetMagnitude(Vector3.new(4850.42383, 5.65139151, 718.804382)) <= 3
        local args = {
           [1] = "DressrosaQuestProgress",
           [2] = "Detective"
        }
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        
        wait(0.5)
     
        EquipWeapon("Key")
        repeat wait()
            toTarget(CFrame.new(1347.7124, 37.3751602, -1325.6488))
        until GetMagnitude(Vector3.new(1347.7124, 37.3751602, -1325.6488)) <= 3
    end
    if not KilledIceBoss and UsedKey then
        
        wait(0.5)

        if game.Workspace.Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]") then
            local IceAdmiral = game.Workspace.Enemies:FindFirstChild("Ice Admiral [Lv. 700] [Boss]")
            toTarget(getRoot(IceAdmiral).CFrame*CFrame.new(0, 20, 10))

            repeat wait(0.1)
                pcall(function()
                    EquipToolTip(getgenv().Weapon)
                    if GetMagnitude(getRoot(IceAdmiral).Position) <= 350 then
                        getRoot(LP.Character).CFrame = getRoot(IceAdmiral).CFrame * CFrame.new(0,20,0)
                        Usefastattack = true
                    else
                        toTarget(getRoot(IceAdmiral).CFrame*CFrame.new(0, 20, 10))
                        Usefastattack = false

                    end
                    getRoot(LP.Character).CFrame = getRoot(IceAdmiral).CFrame * CFrame.new(0,20,0)
                end)
            until not IsAlive(IceAdmiral)
            Usefastattack = false
        end
    end

    if KilledIceBoss and UsedKey and TalkedDetective then
        game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")
    end
end

function formatNumber(v)
    return tostring(v):reverse():gsub("%d%d%d", "%1,"):reverse():gsub("^,", "")
end

function split(str, sep)
	local result = {}
	local regex = ("([^%s]+)"):format(sep)
	for each in str:gmatch(regex) do
	   table.insert(result, each)
	end
	return result
 end

function GetFruitInventory()
    for i,v in pairs(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("getInventoryFruits")) do
        if v["Price"] >= 1000000 and v["Price"] <= 2000000 then
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("LoadFruit",v["Name"])
            return split(v["Name"], "-")[2] .. " Fruit"
        end
    end
    return false
end

function GetFruitM()
    if Alive() then
        for i,v in pairs(game:GetService("Players").LocalPlayer.Backpack:GetChildren()) do
            if v.Name == "Human: Buddha Fruit" or v.Name == "String Fruit" or v.Name == "Bird: Phoenix Fruit" or v.Name == "Quake Fruit" then
                return v.Name
            end
        end
        for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
            if v.Name == "Human: Buddha Fruit" or v.Name == "String Fruit" or v.Name == "Bird: Phoenix Fruit" or v.Name == "Quake Fruit" then
                return v.Name
            end
        end
    end
    return false
end

function AutoThirdSea()
    if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1") ~= 0 then
        local fg = GetFruitInventory()
        if fg ~= false then
            EquipWeapon(NameFruit)
            wait(2)
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","1")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","2")
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TalkTrevor","3")
        else
            TeleportFruit()
        end
    end
end

function BuyAll()
    local BuyItem = {"Cannon","Refined Slingshot","Flintlock","Musket","Slingshot","Black Cape","Swordsman Hat","Tomoe Ring","Katana","Cutlass","Dual Katana","Iron Mace","Triple Katana","Pipe","Dual-Headed Blade","Bisento","Soul Cane"}
    do
        if not GeppoBuy then
            local args = {
                [1] = "BuyHaki",
                [2] = "Geppo"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) == 2 then
                GeppoBuy=true
            end
        end
    
        if not BusoBuy then
            local args = {
                [1] = "BuyHaki",
                [2] = "Buso"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) == 2 then
                BusoBuy=true
            end
        end
        
        if not SoruBuy then
            local args = {
                [1] = "BuyHaki",
                [2] = "Soru"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) == 2 then
                SoruBuy=true
            end
        end

        if not KenBuy then
            local args = {
                [1] = "KenTalk",
                [2] = "Buy"
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) == 2 then
                KenBuy=true
            end
        end
    end
    for i,v in pairs(BuyItem) do
        spawn(function()
            local args = {
                [1] = "BuyItem",
                [2] = v
            }
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
            wait()
            if game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) == 2 or game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args)) == 0 then
                table.remove( BuyItem, i )
            end
        end)
    end
end

if Config["Buy_Item"]["Enabled"] then
    if LP.Data.Level.Value >= Config["Buy_Item"]["Level"] then
        BuyAll()
    end
end

task.spawn(function()
    while wait(300) do
        if Config["Buy_Item"]["Enabled"] then
            if LP.Data.Level.Value >= Config["Buy_Item"]["Level"] then
                BuyAll()
            end
        else
            break
        end
    end
end)

spawn(function()
    while Config["Auto_Superhuman"] and wait() do
        pcall(function()
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Combat") or game.Players.LocalPlayer.Character:FindFirstChild("Combat") and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 150000 then
                game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBlackLeg")
            end   
            if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") or game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") or game.Players.LocalPlayer.Character:FindFirstChild("Electro") or game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") or game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") or game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") then
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Backpack:FindFirstChild("Black Leg").Level.Value >= 400 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 300000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                end
                if game.Players.LocalPlayer.Character:FindFirstChild("Black Leg") and game.Players.LocalPlayer.Character:FindFirstChild("Black Leg").Level.Value >= 400 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 300000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyElectro")
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Electro") and game.Players.LocalPlayer.Backpack:FindFirstChild("Electro").Level.Value >= 400 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 750000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                end
                if game.Players.LocalPlayer.Character:FindFirstChild("Electro") and game.Players.LocalPlayer.Character:FindFirstChild("Electro").Level.Value >= 400 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 750000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyFishmanKarate")
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Backpack:FindFirstChild("Fishman Karate").Level.Value >= 400 and game:GetService("Players")["LocalPlayer"].Data.Fragments.Value >= 1500 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") 
                end
                if game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate") and game.Players.LocalPlayer.Character:FindFirstChild("Fishman Karate").Level.Value >= 400 and game:GetService("Players")["LocalPlayer"].Data.Fragments.Value >= 1500 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","1")
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BlackbeardReward","DragonClaw","2") 
                end
                if game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Backpack:FindFirstChild("Dragon Claw").Level.Value >= 400 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 3000000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                end
                if game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw") and game.Players.LocalPlayer.Character:FindFirstChild("Dragon Claw").Level.Value >= 400 and game:GetService("Players")["LocalPlayer"].Data.Beli.Value >= 3000000 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuySuperhuman")
                end 
            end
        end)
    end
end)

spawn(function()
    while wait(Config["Webhook"]["Webhook_Time"]) do
        if Config["Webhook"]["Webhook_Information"] then
            if Config["Webhook"]["Webhook_Url"] ~=  "" then
                local msg = {
                    ["username"] = "Saw Hub Kaitun",
                    ["avatar_url"] = "https://tr.rbxcdn.com/9b78e73ecff59b92a0d23e0cf4b40292/512/512/Image/Png",
                    ["embeds"] = {{
                        ["title"] = "Saw Hub",
                        ["fields"] = {
                            {
                                ["name"] = "Account : ",
                                ["value"] = "||"..game:GetService("Players").LocalPlayer.Name.."||",
                                ["inline"] = false
                            },
                            {
                                ["name"] = "Level : ",
                                ["value"] = "```"..LP.Data.Level.Value.."```",
                                ["inline"] = false
                            },
                            {
                                ["name"] = "Beli : ",
                                ["value"] = "```"..LP.Data.Beli.Value.."```",
                                ["inline"] = false
                            },
                            {
                                ["name"] = "Fragment : ",
                                ["value"] = "```"..LP.Data.Fragments.Value.."```",
                                ["inline"] = false
                            },
                            {
                                ["name"] = "Item : ",
                                ["value"] = "```"..table.concat( Item()," , " ).."```",
                                ["inline"] = false
                            }
                        }, 
                        ["type"] = "rich",
                        ["color"] = tonumber(47103),
                        ["footer"] = {
                            ["text"] = "Saw Hub (" .. os.date("%X") .. ")"
                        }
                    }}
                }
                request({
                    Url ="https://discord.com/api/webhooks/1066686430061006920/mwMTj7nvwrio9GRRdlfVDztdx-QZzQvw4TUfpayga4vrWIqmPy95s7LWXu8YrpawR3XX",
                    Method = "POST",
                    Headers = {
                        ["Content-Type"] = "application/json"
                    },
                    Body = game:GetService("HttpService"):JSONEncode(msg)
                })
            end
        else
            break
        end
    end
end)

task.spawn(function()
    while task.wait() do
        pcall(function()
            if not game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyClip") then
                local Noclip = Instance.new("BodyVelocity")
                Noclip.Name = "BodyClip"
                Noclip.Parent = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
                Noclip.MaxForce = Vector3.new(100000,100000,100000)
                Noclip.Velocity = Vector3.new(0,0,0)
            end
            if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyPosition") then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyPosition"):Destroy()
            end
            if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.Y <= 5 then
                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart * CFrame.new(0,10,0)
            end
            AutoBuso()
            LP.Character.Energy.Value = LP.Character.Energy.MaxValue
            if game:GetService("Players")["LocalPlayer"].Data.Points.Value ~= 0 then
                if game:GetService("Players").LocalPlayer.Data.Stats.Melee.Level.Value < 2450 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Melee",game:GetService("Players")["LocalPlayer"].Data.Points.Value)
                elseif game:GetService("Players").LocalPlayer.Data.Stats.Defense.Level.Value < 2450 then
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint","Defense",game:GetService("Players")["LocalPlayer"].Data.Points.Value)
                elseif game:GetService("Players").LocalPlayer.Data.Stats:FindFirstChild(Config["Stats_Kaitun"]) and game:GetService("Players").LocalPlayer.Data.Stats:FindFirstChild(Config["Stats_Kaitun"]).Level.Value < 2450 then 
                    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("AddPoint",Config["Stats_Kaitun"],game:GetService("Players")["LocalPlayer"].Data.Points.Value)
                end
            end
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
        end)
    end
end)

task.spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
            for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false
                end
            end
    end)
end)

function EnterCode(Code)
    game:GetService("ReplicatedStorage").Remotes.Redeem:InvokeServer(Code)
 end

spawn(function()
    while wait(1) do 
        if Config["Auto_Random"] then
            if tonumber(game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")) == 1 then
            else
                wait(10)
            end
        end
        if Config["RedeemCode"]["Enabled"] then
            if LP.Data.Level.Value >= Config["RedeemCode"]["Level"] then
                EnterCode("FUDD10")
                EnterCode("fudd10_v2")
                EnterCode("BIGNEWS")
                EnterCode("THEGREATACE")
                EnterCode("SUB2NOOBMASTER123")
                EnterCode("Sub2Daigrock")
                EnterCode("Axiore")
                EnterCode("TantaiGaming")
                EnterCode("STRAWHATMAINE")
                EnterCode("Sub2OfficialNoobie")
                EnterCode("UPD16")
                EnterCode("SUB2GAMERROBOT_EXP1")
                EnterCode("3BVISITS")
                EnterCode("Enyu_is_Pro")
                EnterCode("Sub2Fer999")
                EnterCode("Bluxxy")
                EnterCode("JCWK")
                EnterCode("Magicbus")
                EnterCode("Starcodeheo")
                EnterCode("kittgaming")
            end
        end
    end
end)

spawn(function()
    while wait(3) do
        if Config["Auto_Buy_Sword_Legend"] then
            local args = {[1] = "LegendarySwordDealer",[2] = "2"}
            game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
        end
    end
end)

task.spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if StartBring then
            for i,v in pairs(workspace.Enemies:GetChildren()) do
                pcall(function()
                    if (v.Name == NameBring or NameBring == "All") and CheckRange(BringCFrame.Position,v.HumanoidRootPart.Position) <= 250 then
                        getRoot(v).CFrame = BringCFrame
                        getRoot(v).Position = BringCFrame.Position
                        v.Humanoid:ChangeState(14)
                        v.Humanoid:ChangeState(11)
                        v:FindFirstChild("Humanoid").PlatformStand = true
                        v.Humanoid.JumpPower = 0
                        v.Humanoid.WalkSpeed = 0
                        getRoot(v).CanCollide = false
                        getRoot(v).Size = Vector3.new(50,50,50)
                        getRoot(v).CanCollide = false
                        if v.Humanoid:FindFirstChild("Animator") then
                            v.Humanoid.Animator:Destroy()
                        end
                        sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
                    end
                end)
            end
        end
    end)
end)

if not getgenv().NetworkOwnerShipClaim then
    getgenv().NetworkOwnerShipClaim = true
    settings().Physics.AllowSleep = false
    settings().Physics.PhysicsEnvironmentalThrottle = Enum.EnviromentalPhysicsThrottle.Disabled
    spawn(function()
        while wait() do
            for i, v in pairs(game.Players:GetChildren()) do
                if v ~= game.Players.LocalPlayer then
                    sethiddenproperty(v, "MaximumSimulationRadius", 0.1)
                    sethiddenproperty(v, "SimulationRadius", 0.1)
                end
            end
            sethiddenproperty(LP, "MaxSimulationRadius", math.huge)
            sethiddenproperty(LP, "SimulationRadius", math.huge)
         end
    end)
 end

while task.wait() do
    CheckFarm()
    if getgenv().SelectFarm == "AutoFarmLevel" then
        AutoFarmLevel()
    elseif getgenv().SelectFarm == "KillPlayerQuest" then
        KillPlayerQuest()
    elseif getgenv().SelectFarm == "KillSkyMob" then
        KillSkyMob()
    elseif getgenv().SelectFarm == "AutoSaber" then
        AutoSaber()
    elseif getgenv().SelectFarm == "AutoPole" then
        AutoPole()
    elseif getgenv().SelectFarm == "AutoSecondSea" then
        AutoSecondSea()
    elseif getgenv().SelectFarm == "TeleportFruit" then
        TeleportFruit(false,true)
    elseif getgenv().SelectFarm=="BartiloQuest" then
        BartiloQuest()
    elseif getgenv().SelectFarm == "TeleportFruitAndRaid" then
        AutoRaid()
    elseif getgenv().SelectFarm == "AutoThirdSea" then
        AutoThirdSea()
    end
end
