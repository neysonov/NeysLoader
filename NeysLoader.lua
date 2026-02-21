local a = {Theme = "Elite", Themes = {["Elite"] = {Main = Color3.fromRGB(12, 12, 12), Sidebar = Color3.fromRGB(18, 18, 18), Accent = Color3.fromRGB(0, 255, 128), Text = Color3.fromRGB(255, 255, 255), TextDark = Color3.fromRGB(120, 122, 125), Element = Color3.fromRGB(25, 25, 25), Stroke = Color3.fromRGB(40, 42, 48)}}}
local b = a.Themes[a.Theme]
local c = {Settings = {Aim = {Enabled = false, TargetPart = "Head", FieldOfView = 150, Smoothing = 50, WallCheck = true, TeamCheck = false, ShowFOV = true}, Visuals = {ESP_Enabled = false, TeamColor = Color3.fromRGB(0, 255, 120), EnemyColor = Color3.fromRGB(255, 40, 40)}, UI = {ToggleKey = Enum.KeyCode.K, Visible = false}}}
local d = game:GetService("Players")
local e = game:GetService("RunService")
local f = game:GetService("UserInputService")
local g = game:GetService("CoreGui")
local h = game:GetService("TweenService")
local i = d.LocalPlayer
local j = workspace.CurrentCamera

local FOVCircle = Drawing.new("Circle")
FOVCircle.Thickness = 1
FOVCircle.NumSides = 100
FOVCircle.Radius = c.Settings.Aim.FieldOfView
FOVCircle.Filled = false
FOVCircle.Visible = false
FOVCircle.Color = b.Accent

local function k(l) if gethui then l.Parent = gethui() else l.Parent = g end end

local function ClearChams()
    for _, p in pairs(d:GetPlayers()) do
        if p.Character then
            for _, v in pairs(p.Character:GetDescendants()) do
                if v:IsA("BoxHandleAdornment") and v.Name == "NeysEliteCham" then
                    v:Destroy()
                end
            end
        end
    end
end

local function ApplyChams(p)
    if not p.Character or not c.Settings.Visuals.ESP_Enabled then return end
    local char = p.Character
    local color = (p.Team == i.Team) and c.Settings.Visuals.TeamColor or c.Settings.Visuals.EnemyColor
    for _, part in pairs(char:GetChildren()) do
        if part:IsA("BasePart") and not part:FindFirstChild("NeysEliteCham") then
            local cham = Instance.new("BoxHandleAdornment")
            cham.Name = "NeysEliteCham"
            cham.Size = part.Size
            cham.Adornee = part
            cham.AlwaysOnTop = true
            cham.ZIndex = 10
            cham.Transparency = 0.5
            cham.Color3 = color
            cham.Parent = part
        elseif part:IsA("BasePart") and part:FindFirstChild("NeysEliteCham") then
            part.NeysEliteCham.Color3 = color
        end
    end
end

local m = Instance.new("ScreenGui")
m.Name = "NL_V4_CORE"
m.IgnoreGuiInset = true
k(m)

local n = Instance.new("Frame")
n.Size = UDim2.new(0, 400, 0, 260)
n.Position = UDim2.new(0.5, -200, 0.5, -130)
n.BackgroundColor3 = b.Main
n.Parent = m
Instance.new("UICorner", n).CornerRadius = UDim.new(0, 12)
local nStroke = Instance.new("UIStroke", n)
nStroke.Color = b.Accent
nStroke.Thickness = 2

local o = Instance.new("TextLabel", n)
o.Size = UDim2.new(1, 0, 0, 60)
o.BackgroundTransparency = 1
o.Text = "NEYS LOADER"
o.TextColor3 = b.Accent
o.Font = Enum.Font.GothamBlack
o.TextSize = 24

local p = Instance.new("TextBox", n)
p.Size = UDim2.new(0.85, 0, 0, 45)
p.Position = UDim2.new(0.075, 0, 0.35, 0)
p.BackgroundColor3 = b.Element
p.TextColor3 = b.Text
p.PlaceholderText = "Введите ключ"
p.Text = ""
Instance.new("UICorner", p).CornerRadius = UDim.new(0, 8)

local q = Instance.new("TextButton", n)
q.Size = UDim2.new(0.4, 0, 0, 40)
q.Position = UDim2.new(0.075, 0, 0.65, 0)
q.BackgroundColor3 = b.Accent
q.Text = "ВОЙТИ"
q.Font = Enum.Font.GothamBold
q.TextSize = 14
Instance.new("UICorner", q).CornerRadius = UDim.new(0, 8)

local r = Instance.new("TextButton", n)
r.Size = UDim2.new(0.4, 0, 0, 40)
r.Position = UDim2.new(0.525, 0, 0.65, 0)
r.BackgroundColor3 = b.Element
r.Text = "ССЫЛКА"
r.TextColor3 = b.Accent
r.Font = Enum.Font.GothamBold
r.TextSize = 14
Instance.new("UICorner", r).CornerRadius = UDim.new(0, 8)

local s = Instance.new("Frame")
s.Size = UDim2.new(0, 620, 0, 400)
s.Position = UDim2.new(0.5, -310, 0.5, -200)
s.BackgroundColor3 = b.Main
s.Visible = false
s.Parent = m
Instance.new("UICorner", s).CornerRadius = UDim.new(0, 12)
local sStroke = Instance.new("UIStroke", s)
sStroke.Color = b.Accent
sStroke.Thickness = 2

local t = Instance.new("Frame", s)
t.Size = UDim2.new(0, 160, 1, 0)
t.BackgroundColor3 = b.Sidebar
Instance.new("UICorner", t).CornerRadius = UDim.new(0, 12)

local u = Instance.new("TextLabel", t)
u.Size = UDim2.new(1, 0, 0, 50)
u.BackgroundTransparency = 1
u.Text = "NEYS LOADER"
u.TextColor3 = b.Accent
u.Font = Enum.Font.GothamBlack
u.TextSize = 16

local v = Instance.new("Frame", s)
v.Size = UDim2.new(1, -180, 1, -20)
v.Position = UDim2.new(0, 170, 0, 10)
v.BackgroundTransparency = 1

local w = {}
local function x(y)
    local z = Instance.new("TextButton", t)
    z.Size = UDim2.new(0.85, 0, 0, 35)
    z.Position = UDim2.new(0.075, 0, 0, 60 + (#w * 42))
    z.BackgroundColor3 = b.Element
    z.Text = "  " .. y:upper()
    z.TextColor3 = b.TextDark
    z.Font = Enum.Font.GothamBold
    z.TextSize = 12
    z.TextXAlignment = Enum.TextXAlignment.Left
    Instance.new("UICorner", z).CornerRadius = UDim.new(0, 6)
    
    local A = Instance.new("ScrollingFrame", v)
    A.Size = UDim2.new(1, 0, 1, 0)
    A.BackgroundTransparency = 1
    A.Visible = false
    A.ScrollBarThickness = 0
    local B = Instance.new("UIListLayout", A)
    B.Padding = UDim.new(0, 8)
    
    z.MouseButton1Click:Connect(function()
        for C, D in pairs(w) do 
            h:Create(D.B, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {BackgroundColor3 = b.Element, TextColor3 = b.TextDark}):Play()
            D.P.Visible = false 
        end
        h:Create(z, TweenInfo.new(0.3, Enum.EasingStyle.Quart), {BackgroundColor3 = b.Accent, TextColor3 = Color3.new(0, 0, 0)}):Play()
        A.Visible = true
    end)
    table.insert(w, {B = z, P = A})
    return A
end

local function E(F, G, H, I)
    local J = Instance.new("Frame", F)
    J.Size = UDim2.new(1, 0, 0, 45)
    J.BackgroundColor3 = b.Element
    Instance.new("UICorner", J).CornerRadius = UDim.new(0, 8)
    local K = Instance.new("TextLabel", J)
    K.Size = UDim2.new(0.6, 0, 1, 0)
    K.Position = UDim2.new(0, 12, 0, 0)
    K.BackgroundTransparency = 1
    K.Text = G
    K.TextColor3 = b.Text
    K.Font = Enum.Font.GothamMedium
    K.TextSize = 14
    K.TextXAlignment = "Left"
    local L = Instance.new("TextButton", J)
    L.Size = UDim2.new(0, 36, 0, 20)
    L.Position = UDim2.new(1, -48, 0.5, -10)
    L.BackgroundColor3 = H and b.Accent or Color3.fromRGB(60, 60, 65)
    L.Text = ""
    Instance.new("UICorner", L).CornerRadius = UDim.new(1, 0)
    local M = Instance.new("Frame", L)
    M.Size = UDim2.new(0, 14, 0, 14)
    M.Position = H and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)
    M.BackgroundColor3 = Color3.new(1, 1, 1)
    Instance.new("UICorner", M).CornerRadius = UDim.new(1, 0)
    local N = H
    L.MouseButton1Click:Connect(function()
        N = not N
        h:Create(M, TweenInfo.new(0.25), {Position = N and UDim2.new(1, -17, 0.5, -7) or UDim2.new(0, 3, 0.5, -7)}):Play()
        h:Create(L, TweenInfo.new(0.25), {BackgroundColor3 = N and b.Accent or Color3.fromRGB(60, 60, 65)}):Play()
        I(N)
    end)
end

local function O(P, Q, R, S, T, U)
    local V = Instance.new("Frame", P)
    V.Size = UDim2.new(1, 0, 0, 60)
    V.BackgroundColor3 = b.Element
    Instance.new("UICorner", V).CornerRadius = UDim.new(0, 8)
    local W = Instance.new("TextLabel", V)
    W.Size = UDim2.new(0.5, 0, 0, 30)
    W.Position = UDim2.new(0, 12, 0, 5)
    W.BackgroundTransparency = 1
    W.Text = Q
    W.TextColor3 = b.Text
    W.Font = Enum.Font.Gotham
    W.TextSize = 13
    W.TextXAlignment = "Left"
    local X = Instance.new("TextLabel", V)
    X.Size = UDim2.new(0.4, 0, 0, 30)
    X.Position = UDim2.new(0.55, 0, 0, 5)
    X.BackgroundTransparency = 1
    X.Text = math.floor(T)
    X.TextColor3 = b.Accent
    X.Font = Enum.Font.GothamBold
    X.TextSize = 13
    X.TextXAlignment = "Right"
    local Y = Instance.new("Frame", V)
    Y.Size = UDim2.new(1, -24, 0, 4)
    Y.Position = UDim2.new(0, 12, 0, 40)
    Y.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    local Z = Instance.new("Frame", Y)
    Z.Size = UDim2.new((T - R) / (S - R), 0, 1, 0)
    Z.BackgroundColor3 = b.Accent
    local _ = Instance.new("TextButton", Y)
    _.Size = UDim2.new(1, 0, 2, 0)
    _.Position = UDim2.new(0, 0, -0.5, 0)
    _.BackgroundTransparency = 1
    _.Text = ""
    local a0 = false
    _.InputBegan:Connect(function(a1) if a1.UserInputType == Enum.UserInputType.MouseButton1 then a0 = true end end)
    f.InputEnded:Connect(function(a1) if a1.UserInputType == Enum.UserInputType.MouseButton1 then a0 = false end end)
    f.InputChanged:Connect(function(a1)
        if a0 and a1.UserInputType == Enum.UserInputType.MouseMovement then
            local a2 = math.clamp((a1.Position.X - Y.AbsolutePosition.X) / Y.AbsoluteSize.X, 0, 1)
            local a3 = R + (S - R) * a2
            X.Text = math.floor(a3)
            Z.Size = UDim2.new(a2, 0, 1, 0)
            U(a3)
        end
    end)
end

local a4 = x("Aim")
local a5 = x("Chams")
local a6 = x("Misc")

E(a4, "Включить Аим", false, function(v) c.Settings.Aim.Enabled = v end)
E(a4, "Проверка стен", true, function(v) c.Settings.Aim.WallCheck = v end)
E(a4, "Проверка команды", false, function(v) c.Settings.Aim.TeamCheck = v end)
E(a4, "Показать FOV", true, function(v) c.Settings.Aim.ShowFOV = v end)
O(a4, "Радиус FOV", 30, 800, 150, function(v) 
    c.Settings.Aim.FieldOfView = v 
    FOVCircle.Radius = v
end)
O(a4, "Сглаживание (%)", 0, 100, 50, function(v) c.Settings.Aim.Smoothing = v end)

E(a5, "Включить Чамсы", false, function(v) 
    c.Settings.Visuals.ESP_Enabled = v 
    if not v then ClearChams() end
end)

q.MouseButton1Click:Connect(function()
    if p.Text == "NeysLoader1332341438" then
        h:Create(n, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.In), {Position = UDim2.new(0.5, -200, 1.5, 0)}):Play()
        task.wait(0.5)
        n.Visible = false
        s.Visible = true
        c.Settings.UI.Visible = true
        h:Create(w[1].B, TweenInfo.new(0.3), {BackgroundColor3 = b.Accent, TextColor3 = Color3.new(0, 0, 0)}):Play()
        w[1].P.Visible = true
    else
        p.Text = ""
        p.PlaceholderText = "НЕВЕРНЫЙ КЛЮЧ"
    end
end)

r.MouseButton1Click:Connect(function() if setclipboard then setclipboard("https://link-center.net/3739383/6e7kLSh4kYPb") end end)

e.RenderStepped:Connect(function()
    if c.Settings.Aim.ShowFOV then
        FOVCircle.Visible = true
        FOVCircle.Position = f:GetMouseLocation()
    else
        FOVCircle.Visible = false
    end

    if c.Settings.Visuals.ESP_Enabled then
        for _, p in pairs(d:GetPlayers()) do
            if p ~= i then ApplyChams(p) end
        end
    end

    if c.Settings.Aim.Enabled then
        local target = nil
        local dist = c.Settings.Aim.FieldOfView
        local mouse = f:GetMouseLocation()
        
        for _, p in pairs(d:GetPlayers()) do
            if p ~= i and p.Character then
                if c.Settings.Aim.TeamCheck and p.Team == i.Team then continue end
                local part = p.Character:FindFirstChild(c.Settings.Aim.TargetPart)
                local hum = p.Character:FindFirstChildOfClass("Humanoid")
                if part and hum and hum.Health > 0 then
                    local screenPos, onScreen = j:WorldToViewportPoint(part.Position)
                    if onScreen then
                        local mag = (Vector2.new(screenPos.X, screenPos.Y) - mouse).Magnitude
                        if mag < dist then
                            if c.Settings.Aim.WallCheck then
                                local ray = j:GetPartsObscuringTarget({j.CFrame.Position, part.Position}, {i.Character, p.Character})
                                if #ray == 0 then target = part; dist = mag end
                            else
                                target = part; dist = mag
                            end
                        end
                    end
                end
            end
        end
        
        if target then
            local targetCF = CFrame.new(j.CFrame.Position, target.Position)
            local smoothAmount = math.clamp(1 - (c.Settings.Aim.Smoothing / 100), 0.01, 1)
            j.CFrame = j.CFrame:Lerp(targetCF, smoothAmount)
        end
    end
end)

f.InputBegan:Connect(function(k, g)
    if not g and k.KeyCode == c.Settings.UI.ToggleKey then
        c.Settings.UI.Visible = not c.Settings.UI.Visible
        s.Visible = c.Settings.UI.Visible
    end
end)

local dragStart, startPos, dragging
s.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = s.Position
    end
end)
f.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local delta = input.Position - dragStart
        s.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
f.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
end)
