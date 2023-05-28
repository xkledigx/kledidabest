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
