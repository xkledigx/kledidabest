local library = loadstring(game:HttpGet('https://raw.githubusercontent.com/cypherdh/VanisUILIB/main/.gitignore'))()

local Window = library:CreateWindow("Kledi", "dabest", 10044538000)

local Tab = Window:CreateTab("Scripts")

local Page = Tab:CreateFrame("main")

Button = Page:CreateButton("Button", "Description", function()
CreateNotification("Title", "Description", function(value)
if value == true then
print(true)
else
print(false)
end
end)
end)

Toggle = Page:CreateToggle("Toggle", "Description", function(arg)
Toggle:UpdateToggle("New Title", "New Description")
print(arg)
end)

Bind = Page:CreateBind("KeyBind", "F", function(arg)
Bind:UpdateBind("New Title")
print(arg)
end)

TextBox = Page:CreateBox("TextBox", 10044538000, function(arg)
TextBox:UpdateBox("New Title")
print(arg)
end)

Page:CreateSlider("Slider", 16, 500,function(arg)
   print(arg)
end)

Label = Page:CreateLabel("Label")
Label:UpdateLabel("New Title")

local Page = Tab:CreateFrame("AUTO TXT")

local Toggle = Page:CreateToggle("Auto Message", "A do me fol a jo", function(Value)
    Toggle:UpdateToggle("New Title", "New Description")
    repchat = Value
    
    local randomWords = {
        "Please Donate ME"
    }
    
    local chosenWord = ""
    local currentIndex = 1
     
    while repchat do
        if repchat then
            chosenWord = randomWords[currentIndex]
            game.ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(chosenWord, 'All')
            currentIndex = currentIndex % #randomWords + 1
        end
        wait(120)
    end
end)

local Page = Tab:CreateFrame("AUTO CLAIM BOOTH")

local Toggle = Page:CreateToggle("Auto Message", "Claims Booth automaicaly", function(Value)
    Toggle:UpdateToggle("New Title", "New Description")
      
local function findUnclaimed()
    for i, v in pairs(Players.LocalPlayer.PlayerGui.MapUIContainer.MapUI.BoothUI:GetChildren()) do
        if (v.Details.Owner.Text == "unclaimed") then
            table.insert(unclaimed, tonumber(string.match(tostring(v), "%d+")))
        end
    end
end
if not pcall(findUnclaimed) then
    serverHop()
end
local claimCount = #unclaimed
--Claim booth function
local function boothclaim()
    require(game.ReplicatedStorage.Remotes).Event("ClaimBooth"):InvokeServer(unclaimed[1])
    if not string.find(Players.LocalPlayer.PlayerGui.MapUIContainer.MapUI.BoothUI:FindFirstChild(tostring("BoothUI".. unclaimed[1])).Details.Owner.Text, Players.LocalPlayer.DisplayName) then
        task.wait(1)
        if not string.find(Players.LocalPlayer.PlayerGui.MapUIContainer.MapUI.BoothUI:FindFirstChild(tostring("BoothUI".. unclaimed[1])).Details.Owner.Text, Players.LocalPlayer.DisplayName) then
            error()
        end
    end
end
--Checks if booth claim fails
while not pcall(boothclaim) do
    if errCount >= claimCount then
        serverHop()
    end
    table.remove(unclaimed, 1)
    errCount = errCount + 1
end

hopSet()
--Walks to booth
game:GetService('VirtualInputManager'):SendKeyEvent(true, "LeftControl", false, game)
local Controls = require(Players.LocalPlayer.PlayerScripts:WaitForChild("PlayerModule")):GetControls()
Controls:Disable()
Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(booths[tostring(unclaimed[1])]:match("(.+), (.+), (.+)")))
local atBooth = false
local function noclip()
    for i,v in pairs(Players.LocalPlayer.Character:GetDescendants()) do
        if v:IsA("BasePart") then
            v.CanCollide = false
        end
    end
end
local noclipper = game:GetService("RunService").Stepped:Connect(noclip)
Players.LocalPlayer.Character.Humanoid.MoveToFinished:Connect(function(reached)
    atBooth = true
end)
while not atBooth do
    task.wait(.1)
    if Players.LocalPlayer.Character.Humanoid:GetState() == Enum.HumanoidStateType.Seated then
        Players.LocalPlayer.Character.Humanoid.Jump = true
    end
end
