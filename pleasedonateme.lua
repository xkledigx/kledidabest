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

Button = Page:CreateButtonfunction notify(msg)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    DrawNotification(true, false)
end

Citizen.CreateThread(function()
    
    local announcer = "Please Donate ME"
    local autoMessage = "Please Donate ME"
    
    while (true) do
        Citizen.Wait(120) -- Nachricht alle 10 Minuten
        TriggerEvent('chat:addMessage',{
          color = { 255, 0, 0},
          multiline = false,
          args = {announcer}
        })
        
        TriggerEvent('chat:addMessage',{
          color = { 255, 255, 255},
          multiline = false,
          args = {autoMessage}
        })
    end
end, false)
