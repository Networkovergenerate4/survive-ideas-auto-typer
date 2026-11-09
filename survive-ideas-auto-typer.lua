-- ============================================================
-- Survive Your Ideas | Touch-Optimized GUI v6.0
-- Fully Draggable, High-Feedback Touch Buttons, Auto-Typer
-- Compatible with Delta Mobile & mobile executors
-- ============================================================

local Players           = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService      = game:GetService("TweenService")
local UserInputService  = game:GetService("UserInputService")
local lp                = Players.LocalPlayer

-- ============================================================
-- WORD DATABASE
-- ============================================================
local CATEGORIES = {
    {
        name  = "Disasters",
        icon  = "💥",
        color = Color3.fromRGB(240, 70, 70),
        words = {
            "Lava","Tsunami","acid","Black Hole","black_hole",
            "Earthquake","fire","flood","Meteor","apocalypse",
            "Fallout","satellite","Epidemic","epidemia","enxurrada",
            "rumbling","quicksand","supernova","titanic","Tornado",
            "volcano","zone","boulder","alien","Nuke"
        }
    },
    {
        name  = "Weather",
        icon  = "🌤️",
        color = Color3.fromRGB(70, 170, 250),
        words = {
            "BLACKOUT","Blind","clear","Dark","day","fog",
            "hail","heat","horror","ice","lightning","night",
            "rain","Sand Shower","sandstorm","sky","snow",
            "storm","sunset","wind"
        }
    },
    {
        name  = "Animals",
        icon  = "🐾",
        color = Color3.fromRGB(90, 210, 110),
        words = {
            "Dinosaur","Godzilla","King Kong","kingkong","Maxwell",
            "ant","bear","bees","capybara","cat","chicken",
            "cockroach","cow","crab","crocodile","dog","elephant",
            "fish","frog","goose","jellyfish","lion","locust",
            "monkey","moodeng","mosquito","octopus","penguin",
            "pig","rabbit","rat","shark","sheep","snake",
            "spider","whale","wolf","worm"
        }
    },
    {
        name  = "Monsters",
        icon  = "👾",
        color = Color3.fromRGB(180, 80, 240),
        words = {
            "Killer","Silent Head","Titan","Zombies","zombie",
            "angel","animatronic","clown","devil","dragon",
            "fairy","ghost","giant","gnome","herobrine",
            "invisible","kaiju","leprechaun","mahoraga","monster",
            "mummy","nextbot","ninja","noob","ogre","pirate",
            "reaper","robot","scp","seek","sirenhead","skeleton",
            "skinwalker","slenderman","slime","unicorn","vampire",
            "verity","werewolf","wizard"
        }
    },
    {
        name  = "Nature",
        icon  = "🌿",
        color = Color3.fromRGB(40, 200, 130),
        words = {
            "DESERT","autumn","bamboo","beach","beanstalk",
            "bush","cactus","cave","fireflies","flowers",
            "geyser","grass","island","jungle","mountain",
            "mud","oasis","prehistoric","pumpkin","savanna",
            "swamp","tree","tundra","underwater","water","waterfall"
        }
    },
    {
        name  = "Objects",
        icon  = "🛋️",
        color = Color3.fromRGB(240, 170, 60),
        words = {
            "Jack In The Box","jackbox","Lucky Block","lucky_block",
            "anvil","ball","balloons","bathtub","bed","bike",
            "boat","book","bouncy castle","bouncycastle","bowling",
            "box","btools","bubble","bus","button","car",
            "chair","chest","computer","cones","confetti",
            "conveyor","diamond","dominoes","door","duck",
            "exit","firefighter","fireworks","firetruck",
            "fountain","gift","glue","go kart","gokart",
            "hamster ball","hamster_ball","hat","helicopter",
            "jenga","kite","ladder","lamp","launchpad","lego",
            "magnet","medkit","money","oil","ok","paper",
            "parachute","pendulum","piano","picnic","pinata",
            "plane","poo","raft","rollercoaster","sandbags",
            "scarecrow","snowman","spikes","stairs","sussy",
            "table","tires","train","treasure","tv","umbrella",
            "wall","zipline"
        }
    },
    {
        name  = "Places",
        icon  = "🏠",
        color = Color3.fromRGB(250, 140, 50),
        words = {
            "Gas Station","gasstation","The Upside Down","upside_down",
            "Water Slide","waterslide","aquarium","backrooms",
            "barn","basketball","bridge","brookhaven","building",
            "camping","carousel","castle","christmas","church",
            "cinema","city","dream","easter","farm","festajunina",
            "ferris wheel","ferriswheel","graveyard","greenhouse",
            "halloween","heaven","hell","hospital","house",
            "igloo","jail","kitchen","lighthouse","mansion",
            "matrix","maze","moai","museum","neon","obby",
            "ohio","playground","pyramid","pyramidsofgeza",
            "roblox hq","safehouse","sandcastle","school",
            "skatepark","space","stadium","stonehenge",
            "supermarket","teacups","temple","tower","trash",
            "treehouse","western","windmill","zoo"
        }
    },
    {
        name  = "Food",
        icon  = "🍔",
        color = Color3.fromRGB(240, 200, 50),
        words = {
            "Bacon","Barbecue","Food","Potato","Tacos",
            "WATERMELON","banana","churrasco","icecreamtruck"
        }
    },
    {
        name  = "Weapons",
        icon  = "⚔️",
        color = Color3.fromRGB(220, 60, 60),
        words = {
            "Baseball Bat","Double Barrel","Flamethrower",
            "Frying Pan","G3","Katana","Knife","Luger",
            "Magnum","MP5","Pickaxe","Railgun","Rainbow Gun",
            "Remington","Revolver","Road Roller","roadroller",
            "RPG","Saw","Shield","Sniper","Snowball","Spencer",
            "Steamgun","Sword","airstrike","bomb","gun",
            "landmine","laser","melee","tank","Nuke"
        }
    },
    {
        name  = "Memes/Powers",
        icon  = "✨",
        color = Color3.fromRGB(255, 110, 190),
        words = {
            "Ballerina Cappuccina","Don't Stop","Falling Blocks",
            "falling_blocks","FORCEFIELD","GO","GOKU","GOD",
            "IDLE","POOP","RONALDO","Time Stop","time_stop",
            "Tung Tung Tung Sahur","Upside Down","SUKUNA","TOJI",
            "PICNIC+TREX","67","afk","angry","arise","aura",
            "baby","ballerina","bankai","ban","bonk","bruh",
            "chillguy","chimpanzini","crazy","cry","dad",
            "dance","darkclone","delete","die","dizzy",
            "domain","energy_blast","error","ez","fall",
            "fart","flash","fly","freeze","gg","gojo",
            "gravity","guest","hero","hi","hunger","idk",
            "jump","kaioken","kill","king","laugh","lirili",
            "love","luffy","me","minecraft","mom","mrbeast",
            "nani","naruto","neymar","nokia","normal","nothing",
            "nyan","oof","paint","patapim","peace","person",
            "pikachu","pillows","please","push","quiet",
            "rasengan","reset","retro","revive","rizz",
            "saitama","sans","santa","scream","sharingan",
            "shield","shrink","sigma","sit","siuuu","size",
            "skibidi","sky_letter","sleep","slow","snap",
            "sneeze","sorry","speed","spin","spiderman",
            "star","swap","tanjiro","teleport","tralalero",
            "trippi","troll","tung","up","upside","vomit",
            "walk","what","win","wow","Y"
        }
    },
    {
        name  = "Commands",
        icon  = "⚡",
        color = Color3.fromRGB(140, 90, 255),
        words = {
            "/double", "/secret", "/lag", "/undo", "/ghost", "/jackpot",
            "/admin", "/reset", "/chaos", "/god"
        }
    }
}

-- ============================================================
-- SMART AUTO-TYPER & SENDER
-- ============================================================
local function findActiveTextBox()
    for _, gui in ipairs(lp.PlayerGui:GetDescendants()) do
        if gui:IsA("TextBox") and gui.Visible and gui.TextEditable then
            return gui
        end
    end
    return nil
end

local function findSendButton()
    for _, gui in ipairs(lp.PlayerGui:GetDescendants()) do
        if gui:IsA("TextButton") and gui.Visible then
            local text = gui.Text:lower()
            if text:find("send") or text:find("submit") or text:find("enter") then
                return gui
            end
        end
    end
    return nil
end

local function typeAndSend(word)
    local textBox = findActiveTextBox()
    if textBox then
        pcall(function()
            textBox:CaptureFocus()
            task.wait(0.02)
            textBox.Text = word
            task.wait(0.02)
            textBox:ReleaseFocus(true)
            
            local sendBtn = findSendButton()
            if sendBtn then
                task.wait(0.03)
                for _, conn in ipairs(getconnections(sendBtn.MouseButton1Click)) do
                    conn:Fire()
                end
            end
        end)
        print("[SYI] Auto-typed & Sent: " .. word)
    else
        warn("[SYI] Active text box not found! Open your writing prompt box first.")
    end
end

-- ============================================================
-- GUI BUILDER
-- ============================================================
local function buildGUI()
    local old = lp.PlayerGui:FindFirstChild("SYI_GUI_V6")
    if old then old:Destroy() end

    local sg = Instance.new("ScreenGui")
    sg.Name            = "SYI_GUI_V6"
    sg.ResetOnSpawn    = false
    sg.DisplayOrder    = 9999
    sg.IgnoreGuiInset  = true
    sg.Parent          = lp.PlayerGui

    -- Float Launcher Button (Draggable via Touch)
    local toggleBtn = Instance.new("TextButton")
    toggleBtn.Size              = UDim2.new(0, 56, 0, 56)
    toggleBtn.Position          = UDim2.new(0, 16, 0.45, 0)
    toggleBtn.BackgroundColor3  = Color3.fromRGB(16, 18, 26)
    toggleBtn.BorderSizePixel   = 0
    toggleBtn.Text              = "⚡"
    toggleBtn.TextColor3        = Color3.fromRGB(0, 230, 255)
    toggleBtn.TextSize          = 26
    toggleBtn.Font              = Enum.Font.GothamBold
    toggleBtn.ZIndex            = 100
    toggleBtn.Parent            = sg
    Instance.new("UICorner", toggleBtn).CornerRadius = UDim.new(0, 16)
    
    local toggleStroke = Instance.new("UIStroke")
    toggleStroke.Color = Color3.fromRGB(45, 50, 70)
    toggleStroke.Thickness = 2.5
    toggleStroke.Parent = toggleBtn

    -- Main Panel
    local mainFrame = Instance.new("Frame")
    mainFrame.Name              = "MainFrame"
    mainFrame.Size              = UDim2.new(0, 440, 0, 310)
    mainFrame.Position          = UDim2.new(0.5, -220, 0.5, -155)
    mainFrame.BackgroundColor3  = Color3.fromRGB(12, 13, 18)
    mainFrame.BorderSizePixel   = 0
    mainFrame.Visible           = false -- Starts closed, click trigger to open
    mainFrame.ZIndex            = 10
    mainFrame.Parent            = sg
    Instance.new("UICorner", mainFrame).CornerRadius = UDim.new(0, 18)
    
    local mainStroke = Instance.new("UIStroke")
    mainStroke.Color = Color3.fromRGB(35, 40, 55)
    mainStroke.Thickness = 1.8
    mainStroke.Parent = mainFrame

    -- Header Frame (Draggable Drag Bar)
    local header = Instance.new("Frame")
    header.Size             = UDim2.new(1, 0, 0, 48)
    header.BackgroundColor3 = Color3.fromRGB(18, 20, 30)
    header.BorderSizePixel  = 0
    header.ZIndex           = 11
    header.Parent           = mainFrame
    Instance.new("UICorner", header).CornerRadius = UDim.new(0, 18)

    local headerTitle = Instance.new("TextLabel")
    headerTitle.Size               = UDim2.new(0, 160, 1, 0)
    headerTitle.Position           = UDim2.new(0, 16, 0, 0)
    headerTitle.BackgroundTransparency = 1
    headerTitle.TextColor3         = Color3.fromRGB(240, 245, 255)
    headerTitle.TextSize           = 15
    headerTitle.Font               = Enum.Font.GothamBold
    headerTitle.TextXAlignment     = Enum.TextXAlignment.Left
    headerTitle.Text               = "⚡ SURVIVE IDEAS"
    headerTitle.ZIndex             = 12
    headerTitle.Parent             = header

    -- Search Box
    local searchBox = Instance.new("TextBox")
    searchBox.Size              = UDim2.new(0, 170, 0, 30)
    searchBox.Position          = UDim2.new(1, -210, 0, 9)
    searchBox.BackgroundColor3  = Color3.fromRGB(25, 28, 42)
    searchBox.BorderSizePixel   = 0
    searchBox.PlaceholderText   = "🔍 Search word..."
    searchBox.PlaceholderColor3 = Color3.fromRGB(120, 125, 145)
    searchBox.Text              = ""
    searchBox.TextColor3        = Color3.fromRGB(240, 240, 255)
    searchBox.TextSize          = 12
    searchBox.Font              = Enum.Font.Gotham
    searchBox.ClearTextOnFocus  = false
    searchBox.ZIndex            = 13
    searchBox.Parent            = header
    Instance.new("UICorner", searchBox).CornerRadius = UDim.new(0, 8)

    -- Close Button
    local closeBtn = Instance.new("TextButton")
    closeBtn.Size               = UDim2.new(0, 30, 0, 30)
    closeBtn.Position           = UDim2.new(1, -36, 0, 9)
    closeBtn.BackgroundColor3   = Color3.fromRGB(235, 60, 70)
    closeBtn.BorderSizePixel    = 0
    closeBtn.Text               = "✕"
    closeBtn.TextColor3         = Color3.fromRGB(255, 255, 255)
    closeBtn.TextSize           = 14
    closeBtn.Font               = Enum.Font.GothamBold
    closeBtn.ZIndex             = 13
    closeBtn.Parent             = header
    Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)

    -- Make Window Draggable for Touch Devices
    local dragging, dragInput, dragStart, startPos
    header.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = mainFrame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
            local delta = input.Position - dragStart
            mainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)

    -- Left Sidebar for Category Tabs
    local sideBar = Instance.new("ScrollingFrame")
    sideBar.Size                 = UDim2.new(0, 125, 1, -48)
    sideBar.Position             = UDim2.new(0, 0, 0, 48)
    sideBar.BackgroundColor3     = Color3.fromRGB(14, 15, 22)
    sideBar.BorderSizePixel      = 0
    sideBar.ScrollBarThickness   = 2
    sideBar.ScrollBarImageColor3 = Color3.fromRGB(60, 65, 85)
    sideBar.AutomaticCanvasSize  = Enum.AutomaticSize.Y
    sideBar.ZIndex               = 11
    sideBar.Parent               = mainFrame

    local sideLayout = Instance.new("UIListLayout")
    sideLayout.SortOrder        = Enum.SortOrder.LayoutOrder
    sideLayout.Padding          = UDim.new(0, 5)
    sideLayout.Parent           = sideBar

    local sidePad = Instance.new("UIPadding")
    sidePad.PaddingLeft         = UDim.new(0, 5)
    sidePad.PaddingRight        = UDim.new(0, 5)
    sidePad.PaddingTop          = UDim.new(0, 8)
    sidePad.PaddingBottom       = UDim.new(0, 8)
    sidePad.Parent              = sideBar

    -- Word Display Grid View
    local wordDisplay = Instance.new("ScrollingFrame")
    wordDisplay.Size                 = UDim2.new(1, -125, 1, -48)
    wordDisplay.Position             = UDim2.new(0, 125, 0, 48)
    wordDisplay.BackgroundTransparency = 1
    wordDisplay.BorderSizePixel      = 0
    wordDisplay.ScrollBarThickness   = 5
    wordDisplay.ScrollBarImageColor3 = Color3.fromRGB(70, 75, 100)
    wordDisplay.AutomaticCanvasSize  = Enum.AutomaticSize.Y
    wordDisplay.ZIndex               = 11
    wordDisplay.Parent               = mainFrame

    local gridLayout = Instance.new("UIGridLayout")
    gridLayout.CellSize             = UDim2.new(0.5, -6, 0, 38)
    gridLayout.CellPadding          = UDim2.new(0, 6, 0, 6)
    gridLayout.SortOrder            = Enum.SortOrder.LayoutOrder
    gridLayout.Parent               = wordDisplay

    local gridPad = Instance.new("UIPadding")
    gridPad.PaddingLeft             = UDim.new(0, 8)
    gridPad.PaddingRight            = UDim.new(0, 8)
    gridPad.PaddingTop              = UDim.new(0, 8)
    gridPad.PaddingBottom           = UDim.new(0, 10)
    gridPad.Parent                  = wordDisplay

    local activeCatBtn = nil
    local wordButtons = {}

    local function populateCategory(catData)
        for _, item in ipairs(wordDisplay:GetChildren()) do
            if item:IsA("TextButton") then item:Destroy() end
        end
        wordButtons = {}

        for idx, word in ipairs(catData.words) do
            local wBtn = Instance.new("TextButton")
            wBtn.BackgroundColor3   = Color3.fromRGB(20, 22, 32)
            wBtn.BorderSizePixel    = 0
            wBtn.Text               = word
            wBtn.TextColor3         = Color3.fromRGB(225, 230, 245)
            wBtn.TextSize           = 13
            wBtn.Font               = Enum.Font.Gotham
            wBtn.TextTruncate       = Enum.TextTruncate.AtEnd
            wBtn.LayoutOrder        = idx
            wBtn.ZIndex             = 12
            wBtn.Parent             = wordDisplay
            Instance.new("UICorner", wBtn).CornerRadius = UDim.new(0, 8)

            local accent = Instance.new("Frame")
            accent.Size             = UDim2.new(0, 3.5, 1, -10)
            accent.Position         = UDim2.new(0, 3, 0, 5)
            accent.BackgroundColor3 = catData.color
            accent.BorderSizePixel  = 0
            accent.ZIndex           = 13
            accent.Parent           = wBtn
            Instance.new("UICorner", accent).CornerRadius = UDim.new(0, 2)

            -- High feedback touch animation
            wBtn.MouseButton1Click:Connect(function()
                TweenService:Create(wBtn, TweenInfo.new(0.06), {BackgroundColor3 = Color3.fromRGB(0, 210, 110)}):Play()
                typeAndSend(word)
                task.wait(0.1)
                TweenService:Create(wBtn, TweenInfo.new(0.2), {BackgroundColor3 = Color3.fromRGB(20, 22, 32)}):Play()
            end)

            table.insert(wordButtons, {button = wBtn, text = word:lower()})
        end
    end

    for cIdx, cat in ipairs(CATEGORIES) do
        local catTab = Instance.new("TextButton")
        catTab.Size             = UDim2.new(1, 0, 0, 36)
        catTab.BackgroundColor3 = Color3.fromRGB(18, 20, 28)
        catTab.BorderSizePixel  = 0
        catTab.Text             = cat.icon .. " " .. cat.name
        catTab.TextColor3       = Color3.fromRGB(165, 170, 190)
        catTab.TextSize         = 12
        catTab.Font             = Enum.Font.GothamBold
        catTab.TextXAlignment   = Enum.TextXAlignment.Left
        catTab.LayoutOrder      = cIdx
        catTab.ZIndex           = 12
        catTab.Parent           = sideBar
        Instance.new("UICorner", catTab).CornerRadius = UDim.new(0, 8)

        local tabPad = Instance.new("UIPadding")
        tabPad.PaddingLeft = UDim.new(0, 10)
        tabPad.Parent = catTab

        catTab.MouseButton1Click:Connect(function()
            if activeCatBtn then
                TweenService:Create(activeCatBtn, TweenInfo.new(0.15), {
                    BackgroundColor3 = Color3.fromRGB(18, 20, 28),
                    TextColor3 = Color3.fromRGB(165, 170, 190)
                }):Play()
            end
            activeCatBtn = catTab
            TweenService:Create(catTab, TweenInfo.new(0.15), {
                BackgroundColor3 = cat.color,
                TextColor3 = Color3.fromRGB(255, 255, 255)
            }):Play()

            searchBox.Text = ""
            populateCategory(cat)
        end)

        if cIdx == 1 then
            activeCatBtn = catTab
            catTab.BackgroundColor3 = cat.color
            catTab.TextColor3 = Color3.fromRGB(255, 255, 255)
            populateCategory(cat)
        end
    end

    searchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local query = searchBox.Text:lower():gsub("%s+", "")
        if query == "" then
            for _, item in ipairs(wordButtons) do item.button.Visible = true end
            return
        end

        for _, item in ipairs(wordButtons) do
            item.button.Visible = item.text:find(query, 1, true) ~= nil
        end
    end)

    -- Smooth Open/Close Toggle Animation
    local isOpen = false
    toggleBtn.MouseButton1Click:Connect(function()
        isOpen = not isOpen
        if isOpen then
            mainFrame.Visible = true
            mainFrame.Size = UDim2.new(0, 0, 0, 0)
            TweenService:Create(mainFrame, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
                Size = UDim2.new(0, 440, 0, 310)
            }):Play()
            toggleBtn.Text = "✕"
        else
            TweenService:Create(mainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0)
            }):Play()
            task.wait(0.2)
            mainFrame.Visible = false
            toggleBtn.Text = "⚡"
        end
    end)

    closeBtn.MouseButton1Click:Connect(function()
        if isOpen then
            isOpen = false
            TweenService:Create(mainFrame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
                Size = UDim2.new(0, 0, 0, 0)
            }):Play()
            task.wait(0.2)
            mainFrame.Visible = false
            toggleBtn.Text = "⚡"
        end
    end)
end

buildGUI()
print("[SYI v6.0] Touch-Optimized GUI Loaded Successfully.")
