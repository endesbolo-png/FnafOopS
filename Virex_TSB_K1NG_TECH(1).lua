






-- VIREX UI + Virex Hub | Steal An Egg (solo funciones importantes)
-- leaked by the goat stinker leaker in sources hub 👑🤑🤑
-- leaked by stinker 
-- leaked by stinker 
-- leaked by stinker 
local VirexLib = (function()
--[[
	VIREX UI  ·  v1
	A LocalScript for your own Roblox experience.

	How to use (Roblox Studio):
	  1. StarterPlayer > StarterPlayerScripts > Insert Object > LocalScript
	  2. Paste this whole file into it and press Play.
	  3. RightShift (or the floating VIREX button on mobile) opens and closes the menu.

	Everything you may want to change is in CONFIG right below.
]]

local CONFIG = {
	ToggleKey = Enum.KeyCode.RightShift,
	Version = "v1",

	-- Fonts: Title is the big 3D text, Heading the small caps labels and tabs.
	-- Other good ones: "GothamBlack", "FredokaOne", "Bangers", "Sarpanch".
	Fonts = { Title = "LuckiestGuy", Heading = "LuckiestGuy" },

	-- Liquid glass follows the phone's tilt (accelerometer). On PC it follows the mouse.
	-- If the light moves the wrong way on your phone, flip these to true.
	Tilt = { Enabled = true, Strength = 3, InvertX = false, InvertY = false },
	LogoImage = "rbxassetid://107391174248131",

	-- The animated orb (made from the GIF). It floats over every background.
	Orb = { Image = "rbxassetid://115422258718188", Columns = 6, Rows = 6, Frames = 36, FPS = 18, Size = 1020 },

	DefaultTheme = "Noir",

	-- Sounds (Roblox built-in). Swap any of these for "rbxassetid://..." sounds from the Creator Store.
	Sounds = {
		Enabled = true,
		Volume = 0.6,
		Click = "rbxasset://sounds/clickfast.wav",
		Hover = "rbxasset://sounds/clickfast.wav",
		Toggle = "rbxasset://sounds/electronicpingshort.wav",
		Notify = "rbxasset://sounds/electronicpingshort.wav",
		Open = "rbxasset://sounds/swordlunge.wav",
		Close = "rbxasset://sounds/swordlunge.wav",
		Slam = "rbxasset://sounds/swordslash.wav",
		Slider = "rbxasset://sounds/electronicpingshort.wav", -- plays while dragging; pitch follows the value
		Boom = "rbxasset://sounds/swordslash.wav",
	},

	--[[ THEMES
		Background: "rbxassetid://..." photo behind the menu and the intro ("" = colour gradient only)
		Gif:        "rbxassetid://..." animated background (a sprite sheet made from a GIF). Wins over Background.
		            Frames / FPS: how many pictures the sheet has and how fast they play.
		Dim:        how dark the photo is (0 = fully visible, 1 = hidden)
		Accent / Accent2 / Hot: button, glow and border colours
		Panel / Card / Card2:  window and card colours
		Copy a block to add more themes. ]]
	Themes = {
		{ Name = "Noir", Background = "rbxassetid://95845335655412", Dim = 0.12,
			Accent = Color3.fromRGB(235, 236, 240), Accent2 = Color3.fromRGB(255, 255, 255), Hot = Color3.fromRGB(120, 122, 130),
			Panel = Color3.fromRGB(9, 9, 11), Card = Color3.fromRGB(20, 20, 24), Card2 = Color3.fromRGB(32, 32, 38) },
		{ Name = "Ice", Background = "rbxassetid://95845335655412", Dim = 0.12,
			Accent = Color3.fromRGB(47, 107, 255), Accent2 = Color3.fromRGB(169, 216, 255), Hot = Color3.fromRGB(255, 92, 170),
			Panel = Color3.fromRGB(10, 13, 24), Card = Color3.fromRGB(22, 28, 46), Card2 = Color3.fromRGB(32, 40, 64) },
		{ Name = "Violet", Background = "rbxassetid://109682858333398", Dim = 0.12,
			Accent = Color3.fromRGB(138, 76, 255), Accent2 = Color3.fromRGB(214, 190, 255), Hot = Color3.fromRGB(255, 120, 220),
			Panel = Color3.fromRGB(14, 10, 26), Card = Color3.fromRGB(30, 22, 50), Card2 = Color3.fromRGB(44, 32, 70) },
		{ Name = "Crimson", Background = "rbxassetid://103964167589822", Dim = 0.12,
			Accent = Color3.fromRGB(255, 60, 92), Accent2 = Color3.fromRGB(255, 185, 195), Hot = Color3.fromRGB(255, 170, 60),
			Panel = Color3.fromRGB(20, 8, 12), Card = Color3.fromRGB(40, 16, 24), Card2 = Color3.fromRGB(58, 24, 34) },
		{ Name = "Mint", Background = "rbxassetid://80469187866764", Dim = 0.12,
			Accent = Color3.fromRGB(30, 200, 140), Accent2 = Color3.fromRGB(170, 255, 220), Hot = Color3.fromRGB(80, 180, 255),
			Panel = Color3.fromRGB(7, 18, 16), Card = Color3.fromRGB(14, 36, 31), Card2 = Color3.fromRGB(20, 50, 44) },
		{ Name = "Sunset", Background = "rbxassetid://130939890430008", Dim = 0.12,
			Accent = Color3.fromRGB(255, 120, 50), Accent2 = Color3.fromRGB(255, 212, 155), Hot = Color3.fromRGB(255, 70, 140),
			Panel = Color3.fromRGB(22, 11, 9), Card = Color3.fromRGB(42, 23, 18), Card2 = Color3.fromRGB(58, 32, 24) },
		{ Name = "Void", Background = "", Dim = 0.12,
			Accent = Color3.fromRGB(160, 175, 215), Accent2 = Color3.fromRGB(240, 244, 252), Hot = Color3.fromRGB(110, 130, 255),
			Panel = Color3.fromRGB(7, 7, 11), Card = Color3.fromRGB(20, 20, 27), Card2 = Color3.fromRGB(32, 32, 42) },

		-- Motion backgrounds (sprite sheets made from GIFs). Columns/Rows/Width/Height only when the sheet is not 4 x 6.
		{ Name = "Orb", Gif = "rbxassetid://115422258718188", Frames = 36, FPS = 18, Columns = 6, Rows = 6, Width = 1020, Height = 1020, Dim = 0.05,
			Accent = Color3.fromRGB(235, 236, 240), Accent2 = Color3.fromRGB(255, 255, 255), Hot = Color3.fromRGB(120, 122, 130),
			Panel = Color3.fromRGB(6, 6, 8), Card = Color3.fromRGB(18, 18, 22), Card2 = Color3.fromRGB(30, 30, 36) },
		{ Name = "Ocean", Gif = "rbxassetid://92203048087211", Frames = 24, FPS = 12.5, Dim = 0.1,
			Accent = Color3.fromRGB(90, 190, 255), Accent2 = Color3.fromRGB(200, 240, 255), Hot = Color3.fromRGB(40, 120, 200),
			Panel = Color3.fromRGB(4, 14, 22), Card = Color3.fromRGB(8, 26, 38), Card2 = Color3.fromRGB(14, 40, 56) },
		{ Name = "Heaven", Gif = "rbxassetid://110550227129244", Frames = 24, FPS = 12.5, Dim = 0.1,
			Accent = Color3.fromRGB(120, 200, 255), Accent2 = Color3.fromRGB(255, 255, 255), Hot = Color3.fromRGB(80, 160, 230),
			Panel = Color3.fromRGB(12, 26, 44), Card = Color3.fromRGB(20, 40, 64), Card2 = Color3.fromRGB(30, 56, 86) },
		{ Name = "Stream", Gif = "rbxassetid://125722914688906", Frames = 19, FPS = 16.7, Dim = 0.1,
			Accent = Color3.fromRGB(150, 210, 110), Accent2 = Color3.fromRGB(230, 245, 200), Hot = Color3.fromRGB(240, 200, 110),
			Panel = Color3.fromRGB(10, 16, 8), Card = Color3.fromRGB(20, 30, 16), Card2 = Color3.fromRGB(30, 44, 24) },
		{ Name = "Inferno", Gif = "rbxassetid://116811530360656", Frames = 24, FPS = 11.2, Dim = 0.1,
			Accent = Color3.fromRGB(255, 170, 50), Accent2 = Color3.fromRGB(255, 230, 160), Hot = Color3.fromRGB(255, 90, 30),
			Panel = Color3.fromRGB(22, 12, 4), Card = Color3.fromRGB(40, 22, 8), Card2 = Color3.fromRGB(58, 32, 12) },
		{ Name = "Golden", Gif = "rbxassetid://86953866218071", Frames = 24, FPS = 11.7, Dim = 0.1,
			Accent = Color3.fromRGB(255, 210, 110), Accent2 = Color3.fromRGB(255, 245, 210), Hot = Color3.fromRGB(150, 210, 90),
			Panel = Color3.fromRGB(20, 16, 6), Card = Color3.fromRGB(36, 30, 12), Card2 = Color3.fromRGB(52, 44, 18) },
		{ Name = "Night", Gif = "rbxassetid://129010370853587", Frames = 12, FPS = 14.3, Dim = 0.05,
			Accent = Color3.fromRGB(220, 222, 228), Accent2 = Color3.fromRGB(255, 255, 255), Hot = Color3.fromRGB(130, 132, 140),
			Panel = Color3.fromRGB(10, 10, 12), Card = Color3.fromRGB(22, 22, 26), Card2 = Color3.fromRGB(34, 34, 40) },
		{ Name = "Black Hole", Gif = "rbxassetid://134072355345185", Frames = 24, FPS = 20, Dim = 0.05,
			Accent = Color3.fromRGB(235, 236, 240), Accent2 = Color3.fromRGB(255, 255, 255), Hot = Color3.fromRGB(110, 112, 120),
			Panel = Color3.fromRGB(4, 4, 6), Card = Color3.fromRGB(16, 16, 20), Card2 = Color3.fromRGB(28, 28, 34) },
		{ Name = "Forest", Gif = "rbxassetid://134614395274312", Frames = 24, FPS = 14.3, Dim = 0.1,
			Accent = Color3.fromRGB(240, 190, 80), Accent2 = Color3.fromRGB(255, 235, 170), Hot = Color3.fromRGB(170, 200, 70),
			Panel = Color3.fromRGB(18, 14, 4), Card = Color3.fromRGB(34, 28, 10), Card2 = Color3.fromRGB(48, 40, 16) },
	},
}

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")
local Workspace = game:GetService("Workspace")
local GuiService = game:GetService("GuiService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local WHITE, BLACK = Color3.new(1, 1, 1), Color3.new(0, 0, 0)
local Theme = {
	Bg = Color3.fromRGB(3, 4, 10),
	Text = Color3.fromRGB(244, 247, 252),
	Muted = Color3.fromRGB(150, 158, 178),
	Dark = Color3.fromRGB(8, 10, 18),
	Good = Color3.fromRGB(125, 255, 178),
	Bad = Color3.fromRGB(255, 107, 122),
}
local THEME_KEYS = { "Accent", "Accent2", "Hot", "Panel", "Card", "Card2" }
local currentTheme = CONFIG.Themes[1]
for _, t in ipairs(CONFIG.Themes) do
	if t.Name == CONFIG.DefaultTheme then currentTheme = t end
end
local function loadThemeColors(t)
	for _, k in ipairs(THEME_KEYS) do Theme[k] = t[k] end
end
loadThemeColors(currentTheme)

local function pickFont(name, fallback)
	local ok, f = pcall(function() return Enum.Font[name] end)
	return (ok and f) or fallback
end
local FONT_TITLE = pickFont((CONFIG.Fonts or {}).Title or "", Enum.Font.GothamBlack)
local FONT_HEAD = pickFont((CONFIG.Fonts or {}).Heading or "", Enum.Font.GothamBlack)
-- everything written in the title / heading font, so the font can be changed live
local fontTargets, epicTexts = {}, {}
local function fontProp(inst)
	table.insert(fontTargets, inst)
	return inst
end
local function setFonts(f)
	FONT_TITLE, FONT_HEAD = f, f
	for _, inst in ipairs(fontTargets) do if inst.Parent then inst.Font = f end end
	for _, et in ipairs(epicTexts) do if et.group.Parent then et.refont(f) end end
end

---------------------------------------------------------------------------
-- Helpers
---------------------------------------------------------------------------
local connections = {}
local function bind(signal, fn)
	local c = signal:Connect(fn)
	table.insert(connections, c)
	return c
end

local function new(class, props, children)
	local inst = Instance.new(class)
	local parent = nil
	for k, v in pairs(props or {}) do
		if k == "Parent" then parent = v else inst[k] = v end
	end
	for _, child in ipairs(children or {}) do child.Parent = inst end
	if parent then inst.Parent = parent end
	return inst
end

local Q, BACK, ELASTIC, SINE, QUAD, EXPO = Enum.EasingStyle.Quint, Enum.EasingStyle.Back, Enum.EasingStyle.Elastic, Enum.EasingStyle.Sine, Enum.EasingStyle.Quad, Enum.EasingStyle.Exponential
local IN, OUT, INOUT = Enum.EasingDirection.In, Enum.EasingDirection.Out, Enum.EasingDirection.InOut
local function tween(inst, time, props, style, dir, delayTime)
	local t = TweenService:Create(inst, TweenInfo.new(time, style or Q, dir or OUT, 0, false, delayTime or 0), props)
	t:Play()
	return t
end

local function corner(r) return new("UICorner", { CornerRadius = r and UDim.new(0, r) or UDim.new(1, 0) }) end
local function pad(t, r, b, l)
	return new("UIPadding", { PaddingTop = UDim.new(0, t), PaddingRight = UDim.new(0, r or t), PaddingBottom = UDim.new(0, b or t), PaddingLeft = UDim.new(0, l or r or t) })
end
local function stroke(color, thickness, transparency)
	return new("UIStroke", { Color = color, Thickness = thickness or 1, Transparency = transparency or 0, ApplyStrokeMode = Enum.ApplyStrokeMode.Border })
end
local function seq(list)
	local kps = {}
	for i, c in ipairs(list) do table.insert(kps, ColorSequenceKeypoint.new((i - 1) / (#list - 1), c)) end
	return ColorSequence.new(kps)
end
local function nseq(list)
	local kps = {}
	for _, p in ipairs(list) do table.insert(kps, NumberSequenceKeypoint.new(p[1], p[2])) end
	return NumberSequence.new(kps)
end

local spinners, shimmers = {}, {}
local function spinGradient(g, speed) table.insert(spinners, { g = g, s = speed or 90 }) return g end
local function shimmerGradient(g, speed) table.insert(shimmers, { g = g, s = speed or 0.6 }) return g end

-- Elements that follow the theme colours
local themed = {}
local function themeProp(inst, prop, key)
	table.insert(themed, { inst = inst, prop = prop, key = key or "Accent" })
	return inst
end
local function borderSeq() return seq({ WHITE, Color3.fromRGB(110, 112, 120), WHITE, Color3.fromRGB(46, 48, 54), WHITE }) end
local borderGradients = {}
local function themedBorder(g) table.insert(borderGradients, g) g.Color = borderSeq() return g end

local function guiY(y) return y + GuiService:GetGuiInset().Y end
local function isPress(input) return input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch end
local function isMove(input) return input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch end

local camera = Workspace.CurrentCamera
local function viewport() return camera and camera.ViewportSize or Vector2.new(1280, 720) end
local isMobile = UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled

-- Liquid glass: see-through body so the background shows, a top sheen and a bright rim.
-- The sheen and the rim light follow the phone's tilt (or the mouse on PC), see the loop below.
local glassRims, glassSheens = {}, {}
local tilt = Vector2.new(0, 0)
local function liquidGlass(inst, transparency, rimRotation)
	inst.BackgroundTransparency = transparency or 0.5
	inst:SetAttribute("GlassT", inst.BackgroundTransparency)
	local sheen = new("UIGradient", { Parent = inst, Rotation = 90,
		Color = seq({ WHITE, Color3.fromRGB(200, 202, 210), Color3.fromRGB(150, 152, 160) }),
		Transparency = nseq({ { 0, 0 }, { 0.45, 0.12 }, { 1, 0.2 } }) })
	table.insert(glassSheens, sheen)
	local rim = stroke(WHITE, 1.2, 0)
	rim.Parent = inst
	local rg = new("UIGradient", { Parent = rim, Rotation = rimRotation or 115,
		Color = seq({ WHITE, Color3.fromRGB(110, 112, 120), Color3.fromRGB(36, 38, 44), Color3.fromRGB(70, 72, 80), Color3.fromRGB(210, 212, 220) }),
		Transparency = nseq({ { 0, 0 }, { 0.5, 0.55 }, { 1, 0.1 } }) })
	table.insert(glassRims, { g = rg, base = rimRotation or 115 })
	return rim
end

-- Glass states: idle (see-through), hover (a bit darker), held down (darker, like selected)
local glassScales, heldGlass = {}, nil
local function glassLook(inst, state)
	local base = inst:GetAttribute("GlassT") or 0.5
	local idle = Theme[inst:GetAttribute("GlassKey") or "Card"] or Theme.Card
	if state == "press" then
		tween(inst, 0.16, { BackgroundTransparency = math.max(0.06, base - 0.36), BackgroundColor3 = idle:Lerp(BLACK, 0.85) }, QUAD)
	elseif state == "hover" then
		tween(inst, 0.3, { BackgroundTransparency = math.max(0.12, base - 0.2), BackgroundColor3 = idle:Lerp(BLACK, 0.55) }, Q)
	else
		tween(inst, 0.5, { BackgroundTransparency = base, BackgroundColor3 = idle }, Q)
	end
end
local function glassInteract(inst, sc)
	glassScales[inst] = sc
	inst:SetAttribute("Hovered", false)
	bind(inst.MouseEnter, function()
		inst:SetAttribute("Hovered", true)
		if heldGlass ~= inst then glassLook(inst, "hover") if sc then tween(sc, 0.45, { Scale = 1.025 }, Q) end end
	end)
	bind(inst.MouseLeave, function()
		inst:SetAttribute("Hovered", false)
		if heldGlass ~= inst then glassLook(inst, "idle") if sc then tween(sc, 0.45, { Scale = 1 }, Q) end end
	end)
	bind(inst.InputBegan, function(input)
		if isPress(input) then
			heldGlass = inst
			glassLook(inst, "press")
			if sc then tween(sc, 0.18, { Scale = 0.965 }, QUAD) end
		end
	end)
end
bind(UserInputService.InputEnded, function(input)
	if heldGlass and isPress(input) then
		local g = heldGlass
		heldGlass = nil
		local hovered = g:GetAttribute("Hovered") and not isMobile
		glassLook(g, hovered and "hover" or "idle")
		local sc = glassScales[g]
		if sc then tween(sc, 0.55, { Scale = hovered and 1.025 or 1 }, BACK) end
	end
end)

-- Spark burst from a point (clicks and toggles)
local function burst(parent, cx, cy, color, count)
	count = count or 8
	for i = 1, count do
		local a = (i / count) * math.pi * 2 + math.random() * 0.4
		local d = math.random(18, 34)
		local s = math.random(3, 5)
		local p = new("Frame", {
			Parent = parent, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromOffset(cx, cy), Size = UDim2.fromOffset(s, s),
			BackgroundColor3 = color or Theme.Accent2, BorderSizePixel = 0, ZIndex = parent.ZIndex + 8,
		}, { corner() })
		tween(p, 0.55, { Position = UDim2.fromOffset(cx + math.cos(a) * d, cy + math.sin(a) * d), Size = UDim2.fromOffset(0, 0), BackgroundTransparency = 1 }, Q)
		task.delay(0.6, function() p:Destroy() end)
	end
end

-- Press feedback: squash, then a soft rebound
local function pressBounce(scaleObj, amount)
	tween(scaleObj, 0.1, { Scale = amount or 0.93 }, QUAD)
	task.delay(0.1, function() tween(scaleObj, 0.55, { Scale = 1 }, BACK, OUT) end)
end

---------------------------------------------------------------------------
-- Root
---------------------------------------------------------------------------
local old = playerGui:FindFirstChild("VirexUI")
if old then old:Destroy() end
local gui = new("ScreenGui", { Name = "VirexUI", ResetOnSpawn = false, IgnoreGuiInset = true, ZIndexBehavior = Enum.ZIndexBehavior.Sibling, DisplayOrder = 50, Parent = playerGui })
local blur = Lighting:FindFirstChild("VirexBlur") or new("BlurEffect", { Name = "VirexBlur", Size = 0, Parent = Lighting })
local function setBlur(size) tween(blur, 0.6, { Size = size }) end

---------------------------------------------------------------------------
-- Animated sprite sheets (the GIF)
---------------------------------------------------------------------------
local animated = {}
local function applySheet(img, sheet)
	animated[img] = nil
	if sheet and (sheet.Image or "") ~= "" then
		local size = sheet.Size or 1024
		img.Image = sheet.Image
		img.ImageRectSize = Vector2.new((sheet.Width or size) / sheet.Columns, (sheet.Height or size) / sheet.Rows)
		img.ImageRectOffset = Vector2.new(0, 0)
		animated[img] = sheet
	else
		img.ImageRectSize = Vector2.new(0, 0)
		img.ImageRectOffset = Vector2.new(0, 0)
	end
end
-- Animated theme backgrounds: every sheet is 4 x 6 frames of 256 x 170 (1024 x 1020)
local function themeSheet(t)
	if (t.Gif or "") == "" then return nil end
	return { Image = t.Gif, Columns = t.Columns or 4, Rows = t.Rows or 6, Width = t.Width or 1024, Height = t.Height or 1020, Frames = t.Frames or 24, FPS = t.FPS or 12 }
end
local function orbView(parent, size, z)
	local holder = new("CanvasGroup", { Parent = parent, AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromOffset(size, size), BackgroundTransparency = 1, ZIndex = z }, { corner() })
	local img = new("ImageLabel", { Parent = holder, Position = UDim2.fromScale(-0.06, -0.06), Size = UDim2.fromScale(1.12, 1.12), BackgroundTransparency = 1, ZIndex = z })
	applySheet(img, CONFIG.Orb)
	return holder, img
end

---------------------------------------------------------------------------
-- Logo with fake depth (stacked layers) and a glow
---------------------------------------------------------------------------
local logoShines = {}
local function logoRig(parent, size, z)
	local rig = new("Frame", { Parent = parent, AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromOffset(size, size), BackgroundTransparency = 1, ZIndex = z })
	-- spinning light ring
	local ring = new("Frame", { Parent = rig, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.52), Size = UDim2.fromScale(1.22, 1.22), BackgroundTransparency = 1, ZIndex = z }, { corner() })
	local rs = stroke(WHITE, math.max(1, size / 70), 0)
	rs.Parent = ring
	spinGradient(themedBorder(new("UIGradient", { Parent = rs })), 140)
	-- coloured glow copy
	local glowImg = new("ImageLabel", {
		Parent = rig, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(1.12, 1.12), BackgroundTransparency = 1,
		Image = CONFIG.LogoImage, ImageColor3 = Theme.Accent2, ImageTransparency = 1, Visible = false, ZIndex = z,
	})
	themeProp(glowImg, "ImageColor3", "Accent2")
	-- the logo itself
	new("ImageLabel", { Parent = rig, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Image = CONFIG.LogoImage, ZIndex = z + 1 })
	-- shine: a white copy of the logo with a moving bright band, so the light only touches the logo
	local shine = new("ImageLabel", { Parent = rig, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Image = CONFIG.LogoImage, ImageColor3 = WHITE, ZIndex = z + 2 })
	local sg = new("UIGradient", { Parent = shine, Rotation = 25, Offset = Vector2.new(-1, 0), Transparency = nseq({ { 0, 1 }, { 0.4, 1 }, { 0.5, 0.1 }, { 0.6, 1 }, { 1, 1 } }) })
	table.insert(logoShines, sg)
	return rig, glowImg
end
local function shineLogo(sg)
	sg.Offset = Vector2.new(-1, 0)
	tween(sg, 0.9, { Offset = Vector2.new(1, 0) }, SINE, INOUT)
end
-- Coin-flip spin: squeeze the width to 0 and back
local function flip(rig, size, times, speed)
	task.spawn(function()
		for _ = 1, times or 1 do
			if not rig.Parent then return end
			tween(rig, speed or 0.22, { Size = UDim2.fromOffset(0, size) }, SINE, IN).Completed:Wait()
			tween(rig, speed or 0.22, { Size = UDim2.fromOffset(size, size) }, SINE, OUT).Completed:Wait()
		end
	end)
end

---------------------------------------------------------------------------
-- Sounds
---------------------------------------------------------------------------
local function sfx(name, speed, volume)
	local S = CONFIG.Sounds
	if not S or not S.Enabled then return end
	local id = S[name]
	if not id or id == "" then return end
	local s = new("Sound", { SoundId = id, Volume = (volume or 1) * (S.Volume or 0.6), PlaybackSpeed = speed or 1, Parent = gui })
	s:Play()
	task.delay(4, function() s:Destroy() end)
end

---------------------------------------------------------------------------
-- Epic text: glowing bloom, gradient that swirls inside, crisp edge, light sweep
---------------------------------------------------------------------------
local TextService = game:GetService("TextService")
local textShines = {}
local function epicText(parent, text, size, z, colors)
	local font = FONT_TITLE
	local b = TextService:GetTextSize(text, size, font, Vector2.new(10000, 10000))
	local depth = math.max(2, math.floor(size * 0.06))
	local padX, padY = math.floor(size * 0.12) + depth, math.floor(size * 0.1) + depth
	local group = new("CanvasGroup", { Parent = parent, BackgroundTransparency = 1, Size = UDim2.fromOffset(b.X + padX * 2, b.Y + padY * 2), ZIndex = z })
	local labels = {}
	local function layer(zz, d, color)
		local l = new("TextLabel", { Parent = group, BackgroundTransparency = 1, Position = UDim2.fromOffset(padX + d, padY + d), Size = UDim2.fromOffset(b.X, b.Y), Font = font, Text = text, TextSize = size, TextColor3 = color, ZIndex = zz })
		table.insert(labels, l)
		return l
	end
	-- solid extrusion: stacked dark copies give real-looking depth
	for d = depth, 1, -1 do
		local shade = math.floor(14 + (depth - d) / depth * 46)
		local l = layer(z, d, Color3.fromRGB(shade, shade, shade + 3))
		new("UIStroke", { Parent = l, Color = BLACK, Thickness = math.max(1.5, size * 0.035), LineJoinMode = Enum.LineJoinMode.Round })
	end
	-- face: white-to-silver chrome with a crisp black edge
	local main = layer(z + 1, 0, WHITE)
	local fill = new("UIGradient", { Parent = main, Rotation = 90, Color = colors or seq({ WHITE, Color3.fromRGB(236, 237, 241), Color3.fromRGB(168, 170, 178), Color3.fromRGB(246, 246, 249) }) })
	new("UIStroke", { Parent = main, Color = BLACK, Thickness = math.max(1.5, size * 0.035), LineJoinMode = Enum.LineJoinMode.Round })
	local scale = new("UIScale", { Parent = group })
	local et = { group = group, labels = labels, main = main, glow = {}, fill = fill, scale = scale, padX = padX, padY = padY, width = b.X + padX * 2 }
	-- swap the font and resize so nothing gets cut
	function et.refont(f)
		local nb = TextService:GetTextSize(text, size, f, Vector2.new(10000, 10000))
		group.Size = UDim2.fromOffset(nb.X + padX * 2, nb.Y + padY * 2)
		for _, l in ipairs(labels) do l.Font = f l.Size = UDim2.fromOffset(nb.X, nb.Y) end
		et.width = nb.X + padX * 2
	end
	table.insert(epicTexts, et)
	return et
end
-- Light sweep: the chrome highlight slides down across the face
local function sweepText(t, time)
	t.fill.Offset = Vector2.new(0, -0.8)
	tween(t.fill, time or 0.8, { Offset = Vector2.new(0, 0) }, Q, OUT)
end

---------------------------------------------------------------------------
-- Notifications
---------------------------------------------------------------------------
-- Small toasts at the top of the screen, above the menu. Only one at a time:
-- a new one makes the current one leave first, then glides in.
local toastHolder = new("Frame", { Parent = gui, AnchorPoint = Vector2.new(0.5, 0), Position = UDim2.new(0.5, isMobile and 70 or 0, 0, 6), Size = UDim2.fromOffset(250, 40), BackgroundTransparency = 1, ZIndex = 200 })
local toastQueue, toastCurrent = {}, nil
local showNextToast
local function hideToast(tst)
	if tst.leaving then return end
	tst.leaving = true
	-- a soft shine right to left, then it lifts away
	tst.shine.Offset = Vector2.new(1.3, 0)
	tween(tst.shine, 0.4, { Offset = Vector2.new(-1.3, 0) }, SINE, INOUT)
	tween(tst.group, 0.45, { Position = UDim2.new(0.5, 0, 0, -46) }, Q, IN, 0.12)
	tween(tst.group, 0.35, { GroupTransparency = 1 }, SINE, IN, 0.2)
	tween(tst.scale, 0.45, { Scale = 0.9 }, Q, IN, 0.12)
	task.delay(0.6, function()
		tst.group:Destroy()
		if toastCurrent == tst then toastCurrent = nil end
		showNextToast()
	end)
end
showNextToast = function()
	if toastCurrent or #toastQueue == 0 then return end
	local item = table.remove(toastQueue, 1)
	local text = item.text ~= "" and ("  " .. item.text) or ""
	local w = math.clamp(TextService:GetTextSize(string.upper(item.title), 14, FONT_HEAD, Vector2.new(1000, 40)).X + TextService:GetTextSize(text, 12, Enum.Font.GothamMedium, Vector2.new(1000, 40)).X + 70, 150, 300)
	local group = new("CanvasGroup", { Parent = toastHolder, AnchorPoint = Vector2.new(0.5, 0), BackgroundTransparency = 1, Size = UDim2.fromOffset(w, 40), Position = UDim2.new(0.5, 0, 0, -46), GroupTransparency = 1, ZIndex = 201 })
	local gsc = new("UIScale", { Parent = group, Scale = 0.9 })
	local card = new("Frame", { Parent = group, BackgroundColor3 = Theme.Panel, Position = UDim2.fromOffset(2, 2), Size = UDim2.new(1, -4, 1, -4), ZIndex = 202 }, { corner() })
	liquidGlass(card, 0.18)
	local icon = new("ImageLabel", { Parent = card, AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(0, 5, 0.5, 0), Size = UDim2.fromOffset(26, 26), BackgroundColor3 = BLACK, BackgroundTransparency = 0.4, Image = CONFIG.LogoImage, ZIndex = 203 }, { corner() })
	local line = new("Frame", { Parent = card, Position = UDim2.fromOffset(38, 0), Size = UDim2.new(1, -54, 1, 0), BackgroundTransparency = 1, ZIndex = 203 },
		{ new("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, VerticalAlignment = Enum.VerticalAlignment.Center, SortOrder = Enum.SortOrder.LayoutOrder }) })
	local t1 = new("TextLabel", { Parent = line, BackgroundTransparency = 1, AutomaticSize = Enum.AutomaticSize.X, Size = UDim2.fromOffset(0, 20), Font = FONT_HEAD, TextSize = 14, TextColor3 = Theme.Text, Text = string.upper(item.title), LayoutOrder = 1, ZIndex = 204 })
	new("UIStroke", { Parent = t1, Color = BLACK, Thickness = 1, Transparency = 0.4 })
	local t2 = new("TextLabel", { Parent = line, BackgroundTransparency = 1, AutomaticSize = Enum.AutomaticSize.X, Size = UDim2.fromOffset(0, 20), Font = Enum.Font.GothamMedium, TextSize = 12, TextColor3 = Theme.Muted, TextTransparency = 1, Text = text, LayoutOrder = 2, ZIndex = 204 })
	-- status light on the right (green on, red off, or the colour given)
	local dot = new("Frame", { Parent = card, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -12, 0.5, 0), Size = UDim2.fromOffset(0, 0), BackgroundColor3 = item.color or Theme.Accent2, ZIndex = 204 }, { corner() })
	local shineF = new("Frame", { Parent = card, Size = UDim2.fromScale(1, 1), BackgroundColor3 = WHITE, BorderSizePixel = 0, ZIndex = 205 }, { corner() })
	local shine = new("UIGradient", { Parent = shineF, Rotation = 15, Offset = Vector2.new(-1.3, 0), Transparency = nseq({ { 0, 1 }, { 0.42, 1 }, { 0.5, 0.45 }, { 0.58, 1 }, { 1, 1 } }) })
	local tst = { group = group, scale = gsc, shine = shine, leaving = false }
	toastCurrent = tst
	sfx("Notify", 1.15, 0.35)
	-- glide down and settle, then a light runs across
	tween(group, 0.7, { Position = UDim2.new(0.5, 0, 0, 0) }, Q, OUT)
	tween(group, 0.45, { GroupTransparency = 0 }, SINE, OUT)
	tween(gsc, 0.7, { Scale = 1 }, Q, OUT)
	local isc = new("UIScale", { Parent = icon, Scale = 0.5 })
	tween(isc, 0.6, { Scale = 1 }, BACK, OUT, 0.15)
	tween(t2, 0.5, { TextTransparency = 0 }, SINE, OUT, 0.25)
	tween(dot, 0.5, { Size = UDim2.fromOffset(8, 8) }, BACK, OUT, 0.3)
	tween(shine, 0.8, { Offset = Vector2.new(1.3, 0) }, SINE, INOUT, 0.3)
	task.delay(item.duration, function() hideToast(tst) end)
end
local function notify(title, text, duration, color)
	-- only the newest waits: quick taps never pile up
	toastQueue = { { title = title, text = text or "", duration = math.min(duration or 2.2, 3), color = color } }
	if toastCurrent then hideToast(toastCurrent) else showNextToast() end
end

---------------------------------------------------------------------------
-- Intro
---------------------------------------------------------------------------
-- Cinematic camera (GTA style): starts high up in the sky looking down at you, spins and banks
-- as it drops, and lands right behind your back looking where you look.
local function cinematicCamera(duration)
	local cam = Workspace.CurrentCamera
	local t0 = os.clock()
	while not (player.Character and player.Character:FindFirstChild("HumanoidRootPart")) and os.clock() - t0 < 5 do task.wait(0.1) end
	local hrp = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
	if not (cam and hrp) then return function() end, function() end end
	local oldFov = cam.FieldOfView
	cam.CameraType = Enum.CameraType.Scriptable
	local look = hrp.CFrame.LookVector
	local flat = Vector3.new(look.X, 0, look.Z)
	flat = flat.Magnitude > 0.01 and flat.Unit or Vector3.new(0, 0, -1)
	local backAngle = math.atan2(-flat.Z, -flat.X)
	local turns = 1.25 * math.pi * 2
	local baseFov = 60
	local start = os.clock()
	local conn = RunService.RenderStepped:Connect(function()
		if not hrp.Parent then return end
		local p = math.clamp((os.clock() - start) / duration, 0, 1)
		local fall = (1 - p) ^ 3 -- 1 up in the sky, 0 landed: drops fast, lands soft
		local center = hrp.Position + Vector3.new(0, 1.5, 0)
		local a = backAngle + fall * turns
		local h = 3.5 + 340 * fall ^ 1.15
		local r = 9 + 70 * fall
		local pos = center + Vector3.new(math.cos(a) * r, h, math.sin(a) * r)
		-- from looking down at you to looking over your shoulder
		local settle = (1 - fall) ^ 6
		local target = center:Lerp(center + flat * 30 + Vector3.new(0, 1, 0), settle)
		-- bank into the spin like a plane, level out at the end
		cam.CFrame = CFrame.lookAt(pos, target) * CFrame.Angles(0, 0, fall * 0.45)
	end)
	table.insert(connections, conn)
	cam.FieldOfView = 90
	tween(cam, duration, { FieldOfView = baseFov }, Q, OUT)
	local function punch(amount)
		local now = cam.FieldOfView
		tween(cam, 0.07, { FieldOfView = now - (amount or 10) }, QUAD)
		task.delay(0.07, function() tween(cam, 0.6, { FieldOfView = math.max(now, baseFov) }, BACK, OUT) end)
	end
	local function stop()
		conn:Disconnect()
		cam.CameraType = Enum.CameraType.Custom
		tween(cam, 0.9, { FieldOfView = oldFov }, Q)
	end
	return stop, punch
end

local function playIntro(onDone)
	local vp = viewport()
	local fit = math.min(1, (vp.X - 30) / 520, (vp.Y - 40) / 640)
	setBlur(8)
	sfx("Open", 0.55, 1)

	local intro = new("Frame", { Parent = gui, BackgroundColor3 = Theme.Bg, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), ZIndex = 100 })
	tween(intro, 0.9, { BackgroundTransparency = 0.72 })
	local stage = new("Frame", { Parent = intro, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ZIndex = 100 })
	local wash = new("Frame", { Parent = stage, Size = UDim2.fromScale(1, 1), BackgroundColor3 = Theme.Accent, BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 100 },
		{ new("UIGradient", { Rotation = 90, Transparency = nseq({ { 0, 0.5 }, { 0.5, 1 }, { 1, 0.4 } }) }) })
	tween(wash, 1.4, { BackgroundTransparency = 0.5 })

	-- Movie letterbox bars with a glowing inner edge
	local barH = math.floor(vp.Y * 0.11)
	local function bar(top)
		local b = new("Frame", {
			Parent = intro, AnchorPoint = Vector2.new(0, top and 0 or 1), Position = top and UDim2.fromOffset(0, -barH) or UDim2.new(0, 0, 1, barH),
			Size = UDim2.new(1, 0, 0, barH), BackgroundColor3 = BLACK, BorderSizePixel = 0, ZIndex = 125,
		})
		new("Frame", { Parent = b, AnchorPoint = Vector2.new(0, top and 1 or 0), Position = top and UDim2.fromScale(0, 1) or UDim2.fromScale(0, 0), Size = UDim2.new(1, 0, 0, 2), BackgroundColor3 = Theme.Accent2, BorderSizePixel = 0, ZIndex = 126 },
			{ new("UIGradient", { Transparency = nseq({ { 0, 1 }, { 0.5, 0 }, { 1, 1 } }) }) })
		tween(b, 1, { Position = top and UDim2.fromOffset(0, 0) or UDim2.new(0, 0, 1, 0) }, EXPO, OUT)
		return b
	end
	local topBar, botBar = bar(true), bar(false)
	local hint = new("TextLabel", { Parent = botBar, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Font = Enum.Font.GothamMedium, TextSize = 13, TextColor3 = Theme.Muted, TextTransparency = 1, ZIndex = 127,
		Text = isMobile and "Tap the VIREX button to open the menu" or ("Press " .. CONFIG.ToggleKey.Name .. " to open and close the menu") })

	local stopCam, punch = cinematicCamera(6.2)

	-- Falling through the clouds: soft white puffs rush past the camera
	for k = 1, 9 do
		task.delay(0.35 + k * 0.17, function()
			local a = math.random() * math.pi * 2
			local sz = math.random(260, 520)
			local cloud = new("Frame", { Parent = stage, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, math.cos(a) * 60, 0.45, math.sin(a) * 40), Size = UDim2.fromOffset(sz, sz * 0.6),
				BackgroundColor3 = WHITE, BackgroundTransparency = 0.35, BorderSizePixel = 0, ZIndex = 118 },
				{ corner(), new("UIGradient", { Transparency = nseq({ { 0, 1 }, { 0.3, 0.5 }, { 0.5, 0.2 }, { 0.7, 0.5 }, { 1, 1 } }) }) })
			local cs = new("UIScale", { Parent = cloud, Scale = 0.5 })
			tween(cloud, 1.1, { Position = UDim2.new(0.5, math.cos(a) * vp.X * 0.9, 0.45, math.sin(a) * vp.Y * 0.9), BackgroundTransparency = 1 }, QUAD, IN)
			tween(cs, 1.1, { Scale = 3 }, QUAD, IN)
			task.delay(1.15, function() cloud:Destroy() end)
		end)
	end

	-- Opening: total black, a line of light draws across the middle, then the screen splits open along it
	local lidTop = new("Frame", { Parent = intro, AnchorPoint = Vector2.new(0, 1), Position = UDim2.fromScale(0, 0.5), Size = UDim2.fromScale(1, 0.5), BackgroundColor3 = BLACK, BorderSizePixel = 0, ZIndex = 120 })
	local lidBot = new("Frame", { Parent = intro, AnchorPoint = Vector2.new(0, 0), Position = UDim2.fromScale(0, 0.5), Size = UDim2.fromScale(1, 0.5), BackgroundColor3 = BLACK, BorderSizePixel = 0, ZIndex = 120 })
	local seam = new("Frame", { Parent = intro, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(0, 2), BackgroundColor3 = WHITE, BorderSizePixel = 0, ZIndex = 122 },
		{ new("UIGradient", { Transparency = nseq({ { 0, 1 }, { 0.2, 0.4 }, { 0.5, 0 }, { 0.8, 0.4 }, { 1, 1 } }) }) })
	local seamGlow = new("Frame", { Parent = intro, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(0, 24), BackgroundColor3 = WHITE, BackgroundTransparency = 0.8, BorderSizePixel = 0, ZIndex = 121 },
		{ corner(), new("UIGradient", { Transparency = nseq({ { 0, 1 }, { 0.5, 0.2 }, { 1, 1 } }) }) })
	tween(seam, 0.45, { Size = UDim2.fromOffset(vp.X, 2) }, EXPO, OUT)
	tween(seamGlow, 0.6, { Size = UDim2.fromOffset(vp.X * 0.8, 24) }, EXPO, OUT)
	task.delay(0.4, function()
		sfx("Boom", 0.4, 0.7)
		punch(8)
		tween(lidTop, 0.95, { Position = UDim2.fromScale(0, 0) }, Q, INOUT)
		tween(lidBot, 0.95, { Position = UDim2.fromScale(0, 1) }, Q, INOUT)
		tween(seam, 0.5, { BackgroundTransparency = 1, Size = UDim2.fromOffset(vp.X * 1.3, 1) }, Q, OUT, 0.15)
		tween(seamGlow, 0.6, { BackgroundTransparency = 1, Size = UDim2.fromOffset(vp.X * 1.3, 120) }, Q, OUT)
		task.delay(1, function() lidTop:Destroy() lidBot:Destroy() seam:Destroy() seamGlow:Destroy() end)
	end)
	-- Implosion: streaks of light get sucked into the middle right before the logo lands
	task.delay(0.8, function()
		local cx, cy = vp.X / 2, vp.Y * 0.37
		local R = math.max(vp.X, vp.Y) * 0.75
		for k = 1, 34 do
			local a = math.random() * math.pi * 2
			local sx, sy = cx + math.cos(a) * R * (0.7 + math.random() * 0.4), cy + math.sin(a) * R * (0.7 + math.random() * 0.4)
			local line = new("Frame", { Parent = stage, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromOffset(sx, sy), Size = UDim2.fromOffset(math.random(40, 110), math.random(1, 3)), Rotation = math.deg(a),
				BackgroundColor3 = (k % 4 == 0) and Theme.Accent2 or WHITE, BackgroundTransparency = 0.15, BorderSizePixel = 0, ZIndex = 105 },
				{ new("UIGradient", { Transparency = nseq({ { 0, 0 }, { 1, 1 } }) }) })
			local t = 0.45 + math.random() * 0.12
			tween(line, t, { Position = UDim2.fromOffset(cx, cy), Size = UDim2.fromOffset(8, 1), BackgroundTransparency = 0.6 }, QUAD, IN, k * 0.004)
			task.delay(t + k * 0.004, function() line:Destroy() end)
		end
	end)

	-- Streaks and rising particles
	local alive = true
	task.spawn(function()
		while alive do
			local y = math.random(15, 85) / 100
			local streak = new("Frame", {
				Parent = stage, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(-0.3, y), Size = UDim2.new(0, math.random(200, 520), 0, math.random(1, 3)),
				BackgroundColor3 = WHITE, BorderSizePixel = 0, Rotation = -8, ZIndex = 101,
			}, { new("UIGradient", { Color = seq({ Theme.Accent, Theme.Accent2, WHITE }), Transparency = nseq({ { 0, 1 }, { 0.8, 0.2 }, { 1, 0 } }) }) })
			tween(streak, math.random(5, 9) / 10, { Position = UDim2.fromScale(1.3, y - 0.12) }, QUAD, IN)
			task.delay(1, function() streak:Destroy() end)
			task.wait(math.random(6, 18) / 100)
		end
	end)
	task.spawn(function()
		while alive do
			local s = math.random(2, 6)
			local p = new("Frame", {
				Parent = stage, BackgroundColor3 = (math.random() < 0.3) and Theme.Hot or Theme.Accent2, BackgroundTransparency = 0.1, BorderSizePixel = 0,
				Position = UDim2.fromOffset(math.random(0, math.floor(vp.X)), vp.Y + 10), Size = UDim2.fromOffset(s, s), ZIndex = 101,
			}, { corner() })
			local dur = math.random(16, 30) / 10
			tween(p, dur, { Position = UDim2.fromOffset(p.Position.X.Offset + math.random(-90, 90), math.random(-40, math.floor(vp.Y * 0.5))), BackgroundTransparency = 1 }, SINE)
			task.delay(dur, function() p:Destroy() end)
			task.wait(0.03)
		end
	end)
	-- impact: a blade of light cuts across the screen (no rings)
	local function shock(delayTime, color, cy, maxSize)
		task.delay(delayTime or 0, function()
			local w = math.max(vp.X * 1.4, maxSize or 0)
			local blade = new("Frame", { Parent = stage, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, cy or 0.4), Size = UDim2.fromOffset(40, 2), BackgroundColor3 = color or WHITE, BorderSizePixel = 0, ZIndex = 108 },
				{ new("UIGradient", { Transparency = nseq({ { 0, 1 }, { 0.5, 0 }, { 1, 1 } }) }) })
			local haze = new("Frame", { Parent = stage, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, cy or 0.4), Size = UDim2.fromOffset(40, 60), BackgroundColor3 = color or WHITE, BackgroundTransparency = 0.75, BorderSizePixel = 0, ZIndex = 103 },
				{ corner(), new("UIGradient", { Transparency = nseq({ { 0, 1 }, { 0.5, 0.3 }, { 1, 1 } }) }) })
			tween(blade, 0.5, { Size = UDim2.fromOffset(w, 2) }, EXPO, OUT)
			tween(haze, 0.6, { Size = UDim2.fromOffset(w * 0.8, 6) }, EXPO, OUT)
			task.delay(0.3, function()
				tween(blade, 0.6, { BackgroundTransparency = 1 })
				tween(haze, 0.5, { BackgroundTransparency = 1 })
			end)
			task.delay(1, function() blade:Destroy() haze:Destroy() end)
		end)
	end
	local function shake(power, time)
		task.spawn(function()
			local t0 = os.clock()
			while os.clock() - t0 < (time or 0.25) do
				stage.Position = UDim2.fromOffset(math.random(-power, power), math.random(-power, power))
				RunService.RenderStepped:Wait()
			end
			stage.Position = UDim2.fromOffset(0, 0)
		end)
	end
	local function flash(amount)
		local f = new("Frame", { Parent = intro, BackgroundColor3 = WHITE, BackgroundTransparency = amount or 0.5, Size = UDim2.fromScale(1, 1), ZIndex = 124 })
		tween(f, 0.6, { BackgroundTransparency = 1 })
		task.delay(0.65, function() f:Destroy() end)
	end

	-- God rays turning slowly behind the logo
	local rays = new("Frame", { Parent = stage, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.37), Size = UDim2.fromOffset(10, 10), BackgroundTransparency = 1, ZIndex = 101 })
	local rayList = {}
	for i = 1, 8 do
		local len = math.floor(math.max(vp.X, vp.Y) * (i % 2 == 0 and 1.1 or 0.8))
		local ray = new("Frame", {
			Parent = rays, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(i % 2 == 0 and 10 or 4, len), Rotation = i * 22.5,
			BackgroundColor3 = (i % 3 == 0) and Theme.Hot or Theme.Accent2, BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 101,
		}, { new("UIGradient", { Rotation = 90, Transparency = nseq({ { 0, 1 }, { 0.42, 0.55 }, { 0.5, 0.85 }, { 0.58, 0.55 }, { 1, 1 } }) }) })
		table.insert(rayList, ray)
	end
	task.spawn(function()
		local t0 = os.clock()
		while rays.Parent do
			rays.Rotation = (os.clock() - t0) * 12
			RunService.RenderStepped:Wait()
		end
	end)
	local function flare()
		local core = new("Frame", { Parent = stage, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.37), Size = UDim2.fromOffset(0, 3), BackgroundColor3 = WHITE, BorderSizePixel = 0, ZIndex = 110 },
			{ new("UIGradient", { Color = seq({ Theme.Accent, Theme.Accent2, WHITE, Theme.Accent2, Theme.Accent }), Transparency = nseq({ { 0, 1 }, { 0.5, 0 }, { 1, 1 } }) }) })
		local haze = new("Frame", { Parent = stage, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.37), Size = UDim2.fromOffset(0, 26), BackgroundColor3 = Theme.Accent2, BackgroundTransparency = 0.6, BorderSizePixel = 0, ZIndex = 109 },
			{ corner(), new("UIGradient", { Transparency = nseq({ { 0, 1 }, { 0.5, 0.2 }, { 1, 1 } }) }) })
		tween(core, 0.35, { Size = UDim2.fromOffset(vp.X * 1.3, 3) }, EXPO, OUT)
		tween(haze, 0.45, { Size = UDim2.fromOffset(vp.X * 0.9, 26) }, EXPO, OUT)
		task.delay(0.35, function()
			tween(core, 0.9, { BackgroundTransparency = 1, Size = UDim2.fromOffset(vp.X * 1.5, 1) })
			tween(haze, 0.9, { BackgroundTransparency = 1 })
		end)
		task.delay(1.3, function() core:Destroy() haze:Destroy() end)
	end

	-- The orb (your GIF) opening like a portal
	local orb = orbView(stage, math.floor(380 * fit), 102)
	orb.Position = UDim2.fromScale(0.5, 0.37)
	orb.GroupTransparency = 1
	local orbScale = new("UIScale", { Parent = orb, Scale = 0.2 })
	local orbRim = stroke(WHITE, 3, 0.2)
	orbRim.Parent = orb
	spinGradient(new("UIGradient", { Parent = orbRim, Color = seq({ Theme.Accent2, Theme.Accent, Theme.Hot, Theme.Accent2 }), Transparency = nseq({ { 0, 0 }, { 0.5, 0.8 }, { 1, 0 } }) }), 160)
	task.delay(0.4, function()
		tween(orb, 1.2, { GroupTransparency = 0.08 })
		tween(orbScale, 1.6, { Scale = 1 }, EXPO, OUT)
	end)

	-- Logo: ghost copies rush in from the corners and fuse into the real logo
	local L = math.floor(210 * fit)
	local rig, logoGlow = logoRig(stage, L, 104)
	rig.Position = UDim2.fromScale(0.5, 0.37)
	local rigScale = new("UIScale", { Parent = rig, Scale = 0 })
	local corners = { { -0.45, -0.4 }, { 0.45, -0.4 }, { -0.45, 0.4 }, { 0.45, 0.4 } }
	for k, c in ipairs(corners) do
		local ghost = new("ImageLabel", {
			Parent = stage, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5 + c[1], 0.37 + c[2]), Size = UDim2.fromOffset(L * 1.4, L * 1.4),
			BackgroundTransparency = 1, Image = CONFIG.LogoImage, ImageColor3 = (k % 2 == 0) and Theme.Accent2 or Theme.Hot, ImageTransparency = 1, Rotation = c[1] * 80, ZIndex = 103,
		})
		task.delay(0.6, function()
			tween(ghost, 0.25, { ImageTransparency = 0.35 })
			tween(ghost, 0.75, { Position = UDim2.fromScale(0.5, 0.37), Size = UDim2.fromOffset(L, L), Rotation = 0 }, Q, IN)
			task.delay(0.75, function() tween(ghost, 0.3, { ImageTransparency = 1 }) task.delay(0.3, function() ghost:Destroy() end) end)
		end)
	end
	task.delay(1.35, function()
		tween(rigScale, 1, { Scale = 1 }, ELASTIC, OUT)
		sfx("Boom", 0.5, 1)
		sfx("Slam", 0.6, 0.8)
		flash(0.35)
		shock(0, WHITE, 0.37)
		shock(0.1, Theme.Hot, 0.37)
		shock(0.2, Theme.Accent2, 0.37)
		shake(10, 0.4)
		punch(14)
		burst(stage, vp.X / 2, vp.Y * 0.37, Theme.Accent2, 24)
		flare()
		-- two ghost copies snap together from the sides (split, then lock)
		for k = -1, 1, 2 do
			local g = new("ImageLabel", { Parent = stage, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, k * 26, 0.37, 0), Size = UDim2.fromOffset(L, L), BackgroundTransparency = 1,
				Image = CONFIG.LogoImage, ImageColor3 = k < 0 and WHITE or Color3.fromRGB(140, 142, 150), ImageTransparency = 0.3, ZIndex = 103 })
			tween(g, 0.45, { Position = UDim2.fromScale(0.5, 0.37), ImageTransparency = 1 }, Q, OUT)
			task.delay(0.5, function() g:Destroy() end)
		end
		for k, ray in ipairs(rayList) do tween(ray, 1.2, { BackgroundTransparency = 0.25 }, Q, OUT, k * 0.04) end
		task.delay(0.6, function() for _, sg in ipairs(logoShines) do if sg.Parent and sg.Parent.Parent == rig then shineLogo(sg) end end end)
	end)
	task.spawn(function()
		local t0 = os.clock()
		while alive and rig.Parent do
			local t = os.clock() - t0
			rig.Rotation = math.sin(t * 1.4) * 4
			rig.Position = UDim2.new(0.5, 0, 0.37, math.sin(t * 2) * 6)
			RunService.RenderStepped:Wait()
		end
	end)

	-- Front wordmark: glowing gradient letters that slam in one by one
	local LETTER = 112
	local probe = epicText(stage, "V", LETTER, 107)
	local pad = probe.padX
	probe.group:Destroy()
	local word = new("Frame", { Parent = stage, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.65), Size = UDim2.fromOffset(0, 200), AutomaticSize = Enum.AutomaticSize.X, BackgroundTransparency = 1, ZIndex = 106 },
		{ new("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal, HorizontalAlignment = Enum.HorizontalAlignment.Center, VerticalAlignment = Enum.VerticalAlignment.Center, Padding = UDim.new(0, -pad * 2 + 6), SortOrder = Enum.SortOrder.LayoutOrder }) })
	local wordScale = new("UIScale", { Parent = word, Scale = 1 })
	local letters = {}
	for i, ch in ipairs({ "V", "I", "R", "E", "X" }) do
		local isPeak = ch == "I"
		local t = epicText(word, ch, LETTER, 107, nil)
		t.group.LayoutOrder = i
		t.group.GroupTransparency = 1
		t.scale.Scale = 2.8
		if isPeak then
			t.spark = new("Frame", { Parent = t.group, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0, t.padY - 2), Size = UDim2.fromOffset(0, 0), BackgroundColor3 = WHITE, Rotation = 45, BorderSizePixel = 0, ZIndex = 112 })
			stroke(Theme.Accent2, 3, 0.3).Parent = t.spark
		end
		letters[i] = t
	end
	-- fit the word to the screen whatever font is used
	local total = 0
	for _, t in ipairs(letters) do total = total + t.width end
	total = total + (#letters - 1) * (-pad * 2 + 6)
	wordScale.Scale = math.min(1, (vp.X - 30) / math.max(total, 1), 1.0)
	local underline = new("Frame", { Parent = stage, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.735), Size = UDim2.fromOffset(0, 3), BackgroundColor3 = Theme.Accent2, BorderSizePixel = 0, ZIndex = 106 },
		{ new("UIGradient", { Color = seq({ Theme.Accent, WHITE, Theme.Accent }), Transparency = nseq({ { 0, 1 }, { 0.5, 0 }, { 1, 1 } }) }) })
	local thanks = epicText(stage, "THANK YOU FOR USING VIREX", 30, 106, nil)
	thanks.group.AnchorPoint = Vector2.new(0.5, 0.5)
	thanks.group.Position = UDim2.fromScale(0.5, 0.79)
	thanks.scale.Scale = math.min(1, (vp.X - 20) / thanks.width)
	for _, l in ipairs(thanks.labels) do l.MaxVisibleGraphemes = 0 end
	local sub = new("TextLabel", {
		Parent = stage, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.845), Size = UDim2.new(1, -40, 0, 18), BackgroundTransparency = 1,
		Font = FONT_HEAD, TextSize = 12, TextColor3 = WHITE, TextTransparency = 1, Text = string.upper(CONFIG.Version), ZIndex = 106,
	})

	task.spawn(function()
		task.wait(2.1)
		for i, l in ipairs(letters) do
			l.group.Rotation = (i % 2 == 0) and 16 or -16
			tween(l.group, 0.25, { GroupTransparency = 0 })
			tween(l.scale, 0.55, { Scale = 1 }, BACK, OUT)
			tween(l.group, 0.55, { Rotation = 0 }, BACK, OUT)
			task.delay(0.3, function() sweepText(l, 0.7) end)
			if l.spark then tween(l.spark, 0.6, { Size = UDim2.fromOffset(16, 16) }, BACK, OUT, 0.25) end
			sfx("Slam", 0.85 + i * 0.1, 0.6)
			task.delay(0.18, function() shake(4, 0.12) punch(4) end)
			task.wait(0.13)
		end
		task.wait(0.25)
		shock(0, Theme.Accent2, 0.65, 800)
		sfx("Boom", 0.8, 0.6)
		tween(underline, 0.9, { Size = UDim2.fromOffset(math.floor(480 * fit), 3) }, EXPO, OUT)
		task.wait(0.35)
		local total = #"THANK YOU FOR USING VIREX"
		for k = 1, total do
			for _, l in ipairs(thanks.labels) do l.MaxVisibleGraphemes = k end
			if k % 3 == 0 then sfx("Hover", 1.9, 0.25) end
			task.wait(0.03)
		end
		for _, l in ipairs(thanks.labels) do l.MaxVisibleGraphemes = -1 end
		sfx("Notify", 1, 0.6)
		local base = thanks.scale.Scale
		thanks.scale.Scale = base * 1.2
		tween(thanks.scale, 0.7, { Scale = base }, ELASTIC, OUT)
		sweepText(thanks, 1)
		for _, l in ipairs(letters) do sweepText(l, 0.9) end
		tween(sub, 0.7, { TextTransparency = 0 })
		tween(hint, 0.7, { TextTransparency = 0 })
		task.wait(1.7)

		-- Outro: everything rushes past the camera, bars open, flash, back to the game
		alive = false
		sfx("Open", 1.1, 0.9)
		tween(topBar, 0.7, { Position = UDim2.fromOffset(0, -barH) }, EXPO, IN)
		tween(botBar, 0.7, { Position = UDim2.new(0, 0, 1, barH) }, EXPO, IN)
		tween(rigScale, 0.7, { Scale = 5 }, Q, IN)
		for _, d in ipairs(rig:GetDescendants()) do
			if d:IsA("ImageLabel") then tween(d, 0.6, { ImageTransparency = 1 }, Q, IN)
			elseif d:IsA("Frame") then tween(d, 0.6, { BackgroundTransparency = 1 }) end
		end
		tween(orbScale, 0.8, { Scale = 2.6 }, Q, IN)
		tween(orb, 0.7, { GroupTransparency = 1 })
		for i, l in ipairs(letters) do
			tween(l.group, 0.5, { GroupTransparency = 1, Rotation = (i % 2 == 0) and 25 or -25 }, BACK, IN, i * 0.04)
			tween(l.scale, 0.5, { Scale = 3 }, Q, IN, i * 0.04)
		end
		tween(thanks.group, 0.5, { GroupTransparency = 1 })
		tween(thanks.scale, 0.5, { Scale = thanks.scale.Scale * 1.6 }, Q, IN)
		tween(sub, 0.5, { TextTransparency = 1 })
		for _, ray in ipairs(rayList) do tween(ray, 0.5, { BackgroundTransparency = 1 }) end
		tween(underline, 0.5, { Size = UDim2.fromOffset(0, 2) }, Q, IN)
		task.wait(0.55)
		flash(0.15)
		shock(0, WHITE, 0.5, 1800)
		stopCam()
		tween(intro, 0.7, { BackgroundTransparency = 1 })
		tween(wash, 0.7, { BackgroundTransparency = 1 })
		onDone()
		task.wait(0.9)
		intro:Destroy()
	end)
end

---------------------------------------------------------------------------
-- Window
---------------------------------------------------------------------------
local W, H = 660, 440
local root = new("Frame", { Parent = gui, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 0, 0.5, 22), Size = UDim2.fromOffset(W, H), BackgroundTransparency = 1, Visible = false, ZIndex = 10 })
local rootScale = new("UIScale", { Parent = root, Scale = 1 })
local function fitScale()
	local vp = viewport()
	return math.min(1, (vp.X - 20) / W, (vp.Y - 100) / H)
end

local glow = new("Frame", { Parent = root, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.new(1, 22, 1, 22), BackgroundColor3 = Theme.Accent, BackgroundTransparency = 1, Visible = false, ZIndex = 9 }, { corner(34) })
themeProp(glow, "BackgroundColor3")
local glowFlash = 0

local window = new("CanvasGroup", { Parent = root, Size = UDim2.fromScale(1, 1), BackgroundColor3 = Theme.Panel, BackgroundTransparency = 0, GroupTransparency = 1, ZIndex = 10 }, { corner(26) })
themeProp(window, "BackgroundColor3", "Panel")
local winScale = new("UIScale", { Parent = window, Scale = 1 })

-- Layer 1: theme photo
local photoHolder = new("Frame", { Parent = window, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(1.08, 1.08), BackgroundTransparency = 1, ZIndex = 10 })
local bgPhoto = new("ImageLabel", { Parent = photoHolder, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ScaleType = Enum.ScaleType.Crop, ZIndex = 10 })
-- Readability: a dark veil over the photo. Stronger on moving backgrounds so white text always reads.
local scrim = new("Frame", { Parent = window, Size = UDim2.fromScale(1, 1), BackgroundColor3 = BLACK, BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 10 },
	{ new("UIGradient", { Rotation = 90, Transparency = nseq({ { 0, 0.05 }, { 0.18, 0.25 }, { 0.6, 0.35 }, { 1, 0.15 } }) }) })
-- Layer 3: readability fade (dark on the left, lighter on the right)
local fade = new("Frame", { Parent = window, Size = UDim2.fromScale(1, 1), BackgroundColor3 = Theme.Panel, BorderSizePixel = 0, Visible = false, ZIndex = 10 },
	{ new("UIGradient", { Rotation = 0, Transparency = nseq({ { 0, 0.3 }, { 0.45, 0.6 }, { 1, 0.9 } }) }) })
themeProp(fade, "BackgroundColor3", "Panel")
-- A band of light that sweeps across the glass now and then
local sweep = new("Frame", { Parent = window, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(-0.4, 0.5), Size = UDim2.new(0, 140, 2, 0), Rotation = 20, BackgroundColor3 = WHITE, BorderSizePixel = 0, Visible = false, ZIndex = 10 },
	{ new("UIGradient", { Transparency = nseq({ { 0, 1 }, { 0.5, 0.9 }, { 1, 1 } }) }) })

-- Specular light on the glass: a soft white glow that slides around when you tilt the phone
local specular = new("Frame", { Parent = window, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.3, 0.2), Size = UDim2.fromScale(1.1, 0.9), Rotation = -18, BackgroundColor3 = WHITE, BorderSizePixel = 0, ZIndex = 11 },
	{ corner(), new("UIGradient", { Transparency = nseq({ { 0, 1 }, { 0.35, 0.94 }, { 0.5, 0.9 }, { 0.65, 0.94 }, { 1, 1 } }) }) })
-- Dust drifting up through the glass
local dust = {}
for i = 1, 16 do
	local sz = math.random(2, 4)
	local d = new("Frame", { Parent = window, AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromOffset(sz, sz), BackgroundColor3 = WHITE, BackgroundTransparency = 0.6, BorderSizePixel = 0, ZIndex = 11 }, { corner() })
	table.insert(dust, { f = d, x = math.random(), p = math.random(), sp = 0.03 + math.random() * 0.05, depth = 0.4 + math.random() * 0.6 })
end

local function applyBackground(t, animate)
	local sheet = themeSheet(t)
	tween(scrim, animate and 0.8 or 0, { BackgroundTransparency = sheet and 0.3 or ((t.Background or "") ~= "" and 0.62 or 1) }, Q)
	local photo = sheet and sheet.Image or (t.Background or "")
	local function set()
		applySheet(bgPhoto, sheet)
		bgPhoto.Image = photo
	end
	if animate then
		tween(bgPhoto, 0.3, { ImageTransparency = 1 })
		task.delay(0.3, function()
			set()
			bgPhoto.Size = UDim2.fromScale(1.15, 1.15)
			bgPhoto.Position = UDim2.fromScale(-0.075, -0.075)
			if photo ~= "" then tween(bgPhoto, 1, { ImageTransparency = t.Dim or 0.35, Size = UDim2.fromScale(1, 1), Position = UDim2.fromScale(0, 0) }, EXPO) end
		end)
	else
		set()
		bgPhoto.ImageTransparency = photo ~= "" and (t.Dim or 0.35) or 1
	end
end
applyBackground(currentTheme, false)

-- Border: spinning colour rim
local border = new("Frame", { Parent = root, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ZIndex = 40 }, { corner(26) })
local borderScale = new("UIScale", { Parent = border, Scale = 1 })
local borderStroke = stroke(WHITE, 1.8, 0)
borderStroke.Parent = border
spinGradient(themedBorder(new("UIGradient", { Parent = borderStroke })), 80)

---------------------------------------------------------------------------
-- Topbar: logo, title, liquid-glass tab pill, window buttons
---------------------------------------------------------------------------
local topbar = new("Frame", { Parent = window, Size = UDim2.new(1, 0, 0, 68), BackgroundTransparency = 1, ZIndex = 12 })
local topLogo, topGlow = logoRig(topbar, 40, 13)
topLogo.Position = UDim2.fromOffset(38, 34)
local titleText = epicText(topbar, "VIREX", 21, 13)
titleText.group.Position = UDim2.fromOffset(66 - titleText.padX, 13 - titleText.padY)
titleText.scale.Name = "Pop"
local title = titleText.group
new("TextLabel", { Parent = topbar, BackgroundTransparency = 1, Position = UDim2.fromOffset(66, 39), Size = UDim2.fromOffset(120, 14), Font = Enum.Font.Gotham, TextSize = 11, Text = CONFIG.Version, TextColor3 = Theme.Muted, TextXAlignment = Enum.TextXAlignment.Left, ZIndex = 13 })

local function circleButton(text, xOffset, hoverColor)
	local b = new("TextButton", { Parent = topbar, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, xOffset, 0.5, 0), Size = UDim2.fromOffset(34, 34), AutoButtonColor = false, BackgroundColor3 = Theme.Card, Font = Enum.Font.GothamBold, TextSize = 16, Text = text, TextColor3 = Theme.Text, ZIndex = 14 }, { corner() })
	liquidGlass(b, 0.5)
	local sc = new("UIScale", { Parent = b, Name = "Pop" })
	glassInteract(b, nil)
	bind(b.MouseEnter, function() sfx("Hover", 1.5, 0.2) tween(sc, 0.45, { Scale = 1.1 }, Q) tween(b, 0.55, { Rotation = 90 }, Q) tween(b, 0.3, { TextColor3 = hoverColor }) end)
	bind(b.MouseLeave, function() tween(sc, 0.45, { Scale = 1 }, Q) tween(b, 0.55, { Rotation = 0 }, Q) tween(b, 0.3, { TextColor3 = Theme.Text }) end)
	bind(b.InputBegan, function(input) if isPress(input) then sfx("Click", 0.8, 0.7) pressBounce(sc, 0.85) end end)
	return b
end
local closeBtn = circleButton("×", -16, Theme.Bad)
local minBtn = circleButton("–", -58, Theme.Accent2)

local content = new("Frame", { Parent = window, Position = UDim2.fromOffset(0, 68), Size = UDim2.new(1, 0, 1, -68), BackgroundTransparency = 1, ClipsDescendants = true, ZIndex = 11 })

---------------------------------------------------------------------------
-- Coverflow: the 3D picker from the website. The chosen card comes forward and lights up,
-- the others fall back behind it (smaller, lower, turned away, darker).
-- Swipe it, flick it, or tap a card. Used for the tabs and for the background type.
---------------------------------------------------------------------------
local coverflows = {}
local CARD_DARK = Color3.fromRGB(24, 24, 29)
local function coverflow(holder, names, o, onPick)
	local W0 = o.width or 120
	local cf = { holder = holder, items = {}, pos = 1, vel = 0, target = 1, dragging = false, moved = 0,
		startX = 0, startPos = 1, lastX = 0, lastT = 0, downT = 0, flick = 0, held = nil, lastStep = 1,
		w = W0, h = o.height or 36, spread = o.spread or W0 * 0.78, z = o.z or 31, swipe = o.swipe or 100 }
	for i, name in ipairs(names) do
		local shadow = new("Frame", { Parent = holder, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), BackgroundColor3 = BLACK, BackgroundTransparency = 0.5, BorderSizePixel = 0, ZIndex = cf.z }, { corner() })
		local b = new("TextButton", { Parent = holder, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(cf.w, cf.h), BackgroundColor3 = CARD_DARK, AutoButtonColor = false, Text = "", ZIndex = cf.z + 1 }, { corner() })
		new("UIGradient", { Parent = b, Rotation = 90, Color = seq({ WHITE, Color3.fromRGB(200, 202, 210) }) })
		local rim = stroke(WHITE, 1.2, 0.5)
		rim.Parent = b
		-- light that runs across the card when it is picked
		local shineFrame = new("Frame", { Parent = b, Size = UDim2.fromScale(1, 1), BackgroundColor3 = WHITE, BorderSizePixel = 0, ZIndex = cf.z + 2 }, { corner() })
		local shine = new("UIGradient", { Parent = shineFrame, Rotation = 20, Offset = Vector2.new(-1.3, 0), Transparency = nseq({ { 0, 1 }, { 0.4, 1 }, { 0.5, 0.3 }, { 0.6, 1 }, { 1, 1 } }) })
		local label = fontProp(new("TextLabel", { Parent = b, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Font = FONT_HEAD, TextSize = o.textSize or 14, TextColor3 = Theme.Muted, Text = string.upper((o.labels and o.labels[i]) or name), ZIndex = cf.z + 3 }))
		local it = { button = b, shadow = shadow, label = label, rim = rim, shine = shine, scale = new("UIScale", { Parent = b }), shadowScale = new("UIScale", { Parent = shadow }), hover = 0, hoverS = 0, heldS = 0 }
		cf.items[i] = it
		bind(b.MouseEnter, function() it.hover = 1 if cf.target ~= i then sfx("Hover", 1.6, 0.15) end end)
		bind(b.MouseLeave, function() it.hover = 0 end)
		bind(b.InputBegan, function(input) if isPress(input) then cf.startDrag(input, i) end end)
	end

	function cf.layout(dt)
		for i, it in ipairs(cf.items) do
			local d = i - cf.pos
			local m = math.min(math.abs(d), 2.4)
			local focus = math.clamp(1 - math.abs(d) * 1.25, 0, 1)
			local fade = math.clamp((math.abs(d) - 1.6) / 0.8, 0, 1)
			it.hoverS = it.hoverS + (it.hover - it.hoverS) * math.min(1, dt * 10)
			it.heldS = it.heldS + (((cf.held == i) and 1 or 0) - it.heldS) * math.min(1, dt * 16)
			local x = (d >= 0 and 1 or -1) * cf.spread * (1.2 * m - 0.2 * m * m)
			local y = m * 3 - focus * 2
			local scale = (1 - 0.2 * m) * (1 - it.heldS * 0.06) * (1 + it.hoverS * 0.05 * (1 - focus))
			local w = cf.w * (1 - 0.18 * math.min(m, 1)) -- squeezed: looks turned away
			local zi = cf.z + 1 + (10 - math.floor(m * 4 + 0.5)) * 4
			local b = it.button
			b.Visible, it.shadow.Visible = fade < 1, fade < 1
			b.Position = UDim2.new(0.5, x, 0.5, y)
			b.Size = UDim2.fromOffset(w, cf.h)
			b.ZIndex = zi
			it.scale.Scale = scale
			it.shadow.ZIndex = zi - 1
			it.shadow.Position = UDim2.new(0.5, x, 0.5, y + 4 + focus * 2)
			it.shadow.Size = UDim2.fromOffset(w + 6, cf.h + 4)
			it.shadowScale.Scale = scale
			it.shadow.BackgroundTransparency = math.clamp(0.45 + m * 0.2 + fade, 0, 1)
			b.BackgroundColor3 = CARD_DARK:Lerp(WHITE, focus):Lerp(BLACK, it.heldS * 0.35 + m * 0.12):Lerp(Color3.fromRGB(48, 48, 56), it.hoverS * (1 - focus) * 0.6)
			b.BackgroundTransparency = fade
			it.label.TextColor3 = Theme.Muted:Lerp(Theme.Text, it.hoverS * 0.7):Lerp(Theme.Dark, focus)
			it.label.TextTransparency = math.clamp(fade + math.max(0, m - 1) * 0.35, 0, 1)
			it.rim.Transparency = math.clamp(0.2 + (1 - focus) * 0.5 + fade, 0, 1)
		end
	end
	function cf.step(dt)
		dt = math.min(dt, 1 / 30)
		if not cf.dragging then
			-- spring toward the chosen card (a touch under critical damping: one soft settle)
			local k = 85
			local c = 2 * math.sqrt(k) * 0.8
			cf.vel = cf.vel + ((cf.target - cf.pos) * k - cf.vel * c) * dt
			cf.pos = cf.pos + cf.vel * dt
		end
		cf.layout(dt)
	end
	-- move the focus to card i (visual only; onPick decides what it means)
	function cf.focus(i)
		local changed = cf.target ~= i
		cf.target, cf.lastStep = i, i
		if changed then
			local it = cf.items[i]
			it.shine.Offset = Vector2.new(-1.3, 0)
			tween(it.shine, 0.9, { Offset = Vector2.new(1.3, 0) }, SINE, INOUT, 0.15)
		end
	end
	local function pick(i)
		if cf.target ~= i then sfx("Click", 1.2, 0.6) sfx("Open", 1.9, 0.25) else sfx("Click", 1.2, 0.4) end
		cf.focus(i)
		if onPick then onPick(i) end
	end
	local function toLocal(px) return px / math.max(rootScale.Scale, 0.01) end
	function cf.startDrag(input, i)
		-- a tap on a card can also reach the holder behind it: keep the card
		if cf.dragging and os.clock() - cf.downT < 0.1 then
			if i then cf.held = i end
			return
		end
		cf.dragging, cf.moved, cf.downT = true, 0, os.clock()
		cf.startX, cf.startPos = input.Position.X, cf.pos
		cf.lastX, cf.lastT, cf.flick = input.Position.X, os.clock(), 0
		cf.held, cf.vel = i, 0
	end
	bind(holder.InputBegan, function(input) if isPress(input) then cf.startDrag(input, nil) end end)
	bind(UserInputService.InputChanged, function(input)
		if not (cf.dragging and isMove(input)) then return end
		local dx = input.Position.X - cf.startX
		cf.moved = math.max(cf.moved, math.abs(dx))
		if cf.moved < 6 then return end
		cf.held = nil
		local raw = cf.startPos - toLocal(dx) / cf.swipe
		-- rubber band past the first and last card
		if raw < 1 then raw = 1 - (1 - raw) * 0.35 elseif raw > #names then raw = #names + (raw - #names) * 0.35 end
		local now = os.clock()
		local step = math.max(now - cf.lastT, 1 / 240)
		cf.flick = cf.flick * 0.5 + (-toLocal(input.Position.X - cf.lastX) / cf.swipe / step) * 0.5
		cf.lastX, cf.lastT = input.Position.X, now
		cf.pos = raw
		local near = math.clamp(math.floor(raw + 0.5), 1, #names)
		if near ~= cf.lastStep then
			cf.lastStep = near
			sfx("Hover", 1.8, 0.25)
		end
	end)
	bind(UserInputService.InputEnded, function(input)
		if not (cf.dragging and isPress(input)) then return end
		cf.dragging = false
		local tapped = cf.held
		cf.held = nil
		if cf.moved < 6 then
			if tapped then pick(tapped) end
			return
		end
		-- a quick flick carries on to the next card
		local flick = math.clamp(cf.flick, -12, 12)
		local land = math.clamp(math.floor(cf.pos + flick * 0.08 + 0.5), 1, #names)
		cf.vel = flick * 0.6
		cf.target = -1 -- make sure the landing card gets its light sweep
		pick(land)
	end)
	table.insert(coverflows, cf)
	return cf
end

---------------------------------------------------------------------------
-- Tabs
---------------------------------------------------------------------------
local TAB_NAMES = { "Farm", "Protect", "ESP", "Events", "Aimlock", "Config" }
local DECK_W, DECK_H = 384, 50
-- it lives outside the window so it can fly in on its own before the window appears
local deck = new("CanvasGroup", { Parent = root, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0.5, 34, 0, 34), Size = UDim2.fromOffset(DECK_W, DECK_H), BackgroundTransparency = 1, ZIndex = 30 })
local deckBase = deck.Position
-- the ends fade out so the cards look like they go round a curve
new("UIGradient", { Parent = deck, Transparency = nseq({ { 0, 1 }, { 0.1, 0.15 }, { 0.22, 0 }, { 0.78, 0 }, { 0.9, 0.15 }, { 1, 1 } }) })

local tabs, pages, cardsOf, tabIndex, currentTab = {}, {}, {}, {}, nil
local selectTab
local carousel = coverflow(deck, TAB_NAMES, { width = 118, height = 34, spread = 92, z = 31, swipe = 100 }, function(i) selectTab(TAB_NAMES[i]) end)

local function cascadeIn(name)
	for i, c in ipairs(cardsOf[name] or {}) do
		if c.obj.Parent and c.obj.Visible then
			c.obj.Rotation = 0
			c.scale.Scale = 0.9
			tween(c.scale, 0.6, { Scale = 1 }, Q, OUT, 0.05 + i * 0.035)
		end
	end
end

selectTab = function(name)
	local toI = tabIndex[name]
	carousel.focus(toI)
	if currentTab == name then return end
	local prevName = currentTab
	local prev = prevName and pages[prevName]
	currentTab = name
	local fromI = tabIndex[prevName] or toI
	local dir = (prev and toI < fromI) and -1 or 1
	if prev then
		prev.ZIndex = 11
		tween(prev, 0.35, { GroupTransparency = 1, Position = UDim2.fromOffset(-60 * dir, 0) }, Q, OUT)
		task.delay(0.35, function() if currentTab ~= prevName then prev.Visible = false end end)
	end
	local page = pages[name]
	page.ZIndex = 12
	page.Visible = true
	page.Position = UDim2.fromOffset(60 * dir, 0)
	page.GroupTransparency = 1
	tween(page, 0.55, { GroupTransparency = 0, Position = UDim2.fromOffset(0, 0) }, Q, OUT)
	cascadeIn(name)
end

local function addPage(name)
	local i = #TAB_NAMES
	for k, n in ipairs(TAB_NAMES) do if n == name then i = k end end
	tabIndex[name] = i

	local page = new("CanvasGroup", { Parent = content, Name = name, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, GroupTransparency = 1, Visible = false, ZIndex = 11 })
	local scroll = new("ScrollingFrame", {
		Parent = page, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 3, ScrollBarImageColor3 = Theme.Accent2,
		CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, ScrollingDirection = Enum.ScrollingDirection.Y, ZIndex = 11,
	}, { pad(6, 18, 18, 18), new("UIListLayout", { Padding = UDim.new(0, 10), SortOrder = Enum.SortOrder.LayoutOrder }) })
	pages[name] = page
	cardsOf[name] = {}
	return { scroll = scroll, name = name, grid = nil, order = 0 }
end

---------------------------------------------------------------------------
-- Components: liquid-glass cards in a two-column grid
---------------------------------------------------------------------------
local function Section(pg, text)
	pg.order = pg.order + 1
	local f = new("Frame", { Parent = pg.scroll, Size = UDim2.new(1, 0, 0, 22), BackgroundTransparency = 1, LayoutOrder = pg.order, ZIndex = 12 })
	local l = fontProp(new("TextLabel", { Parent = f, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Font = FONT_HEAD, TextSize = 14, TextColor3 = Theme.Accent2, TextXAlignment = Enum.TextXAlignment.Left, Text = string.upper(text), ZIndex = 12 }))
	themeProp(l, "TextColor3", "Accent2")
	pg.order = pg.order + 1
	pg.lastLabel = l
	pg.grid = new("Frame", { Parent = pg.scroll, Size = UDim2.new(1, 0, 0, 0), AutomaticSize = Enum.AutomaticSize.Y, BackgroundTransparency = 1, LayoutOrder = pg.order, ZIndex = 12 },
		{ new("UIGridLayout", { CellSize = UDim2.new(0.5, -5, 0, 74), CellPadding = UDim2.fromOffset(10, 10), SortOrder = Enum.SortOrder.LayoutOrder }) })
end

local function card(pg)
	-- see-through glass: the background photo shows through, it darkens on hover and while held
	local c = new("TextButton", { Parent = pg.grid, BackgroundColor3 = Theme.Card, AutoButtonColor = false, Text = "", ClipsDescendants = true, ZIndex = 12 }, { corner(20) })
	themeProp(c, "BackgroundColor3", "Card")
	local rim = liquidGlass(c, 0.58)
	local sc = new("UIScale", { Parent = c })
	table.insert(cardsOf[pg.name], { obj = c, scale = sc })
	glassInteract(c, sc)
	bind(c.MouseEnter, function() sfx("Hover", 1.7, 0.2) tween(rim, 0.3, { Thickness = 1.8 }) end)
	bind(c.MouseLeave, function() tween(rim, 0.4, { Thickness = 1.2 }) end)
	bind(c.InputBegan, function(input) if isPress(input) then sfx("Click", 1, 0.7) end end)
	return c, sc
end
local function cardText(c, titleText, desc, rightSpace)
	new("TextLabel", { Parent = c, BackgroundTransparency = 1, Position = UDim2.fromOffset(16, desc and 14 or 0), Size = UDim2.new(1, -(rightSpace or 80), 0, desc and 20 or 74), Font = Enum.Font.GothamBold, TextSize = 14, TextColor3 = Theme.Text, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = titleText, ZIndex = 13 })
	if desc then
		new("TextLabel", { Parent = c, BackgroundTransparency = 1, Position = UDim2.fromOffset(16, 36), Size = UDim2.new(1, -(rightSpace or 80), 0, 28), Font = Enum.Font.Gotham, TextSize = 11, TextColor3 = Theme.Muted, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true, Text = desc, ZIndex = 13 })
	end
end

-- one small particle: flies by (dx, dy) and fades
local function spark(parent, x, y, dx, dy, color, life, size, style)
	local s = size or 3
	local p = new("Frame", { Parent = parent, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromOffset(x, y), Size = UDim2.fromOffset(s, s), BackgroundColor3 = color or WHITE, BorderSizePixel = 0, ZIndex = 20 }, { corner() })
	tween(p, life or 0.6, { Position = UDim2.fromOffset(x + dx, y + dy), Size = UDim2.fromOffset(0, 0), BackgroundTransparency = 1 }, style or Q, OUT)
	task.delay((life or 0.6) + 0.05, function() p:Destroy() end)
end
-- centre of a GUI object inside another one, in the window's own pixels
local function centerIn(obj, parent)
	local s = math.max(rootScale.Scale, 0.01)
	local p = (obj.AbsolutePosition + obj.AbsoluteSize / 2 - parent.AbsolutePosition) / s
	return p.X, p.Y
end

local function Toggle(pg, titleText, desc, default, callback)
	local c, sc = card(pg)
	cardText(c, titleText, desc, 84)
	local rim = c:FindFirstChildOfClass("UIStroke")
	local titleL = c:FindFirstChildOfClass("TextLabel")
	local track = new("Frame", { Parent = c, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -16, 0.5, 0), Size = UDim2.fromOffset(54, 30), BackgroundColor3 = BLACK, BackgroundTransparency = 0.55, ClipsDescendants = true, ZIndex = 13 }, { corner() })
	local trackFill = new("Frame", { Parent = track, Size = UDim2.fromScale(0, 1), BackgroundColor3 = WHITE, BackgroundTransparency = 0.1, BorderSizePixel = 0, ZIndex = 13 }, { corner() })
	local fillGrad = new("UIGradient", { Parent = trackFill, Color = seq({ Theme.Accent2, Theme.Accent }) })
	-- the charge: a band of light that runs through the track when it turns on
	local zap = new("Frame", { Parent = track, Size = UDim2.fromScale(1, 1), BackgroundColor3 = WHITE, BorderSizePixel = 0, ZIndex = 14 }, { corner() })
	local zapG = new("UIGradient", { Parent = zap, Offset = Vector2.new(-1.2, 0), Transparency = nseq({ { 0, 1 }, { 0.4, 1 }, { 0.5, 0.05 }, { 0.6, 1 }, { 1, 1 } }) })
	local trackRim = stroke(WHITE, 1, 0.6)
	trackRim.Parent = track
	local knob = new("Frame", { Parent = c, AnchorPoint = Vector2.new(0.5, 0.5), Size = UDim2.fromOffset(22, 22), BackgroundColor3 = WHITE, ZIndex = 16 }, { corner() })
	new("UIGradient", { Parent = knob, Rotation = 90, Color = seq({ WHITE, Color3.fromRGB(205, 212, 226) }) })
	local kGlow = stroke(Theme.Accent2, 0, 0.35)
	kGlow.Parent = knob
	-- light across the whole card (bright on, dark off)
	local wash = new("Frame", { Parent = c, Size = UDim2.fromScale(1, 1), BackgroundColor3 = WHITE, BackgroundTransparency = 1, BorderSizePixel = 0, ZIndex = 12 }, { corner(20), new("UIGradient", { Transparency = nseq({ { 0, 1 }, { 0.6, 0.6 }, { 1, 0.2 } }) }) })
	local state = default and true or false
	-- knob lives on the card so it can grow past the track
	local function knobPos(on) return on and UDim2.new(1, -31, 0.5, 0) or UDim2.new(1, -55, 0.5, 0) end
	knob.Position = knobPos(state)
	trackFill.Size = state and UDim2.fromScale(1, 1) or UDim2.fromScale(0, 1)
	kGlow.Thickness = state and 4 or 0
	local function powerOn()
		fillGrad.Color = seq({ Theme.Accent2, Theme.Accent })
		-- knob stretches, flies across, lands with a bounce
		tween(knob, 0.12, { Size = UDim2.fromOffset(34, 18) }, QUAD, OUT)
		tween(knob, 0.42, { Position = knobPos(true) }, Q, OUT)
		task.delay(0.12, function() tween(knob, 0.5, { Size = UDim2.fromOffset(22, 22) }, BACK, OUT) end)
		tween(trackFill, 0.4, { Size = UDim2.fromScale(1, 1) }, Q, OUT)
		zapG.Offset = Vector2.new(-1.2, 0)
		tween(zapG, 0.55, { Offset = Vector2.new(1.2, 0) }, SINE, INOUT, 0.1)
		tween(kGlow, 0.4, { Thickness = 4 })
		tween(trackRim, 0.3, { Transparency = 0.1 })
		-- the card lights up from the switch side and the rim flares
		wash.BackgroundColor3 = Theme.Accent2
		wash.BackgroundTransparency = 0.55
		tween(wash, 0.8, { BackgroundTransparency = 1 }, Q, OUT, 0.1)
		if rim then
			rim.Thickness = 2.8
			tween(rim, 0.7, { Thickness = 1.2 }, Q, OUT)
		end
		if titleL then
			titleL.TextColor3 = Theme.Accent2
			tween(titleL, 0.8, { TextColor3 = Theme.Text }, Q, OUT, 0.2)
		end
		-- a halo pops out of the knob, sparks fly up
		task.delay(0.3, function()
			local x, y = centerIn(knob, c)
			local halo = new("Frame", { Parent = c, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromOffset(x, y), Size = UDim2.fromOffset(22, 22), BackgroundTransparency = 1, ZIndex = 15 }, { corner() })
			local hs = stroke(Theme.Accent2, 2, 0)
			hs.Parent = halo
			tween(halo, 0.6, { Size = UDim2.fromOffset(58, 58) }, Q, OUT)
			tween(hs, 0.6, { Transparency = 1, Thickness = 0.5 }, Q, OUT)
			task.delay(0.65, function() halo:Destroy() end)
			for k = 1, 9 do
				local a = -math.pi / 2 + (k - 5) * 0.32 + (math.random() - 0.5) * 0.2
				local d = math.random(16, 30)
				spark(c, x, y, math.cos(a) * d, math.sin(a) * d, (k % 3 == 0) and WHITE or Theme.Accent2, 0.6, math.random(2, 4))
			end
		end)
		sfx("Toggle", 1.3, 0.6)
		sfx("Notify", 1.6, 0.2)
	end
	local function powerOff()
		-- knob implodes, slides home, then puffs back to size
		tween(knob, 0.16, { Size = UDim2.fromOffset(14, 14) }, QUAD, OUT)
		tween(knob, 0.45, { Position = knobPos(false) }, Q, INOUT)
		task.delay(0.35, function() tween(knob, 0.45, { Size = UDim2.fromOffset(22, 22) }, BACK, OUT) end)
		-- the colour drains out of the track
		tween(trackFill, 0.5, { Size = UDim2.fromScale(0, 1) }, Q, INOUT)
		tween(kGlow, 0.3, { Thickness = 0 })
		tween(trackRim, 0.4, { Transparency = 0.6 })
		-- the card dims for a moment, the switch trembles
		wash.BackgroundColor3 = BLACK
		wash.BackgroundTransparency = 0.35
		tween(wash, 0.7, { BackgroundTransparency = 1 }, SINE, OUT, 0.1)
		if titleL then
			titleL.TextColor3 = Theme.Muted
			tween(titleL, 0.7, { TextColor3 = Theme.Text }, SINE, OUT, 0.2)
		end
		task.spawn(function()
			for k = 1, 4 do
				track.Position = UDim2.new(1, -16 + ((k % 2 == 0) and 2 or -2), 0.5, 0)
				task.wait(0.03)
			end
			track.Position = UDim2.new(1, -16, 0.5, 0)
		end)
		-- grey embers drop out of the switch
		local x, y = centerIn(track, c)
		for k = 1, 6 do
			spark(c, x + math.random(-22, 22), y, math.random(-6, 6), math.random(24, 42), Color3.fromRGB(120, 122, 130), 0.75, math.random(2, 3), QUAD)
		end
		sfx("Toggle", 0.75, 0.55)
		sfx("Close", 1.7, 0.2)
	end
	bind(c.Activated, function()
		state = not state
		if state then powerOn() else powerOff() end
		pressBounce(sc, 0.95)
		task.spawn(callback, state)
	end)
	return {
		set = function(v) if v ~= state then state = v if state then powerOn() else powerOff() end end task.spawn(callback, state) end,
		get = function() return state end,
	}
end

local function Slider(pg, titleText, min, max, default, suffix, callback, snapFn, fmtFn)
	local c = card(pg)
	new("TextLabel", { Parent = c, BackgroundTransparency = 1, Position = UDim2.fromOffset(16, 12), Size = UDim2.new(1, -110, 0, 20), Font = Enum.Font.GothamBold, TextSize = 14, TextColor3 = Theme.Text, TextXAlignment = Enum.TextXAlignment.Left, Text = titleText, ZIndex = 13 })
	local valuePill = new("Frame", { Parent = c, AnchorPoint = Vector2.new(1, 0), Position = UDim2.new(1, -14, 0, 10), Size = UDim2.fromOffset(66, 24), BackgroundColor3 = BLACK, ClipsDescendants = true, ZIndex = 13 }, { corner() })
	liquidGlass(valuePill, 0.55)
	-- the number rolls: up from below when it rises, down from above when it falls
	local valueText = new("TextLabel", { Parent = valuePill, BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1), Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = Theme.Accent2, Text = "", ZIndex = 14 })
	themeProp(valueText, "TextColor3", "Accent2")
	local vsc = new("UIScale", { Parent = valuePill })
	local bar = new("Frame", { Parent = c, Position = UDim2.new(0, 16, 0, 48), Size = UDim2.new(1, -32, 0, 8), BackgroundColor3 = BLACK, BackgroundTransparency = 0.5, ZIndex = 13 }, { corner() })
	local fillBar = new("Frame", { Parent = bar, Size = UDim2.fromScale(0, 1), BackgroundColor3 = WHITE, BackgroundTransparency = 0.1, ZIndex = 14 }, { corner() })
	local fg = shimmerGradient(new("UIGradient", { Parent = fillBar, Color = seq({ Theme.Accent, Theme.Accent2, Theme.Accent }) }), 0.8)
	local knob = new("Frame", { Parent = bar, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0, 0.5), Size = UDim2.fromOffset(20, 20), BackgroundColor3 = WHITE, ZIndex = 16 }, { corner() })
	new("UIGradient", { Parent = knob, Rotation = 90, Color = seq({ WHITE, Color3.fromRGB(205, 212, 226) }) })
	local kStroke = stroke(Theme.Accent, 3, 0.15)
	kStroke.Parent = knob
	themeProp(kStroke, "Color")
	local kScale = new("UIScale", { Parent = knob })
	-- soft halo that grows around the knob while you hold it
	local halo = new("Frame", { Parent = knob, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ZIndex = 15 }, { corner() })
	local haloS = stroke(Theme.Accent2, 2, 1)
	haloS.Parent = halo
	local value = default
	local dragging = false
	local lastTick, lastFx = 0, 0
	local function render(v, animate)
		local nv = snapFn and snapFn(v) or math.clamp(math.floor(v + 0.5), min, max)
		local dir = nv > value and 1 or (nv < value and -1 or 0)
		value = nv
		local a = (value - min) / (max - min)
		local t = animate and 0.2 or 0
		fg.Color = seq({ Theme.Accent, Theme.Accent2, Theme.Accent })
		tween(fillBar, t, { Size = UDim2.fromScale(a, 1) }, Q)
		tween(knob, t, { Position = UDim2.fromScale(a, 0.5) }, Q)
		valueText.Text = fmtFn and fmtFn(value) or (tostring(value) .. (suffix or ""))
		if not (animate and dir ~= 0) then return end
		valueText.Position = UDim2.fromOffset(0, dir * 9)
		tween(valueText, 0.3, { Position = UDim2.fromOffset(0, 0) }, Q, OUT)
		vsc.Scale = 1.1
		tween(vsc, 0.35, { Scale = 1 }, BACK)
		-- the line brightens going up and dims a little going down
		fillBar.BackgroundTransparency = dir > 0 and 0 or 0.35
		tween(fillBar, 0.5, { BackgroundTransparency = 0.1 }, Q)
		if os.clock() - lastFx > 0.04 then
			lastFx = os.clock()
			local x, y = centerIn(knob, c)
			if dir > 0 then
				-- rising: bright sparks shoot up and forward
				for _ = 1, 2 do spark(c, x, y, math.random(4, 16), -math.random(12, 26), (math.random() < 0.4) and WHITE or Theme.Accent2, 0.5, math.random(2, 4)) end
			else
				-- falling: grey drops fall off behind
				spark(c, x, y, -math.random(4, 14), math.random(12, 24), Color3.fromRGB(130, 132, 140), 0.6, math.random(2, 3), QUAD)
			end
		end
		-- revving tick: higher value, higher pitch
		if dragging and os.clock() - lastTick > 0.035 then
			lastTick = os.clock()
			sfx("Slider", 0.6 + a * 1.8, 0.35)
		end
		-- hitting the top flashes the card, hitting the bottom thuds
		if dragging and (value == max or value == min) then
			local x, y = centerIn(knob, c)
			if value == max then
				burst(c, x, y, Theme.Accent2, 12)
				sfx("Toggle", 1.5, 0.4)
			else
				for k = 1, 5 do spark(c, x + k * 3, y, 0, math.random(18, 30), Color3.fromRGB(110, 112, 120), 0.6, 3, QUAD) end
				sfx("Toggle", 0.6, 0.4)
			end
		end
	end
	render(default, false)
	local function fromX(x)
		local a = math.clamp((x - bar.AbsolutePosition.X) / bar.AbsoluteSize.X, 0, 1)
		local before = value
		render(min + a * (max - min), true)
		if value ~= before then task.spawn(callback, value) end
	end
	bind(c.InputBegan, function(input)
		if isPress(input) and guiY(input.Position.Y) >= bar.AbsolutePosition.Y - 20 then
			dragging = true
			tween(kScale, 0.4, { Scale = 1.4 }, BACK, OUT)
			tween(haloS, 0.3, { Transparency = 0.3 })
			tween(halo, 0.4, { Size = UDim2.fromScale(1.9, 1.9) }, Q, OUT)
			fromX(input.Position.X)
		end
	end)
	bind(UserInputService.InputChanged, function(input) if dragging and isMove(input) then fromX(input.Position.X) end end)
	bind(UserInputService.InputEnded, function(input)
		if dragging and isPress(input) then
			dragging = false
			tween(kScale, 0.5, { Scale = 1 }, BACK, OUT)
			-- the halo lets go in a ring
			tween(halo, 0.5, { Size = UDim2.fromScale(2.8, 2.8) }, Q, OUT)
			tween(haloS, 0.5, { Transparency = 1 }, Q, OUT)
			task.delay(0.5, function() halo.Size = UDim2.fromScale(1, 1) end)
		end
	end)
	return { set = function(v) render(v, true) task.spawn(callback, value) end, show = function(v) render(v, true) end, get = function() return value end }
end

local function Button(pg, titleText, desc, label, callback)
	local c, sc = card(pg)
	cardText(c, titleText, desc, 100)
	local bGlow = new("Frame", { Parent = c, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -10, 0.5, 4), Size = UDim2.fromOffset(82, 34), BackgroundColor3 = Theme.Accent2, BackgroundTransparency = 1, Visible = false, ZIndex = 13 }, { corner() })
	themeProp(bGlow, "BackgroundColor3", "Accent2")
	local btn = new("TextLabel", { Parent = c, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -14, 0.5, 0), Size = UDim2.fromOffset(74, 32), BackgroundColor3 = WHITE, Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = WHITE, Text = label or "Run", ZIndex = 14 }, { corner() })
	liquidGlass(btn, 0.82)
	local bsc = new("UIScale", { Parent = btn })
	bind(c.Activated, function()
		pressBounce(sc, 0.95)
		pressBounce(bsc, 0.8)
		sfx("Toggle", 1.5, 0.4)
		burst(c, btn.AbsolutePosition.X - c.AbsolutePosition.X + 37, 37, WHITE, 10)
		task.spawn(callback)
	end)
end

local function Info(pg, label, value)
	local c = card(pg)
	new("TextLabel", { Parent = c, BackgroundTransparency = 1, Position = UDim2.fromOffset(16, 14), Size = UDim2.new(1, -32, 0, 14), Font = Enum.Font.Gotham, TextSize = 11, TextColor3 = Theme.Muted, TextXAlignment = Enum.TextXAlignment.Left, Text = string.upper(label), ZIndex = 13 })
	new("TextLabel", { Parent = c, BackgroundTransparency = 1, Position = UDim2.fromOffset(16, 32), Size = UDim2.new(1, -32, 0, 28), Font = Enum.Font.GothamBlack, TextSize = 18, TextColor3 = Theme.Text, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = value, ZIndex = 13 })
end

---------------------------------------------------------------------------
-- Themes + animation loop
---------------------------------------------------------------------------
local rainbow = false
local themeCards = {}
local function refreshThemeCards()
	for name, tc in pairs(themeCards) do
		local on = name == currentTheme.Name
		tween(tc.ring, 0.35, { Transparency = on and 0 or 1, Thickness = on and 3 or 1 })
		tween(tc.check, 0.5, { Size = on and UDim2.fromOffset(24, 24) or UDim2.fromOffset(0, 0) }, BACK)
	end
end
local function applyTheme(t, quiet)
	currentTheme = t
	loadThemeColors(t)
	for _, a in ipairs(themed) do
		if a.inst.Parent then tween(a.inst, 0.7, { [a.prop] = Theme[a.key] }) end
	end
	for _, g in ipairs(borderGradients) do g.Color = borderSeq() end
	applyBackground(t, true)
	refreshThemeCards()
	glowFlash = 1
	if not quiet then notify("Theme", t.Name .. " applied", 2, t.Accent) end
end

local clock = 0
local gravityRest = nil
bind(RunService.RenderStepped, function(dt)
	clock = clock + dt
	for i = #spinners, 1, -1 do
		local s = spinners[i]
		if s.g.Parent then s.g.Rotation = (s.g.Rotation + dt * s.s) % 360 else table.remove(spinners, i) end
	end
	for i = #shimmers, 1, -1 do
		local s = shimmers[i]
		if s.g.Parent then s.g.Offset = Vector2.new(math.sin(clock * s.s * math.pi) * 0.5, 0) else table.remove(shimmers, i) end
	end
	for img, sh in pairs(animated) do
		if img.Parent then
			local frame = math.floor(clock * (sh.FPS or 12)) % sh.Frames
			local w, h = img.ImageRectSize.X, img.ImageRectSize.Y
			img.ImageRectOffset = Vector2.new((frame % sh.Columns) * w, math.floor(frame / sh.Columns) * h)
		else
			animated[img] = nil
		end
	end
	if rainbow then
		Theme.Accent = Color3.fromHSV((clock * 0.08) % 1, 0.75, 1)
		Theme.Accent2 = Color3.fromHSV((clock * 0.08 + 0.08) % 1, 0.35, 1)
		for _, g in ipairs(borderGradients) do g.Color = borderSeq() end
		for _, a in ipairs(themed) do
			if a.inst.Parent and (a.key == "Accent" or a.key == "Accent2") then a.inst[a.prop] = Theme[a.key] end
		end
	end
	-- breathing glow (flashes on theme change), floating orb, idle logo bob
	glowFlash = math.max(0, glowFlash - dt * 1.4)
	glow.BackgroundTransparency = 0.85 - glowFlash * 0.4 + math.sin(clock * 2) * 0.03
	-- tilt: phone accelerometer, or the mouse on PC. Drives the glass light and the depth.
	local tc = CONFIG.Tilt or {}
	local tiltTarget = Vector2.new(0, 0)
	if tc.Enabled ~= false then
		local vp = viewport()
		if UserInputService.AccelerometerEnabled then
			local ok, g = pcall(function() return UserInputService:GetDeviceGravity() end)
			if ok and g and g.Position.Magnitude > 0.01 then
				local v = g.Position.Unit
				-- phones play in landscape, where the device's axes are swapped against the screen
				local raw = vp.X > vp.Y and Vector2.new(v.Y, v.X) or Vector2.new(v.X, -v.Y)
				-- the rest position slowly follows how you hold the phone, so only movement counts
				gravityRest = gravityRest and gravityRest:Lerp(raw, math.min(1, dt * 0.5)) or raw
				local d = (raw - gravityRest) * (tc.Strength or 3)
				tiltTarget = Vector2.new(math.clamp(d.X, -1, 1) * (tc.InvertX and -1 or 1), math.clamp(d.Y, -1, 1) * (tc.InvertY and -1 or 1))
			end
		elseif not isMobile then
			local m = UserInputService:GetMouseLocation()
			tiltTarget = Vector2.new((m.X / vp.X - 0.5) * 1.4, (m.Y / vp.Y - 0.5) * 1.4)
		end
	end
	tilt = tilt:Lerp(tiltTarget, math.min(1, dt * 5))
	if root.Visible or toastCurrent ~= nil then
		for i = #glassRims, 1, -1 do
			local r = glassRims[i]
			if r.g.Parent then r.g.Rotation = r.base + tilt.X * 70 + tilt.Y * 30 else table.remove(glassRims, i) end
		end
		for i = #glassSheens, 1, -1 do
			local g = glassSheens[i]
			if g.Parent then g.Offset = Vector2.new(0, tilt.Y * 0.35) g.Rotation = 90 - tilt.X * 25 else table.remove(glassSheens, i) end
		end
	end
	if root.Visible then
		-- depth: the photo, the orb and the light shift against each other
		photoHolder.Position = UDim2.new(0.5, -tilt.X * 18, 0.5, -tilt.Y * 14)
		specular.Position = UDim2.fromScale(0.5 + tilt.X * 0.4, 0.3 + tilt.Y * 0.35)
		specular.Rotation = -18 + tilt.X * 12
		for _, d in ipairs(dust) do
			local y = 1.05 - ((clock * d.sp + d.p) % 1) * 1.1
			d.f.Position = UDim2.new(d.x, math.sin(clock * 0.7 + d.p * 6) * 10 + tilt.X * 24 * d.depth, y, tilt.Y * 16 * d.depth)
			d.f.BackgroundTransparency = 0.45 + 0.5 * (1 - math.sin(((clock * d.sp + d.p) % 1) * math.pi)) + (1 - d.depth) * 0.2
		end
		for _, cf in ipairs(coverflows) do cf.step(dt) end
	end
	if titleText.group.Parent and math.floor(clock * 10) % 40 == 0 and math.floor((clock - dt) * 10) % 40 ~= 0 then sweepText(titleText, 0.8) end
	topLogo.Position = UDim2.fromOffset(38, 34 + math.sin(clock * 1.6) * 2)
end)

task.spawn(function()
	while gui.Parent do
		task.wait(3.5)
		if root.Visible then for _, sg in ipairs(logoShines) do if sg.Parent then shineLogo(sg) end end end
	end
end)
task.spawn(function()
	while gui.Parent do
		task.wait(4.5)
		if root.Visible then
			sweep.Position = UDim2.fromScale(-0.4, 0.5)
			tween(sweep, 1.4, { Position = UDim2.fromScale(1.4, 0.5) }, Enum.EasingStyle.Quart, INOUT)
		end
	end
end)

---------------------------------------------------------------------------
-- Pages
---------------------------------------------------------------------------
local toggleMenu, replayIntro

local blurOn = true

-- (inside do ... end so its variables stay local: Luau allows only 200 locals in the main body)
do
	local configPage = addPage("Config")
	-- Customize: a coverflow like the tabs. Static photos, motion (GIF) backgrounds, fonts, colours.
	Section(configPage, "Customize")
	configPage.order = configPage.order + 1
	local modeHolder = new("Frame", { Parent = configPage.scroll, Size = UDim2.new(1, 0, 0, 58), BackgroundTransparency = 1, LayoutOrder = configPage.order, ZIndex = 12 })
	Section(configPage, "Static backgrounds")
	local themeLabel = configPage.lastLabel
	local MODES = { "static", "motion", "fonts", "colors" }
	local MODE_TITLES = { "STATIC BACKGROUNDS", "MOTION BACKGROUNDS", "FONTS", "COLORS" }
	local entries = {}
	-- cards made inside fn() belong to that section
	local function tagCards(group, fn)
		local before = #cardsOf[configPage.name]
		fn()
		for i = before + 1, #cardsOf[configPage.name] do
			local e = cardsOf[configPage.name][i]
			table.insert(entries, { card = e.obj, scale = e.scale, group = group })
		end
	end
	local bgMode = themeSheet(currentTheme) and 2 or 1
	local function showMode(mode, animate)
		bgMode = mode
		themeLabel.Text = MODE_TITLES[mode]
		local k = 0
		for _, e in ipairs(entries) do
			local show = e.group == MODES[mode]
			e.card.Visible = show
			if show and animate then
				-- the new set deals itself in, one card after another
				k = k + 1
				e.scale.Scale = 0.6
				e.card.Rotation = (k % 2 == 0) and 7 or -7
				tween(e.scale, 0.65, { Scale = 1 }, BACK, OUT, k * 0.04)
				tween(e.card, 0.65, { Rotation = 0 }, Q, OUT, k * 0.04)
			end
		end
	end
	local setTheme, refreshColorUI
	local modeCf = coverflow(modeHolder, MODES, { width = 140, height = 42, spread = 112, z = 13, swipe = 120, textSize = 16, labels = { "STATIC", "MOTION", "FONTS", "COLORS" } }, function(i)
		if i == bgMode then return end
		showMode(i, true)
		-- picking a background type switches the window to it straight away, so you see it move (or stop)
		if i <= 2 and (themeSheet(currentTheme) ~= nil) ~= (i == 2) then
			for _, t in ipairs(CONFIG.Themes) do
				if (themeSheet(t) ~= nil) == (i == 2) then setTheme(t) break end
			end
		end
	end)
	modeCf.pos, modeCf.target, modeCf.lastStep = bgMode, bgMode, bgMode

	-- a check bubble and a ring that mark the chosen card
	local function markers(c, color)
		local check = new("TextLabel", { Parent = c, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(1, -24, 0.5, 0), Size = UDim2.fromOffset(0, 0), BackgroundColor3 = WHITE, Font = Enum.Font.GothamBlack, TextSize = 13, TextColor3 = color or BLACK, Text = "✓", ZIndex = 15 }, { corner() })
		local ring = stroke(WHITE, 1, 1)
		ring.Parent = c
		return check, ring
	end
	local function setMarked(m, on)
		tween(m.ring, 0.35, { Transparency = on and 0 or 1, Thickness = on and 3 or 1 })
		tween(m.check, 0.5, { Size = on and UDim2.fromOffset(24, 24) or UDim2.fromOffset(0, 0) }, BACK)
	end

	-- Backgrounds (static and motion)
	for _, t in ipairs(CONFIG.Themes) do
		tagCards(themeSheet(t) and "motion" or "static", function()
			local c, sc = card(configPage)
			-- each theme card previews its own photo (or its colours)
			if themeSheet(t) then
				-- animated preview
				local prev = new("ImageLabel", { Parent = c, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ScaleType = Enum.ScaleType.Crop, ImageTransparency = 0.1, ZIndex = 12 }, { corner(20) })
				applySheet(prev, themeSheet(t))
			elseif (t.Background or "") ~= "" then
				new("ImageLabel", { Parent = c, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Image = t.Background, ScaleType = Enum.ScaleType.Crop, ImageTransparency = 0.1, ZIndex = 12 }, { corner(20) })
			else
				new("Frame", { Parent = c, Size = UDim2.fromScale(1, 1), BackgroundColor3 = WHITE, BorderSizePixel = 0, ZIndex = 12 }, { corner(20), new("UIGradient", { Rotation = 135, Color = seq({ t.Accent, t.Panel, t.Panel, t.Hot }) }) })
			end
			new("Frame", { Parent = c, Size = UDim2.fromScale(1, 1), BackgroundColor3 = BLACK, BorderSizePixel = 0, ZIndex = 12 }, { corner(20), new("UIGradient", { Rotation = 0, Transparency = nseq({ { 0, 0.15 }, { 0.6, 0.6 }, { 1, 0.9 } }) }) })
			for k, key in ipairs({ "Accent", "Accent2", "Hot" }) do
				local dot = new("Frame", { Parent = c, Position = UDim2.fromOffset(16 + (k - 1) * 16, 46), Size = UDim2.fromOffset(12, 12), BackgroundColor3 = t[key], ZIndex = 14 }, { corner() })
				stroke(WHITE, 1, 0.4).Parent = dot
			end
			fontProp(new("TextLabel", { Parent = c, BackgroundTransparency = 1, Position = UDim2.fromOffset(16, 14), Size = UDim2.new(1, -60, 0, 22), Font = FONT_HEAD, TextSize = 17, TextColor3 = WHITE, TextXAlignment = Enum.TextXAlignment.Left, Text = string.upper(t.Name), ZIndex = 14 }))
			local check, ring = markers(c, t.Accent)
			ring.Color = t.Accent2
			themeCards[t.Name] = { ring = ring, check = check }
			bind(c.Activated, function()
				rainbow = false
				pressBounce(sc, 0.9)
				burst(c, c.AbsoluteSize.X - 24, 37, t.Accent2, 12)
				sfx("Toggle", 1.1, 0.6)
				sfx("Open", 1.6, 0.3)
				setTheme(t)
			end)
		end)
	end

	-- Fonts: every card shows the name written in its own font
	local FONT_LIST = {
		"LuckiestGuy", "GothamBlack", "FredokaOne", "Bangers", "Michroma", "Sarpanch", "Oswald", "TitilliumWeb", "Jura", "Arcade",
		"SciFi", "Highway", "Cartoon", "PermanentMarker", "Creepster", "DenkOne", "GrenzeGotisch", "Nunito", "Ubuntu", "RobotoCondensed",
		"RobotoMono", "Merriweather", "SpecialElite", "Kalam", "PatrickHand", "IndieFlower", "AmaticSC", "Fondamento", "Bodoni", "Garamond",
		"Antique", "Fantasy", "SourceSansBold", "ArialBold",
	}
	local fontCards = {}
	local currentFontName = (CONFIG.Fonts or {}).Title or "LuckiestGuy"
	local function refreshFontCards()
		for name, m in pairs(fontCards) do setMarked(m, name == currentFontName) end
	end
	for _, fname in ipairs(FONT_LIST) do
		local f = pickFont(fname, nil)
		if f then
			tagCards("fonts", function()
				local c, sc = card(configPage)
				new("Frame", { Parent = c, Size = UDim2.fromScale(1, 1), BackgroundColor3 = WHITE, BorderSizePixel = 0, ZIndex = 12 },
					{ corner(20), new("UIGradient", { Rotation = 120, Color = seq({ Color3.fromRGB(40, 41, 48), Color3.fromRGB(10, 10, 12), Color3.fromRGB(26, 26, 31) }), Transparency = nseq({ { 0, 0.15 }, { 1, 0.3 } }) }) })
				local sample = new("TextLabel", { Parent = c, BackgroundTransparency = 1, Position = UDim2.fromOffset(16, 6), Size = UDim2.new(1, -60, 0, 42), Font = f, TextSize = 30, TextColor3 = WHITE, TextXAlignment = Enum.TextXAlignment.Left, TextScaled = false, Text = "VIREX", ZIndex = 14 })
				new("UIGradient", { Parent = sample, Rotation = 90, Color = seq({ WHITE, Color3.fromRGB(196, 198, 206) }) })
				new("UIStroke", { Parent = sample, Color = BLACK, Thickness = 1.5, LineJoinMode = Enum.LineJoinMode.Round })
				new("TextLabel", { Parent = c, BackgroundTransparency = 1, Position = UDim2.fromOffset(16, 50), Size = UDim2.new(1, -60, 0, 14), Font = Enum.Font.GothamMedium, TextSize = 11, TextColor3 = Theme.Muted, TextXAlignment = Enum.TextXAlignment.Left, Text = fname:gsub("(%l)(%u)", "%1 %2"), ZIndex = 14 })
				local check, ring = markers(c)
				fontCards[fname] = { ring = ring, check = check }
				bind(c.Activated, function()
					pressBounce(sc, 0.9)
					burst(c, c.AbsoluteSize.X - 24, 37, WHITE, 12)
					sfx("Toggle", 1.2, 0.6)
					currentFontName = fname
					setFonts(f)
					refreshFontCards()
					notify("Font", fname:gsub("(%l)(%u)", "%1 %2"), 2, Theme.Accent2)
				end)
			end)
		end
	end

	-- Colours: pick what to paint, then use the palette or the hue / saturation / brightness sliders
	local COLOR_KEYS = { { "Accent", "Accent", "Toggles, sliders, borders" }, { "Accent2", "Glow", "Highlights and labels" }, { "Panel", "Window", "The window behind everything" }, { "Card", "Buttons", "The glass cards" }, { "Text", "Text", "Titles and labels" } }
	local colorKey = "Accent"
	local colorCards = {}
	local syncing = false
	local hsv = { 0, 0, 100 }
	local hueS, satS, valS
	local function paint(key, c)
		Theme[key] = c
		for _, a in ipairs(themed) do
			if a.key == key and a.inst.Parent then tween(a.inst, 0.25, { [a.prop] = c }) end
		end
		if colorCards[key] then tween(colorCards[key].swatch, 0.25, { BackgroundColor3 = c }) end
	end
	local function applyHSV()
		if syncing then return end
		paint(colorKey, Color3.fromHSV(hsv[1] / 360, hsv[2] / 100, hsv[3] / 100))
	end
	refreshColorUI = function()
		for key, cc in pairs(colorCards) do
			cc.swatch.BackgroundColor3 = Theme[key]
			setMarked(cc, key == colorKey)
		end
		if hueS then
			local h, s, v = Theme[colorKey]:ToHSV()
			hsv = { math.floor(h * 360 + 0.5), math.floor(s * 100 + 0.5), math.floor(v * 100 + 0.5) }
			syncing = true
			hueS.set(hsv[1]) satS.set(hsv[2]) valS.set(hsv[3])
			syncing = false
		end
	end
	tagCards("colors", function()
		for _, ck in ipairs(COLOR_KEYS) do
			local key = ck[1]
			local c, sc = card(configPage)
			cardText(c, ck[2], ck[3], 84)
			local swatch = new("Frame", { Parent = c, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -46, 0.5, 0), Size = UDim2.fromOffset(30, 30), BackgroundColor3 = Theme[key], ZIndex = 14 }, { corner() })
			stroke(WHITE, 2, 0.2).Parent = swatch
			local check, ring = markers(c)
			colorCards[key] = { swatch = swatch, ring = ring, check = check }
			bind(c.Activated, function()
				pressBounce(sc, 0.93)
				sfx("Click", 1.3, 0.5)
				colorKey = key
				refreshColorUI()
			end)
		end
		-- palette: 14 quick colours
		local pc = card(configPage)
		new("TextLabel", { Parent = pc, BackgroundTransparency = 1, Position = UDim2.fromOffset(16, 6), Size = UDim2.new(1, -32, 0, 14), Font = Enum.Font.GothamBold, TextSize = 11, TextColor3 = Theme.Muted, TextXAlignment = Enum.TextXAlignment.Left, Text = "PALETTE", ZIndex = 13 })
		local PALETTE = {
			Color3.fromRGB(255, 255, 255), Color3.fromRGB(200, 202, 210), Color3.fromRGB(120, 122, 130), Color3.fromRGB(30, 30, 36), Color3.fromRGB(8, 8, 10), Color3.fromRGB(255, 60, 92), Color3.fromRGB(255, 140, 50),
			Color3.fromRGB(255, 214, 80), Color3.fromRGB(60, 220, 140), Color3.fromRGB(60, 200, 255), Color3.fromRGB(47, 107, 255), Color3.fromRGB(138, 76, 255), Color3.fromRGB(255, 110, 210), Color3.fromRGB(150, 110, 70),
		}
		for i, col in ipairs(PALETTE) do
			local row, colI = math.floor((i - 1) / 7), (i - 1) % 7
			local sw = new("TextButton", { Parent = pc, Position = UDim2.new(colI / 7, 12, 0, 24 + row * 24), Size = UDim2.fromOffset(20, 20), BackgroundColor3 = col, AutoButtonColor = false, Text = "", ZIndex = 14 }, { corner() })
			stroke(WHITE, 1, 0.4).Parent = sw
			local ssc = new("UIScale", { Parent = sw })
			bind(sw.Activated, function()
				pressBounce(ssc, 0.7)
				sfx("Toggle", 1.4, 0.4)
				paint(colorKey, col)
				refreshColorUI()
			end)
		end
		hueS = Slider(configPage, "Hue", 0, 360, 0, "°", function(v) hsv[1] = v applyHSV() end)
		satS = Slider(configPage, "Saturation", 0, 100, 0, "%", function(v) hsv[2] = v applyHSV() end)
		valS = Slider(configPage, "Brightness", 0, 100, 100, "%", function(v) hsv[3] = v applyHSV() end)
		Button(configPage, "Reset colors", "Back to the theme's colours", "Reset", function()
			setTheme(currentTheme, true)
			notify("Colors", "Reset to " .. currentTheme.Name, 2, Theme.Accent2)
		end)
	end)

	setTheme = function(t, quiet)
		paint("Text", Color3.fromRGB(244, 247, 252))
		applyTheme(t, quiet)
		refreshColorUI()
	end
	Section(configPage, "Menu")
	Button(configPage, "Replay intro", "Watch the VIREX intro again", "Play", function() replayIntro() end)
	Info(configPage, "Toggle key", CONFIG.ToggleKey.Name)
	refreshThemeCards()
	refreshFontCards()
	refreshColorUI()
	showMode(bgMode, false)
end

-- every label in the pages gets a soft dark outline, so it stays sharp over any background
for _, d in ipairs(content:GetDescendants()) do
	if d:IsA("TextLabel") and not d:FindFirstChildOfClass("UIStroke") then
		new("UIStroke", { Parent = d, Color = BLACK, Thickness = 1, Transparency = 0.45, LineJoinMode = Enum.LineJoinMode.Round })
	end
	if d:IsA("TextLabel") and d.TextColor3 == Theme.Text then themeProp(d, "TextColor3", "Text") end
end

---------------------------------------------------------------------------
-- Dragging the window (mouse and touch), with a little sway
---------------------------------------------------------------------------
do
	local dragging, startPos, startInput = false, nil, nil
	bind(topbar.InputBegan, function(input)
		local p, a, sz = input.Position, deck.AbsolutePosition, deck.AbsoluteSize
		local onPill = p.X >= a.X and p.X <= a.X + sz.X and guiY(p.Y) >= a.Y and guiY(p.Y) <= a.Y + sz.Y
		if isPress(input) and not onPill and not carousel.dragging then
			dragging, startPos, startInput = true, root.Position, input.Position
			tween(rootScale, 0.3, { Scale = fitScale() * 0.97 }, BACK)
		end
	end)
	bind(UserInputService.InputEnded, function(input)
		if dragging and isPress(input) then
			dragging = false
			tween(rootScale, 0.6, { Scale = fitScale() }, ELASTIC, OUT)
			tween(root, 0.6, { Rotation = 0 }, ELASTIC, OUT)
		end
	end)
	bind(UserInputService.InputChanged, function(input)
		if dragging and isMove(input) then
			local d = input.Position - startInput
			tween(root, 0.18, { Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y), Rotation = math.clamp(input.Delta.X * 0.15, -3, 3) }, QUAD)
		end
	end)
end

---------------------------------------------------------------------------
-- Floating button (shown while the menu is closed)
---------------------------------------------------------------------------
local fab = new("TextButton", { Parent = gui, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.new(0, 52, 0.5, 0), Size = UDim2.fromOffset(68, 68), BackgroundColor3 = Theme.Panel, AutoButtonColor = false, Text = "", Visible = false, ZIndex = 60, ClipsDescendants = false }, { corner(20) })
themeProp(fab, "BackgroundColor3", "Panel")
liquidGlass(fab, 0.1)
local fabSwirl = new("Frame", { Parent = fab, Size = UDim2.fromScale(1, 1), BackgroundColor3 = WHITE, BackgroundTransparency = 0, ZIndex = 60 }, { corner(20) })
spinGradient(new("UIGradient", { Parent = fabSwirl, Color = seq({ Color3.fromRGB(40, 41, 48), Color3.fromRGB(12, 12, 15), Color3.fromRGB(58, 60, 68), Color3.fromRGB(12, 12, 15), Color3.fromRGB(40, 41, 48) }) }), 60)
local fabRing = stroke(WHITE, 2.6, 0)
fabRing.Parent = fab
spinGradient(themedBorder(new("UIGradient", { Parent = fabRing })), 170)
local fabLogo = new("ImageLabel", { Parent = fab, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(0.74, 0.74), BackgroundTransparency = 1, Image = CONFIG.LogoImage, ZIndex = 62 })
local fabShine = new("ImageLabel", { Parent = fabLogo, Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, Image = CONFIG.LogoImage, ImageColor3 = WHITE, ZIndex = 63 })
table.insert(logoShines, new("UIGradient", { Parent = fabShine, Rotation = 25, Offset = Vector2.new(-1, 0), Transparency = nseq({ { 0, 1 }, { 0.4, 1 }, { 0.5, 0.1 }, { 0.6, 1 }, { 1, 1 } }) }))
local fabScale = new("UIScale", { Parent = fab, Scale = 0 })
local fabPulse = new("Frame", { Parent = fab, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromScale(1, 1), BackgroundTransparency = 1, ZIndex = 59 }, { corner(22) })
local fabPulseStroke = stroke(Theme.Accent2, 2, 1)
fabPulseStroke.Parent = fabPulse
task.spawn(function()
	while gui.Parent do
		if fab.Visible then
			for _, sg in ipairs(logoShines) do if sg.Parent == fabShine then shineLogo(sg) end end
			tween(fabLogo, 1.8, { Rotation = 5 }, SINE, INOUT).Completed:Wait()
			tween(fabLogo, 1.8, { Rotation = -5 }, SINE, INOUT).Completed:Wait()
		else
			task.wait(0.3)
		end
	end
end)
do
	local dragging, moved, startPos, startInput = false, 0, nil, nil
	bind(fab.InputBegan, function(input)
		if isPress(input) then
			dragging, moved, startPos, startInput = true, 0, fab.Position, input.Position
			tween(fabScale, 0.2, { Scale = 0.9 }, Q)
		end
	end)
	bind(UserInputService.InputChanged, function(input)
		if dragging and isMove(input) then
			local d = input.Position - startInput
			moved = math.max(moved, d.Magnitude)
			fab.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + d.X, startPos.Y.Scale, startPos.Y.Offset + d.Y)
		end
	end)
	bind(UserInputService.InputEnded, function(input)
		if dragging and isPress(input) then
			dragging = false
			tween(fabScale, 0.5, { Scale = 1 }, BACK, OUT)
			if moved < 8 then toggleMenu() end
		end
	end)
	bind(fab.MouseEnter, function() if not dragging and fab.Visible then tween(fabScale, 0.5, { Scale = 1.08 }, Q) end end)
	bind(fab.MouseLeave, function() if not dragging and fab.Visible then tween(fabScale, 0.5, { Scale = 1 }, Q) end end)
end

---------------------------------------------------------------------------
-- Open / close
---------------------------------------------------------------------------
local isOpen, busy = false, false
local fabToken = 0
local function showFab(show)
	fabToken = fabToken + 1
	local my = fabToken
	if show then
		-- the button floats in gently: grows, turns a little and settles
		fab.Visible = true
		fabScale.Scale = 0.2
		fab.Rotation = -25
		fabLogo.ImageTransparency = 1
		tween(fabScale, 0.9, { Scale = 1 }, Q, OUT)
		tween(fab, 1, { Rotation = 0 }, Q, OUT)
		tween(fabLogo, 0.8, { ImageTransparency = 0 }, SINE, OUT, 0.2)
		for _, sg in ipairs(logoShines) do if sg.Parent == fabShine then task.delay(0.6, function() shineLogo(sg) end) end end
	else
		tween(fabScale, 0.45, { Scale = 0 }, Q, IN)
		tween(fab, 0.45, { Rotation = 25 }, Q, IN)
		task.delay(0.45, function() if my == fabToken then fab.Visible = false end end)
	end
end

local function open()
	if isOpen or busy then return end
	busy, isOpen = true, true
	rootScale.Scale = fitScale()
	root.Rotation = 0
	root.Visible = true
	showFab(false)
	sfx("Open", 1, 0.7)
	if blurOn then setBlur(16) end
	-- 1) the tab carousel slides in from the right, its tabs spinning into place
	deck.Position = deckBase + UDim2.fromOffset(460, 0)
	deck.GroupTransparency = 1
	carousel.pos = carousel.target + 2.6
	carousel.vel = 0
	tween(deck, 0.85, { Position = deckBase }, Q, OUT)
	tween(deck, 0.6, { GroupTransparency = 0 }, SINE, OUT)
	-- 2) then the window rises out of the glass
	window.GroupTransparency = 1
	winScale.Scale = 0.86
	borderScale.Scale = 0.86
	borderStroke.Transparency = 1
	tween(window, 0.75, { GroupTransparency = 0 }, SINE, OUT, 0.35)
	tween(winScale, 0.95, { Scale = 1 }, Q, OUT, 0.35)
	tween(borderScale, 0.95, { Scale = 1 }, Q, OUT, 0.35)
	tween(borderStroke, 0.9, { Transparency = 0 }, SINE, OUT, 0.45)
	task.delay(0.35, function() sfx("Toggle", 0.8, 0.35) end)
	-- a band of light sweeps across as it lands
	task.delay(0.6, function()
		sweep.Position = UDim2.fromScale(-0.4, 0.5)
		tween(sweep, 1.2, { Position = UDim2.fromScale(1.4, 0.5) }, Enum.EasingStyle.Quart, INOUT)
	end)
	task.delay(0.45, function() flip(topLogo, 40, 1, 0.3) end)
	glowFlash = 1
	for i, obj in ipairs({ title, minBtn, closeBtn }) do
		local sc = obj:FindFirstChild("Pop") or new("UIScale", { Parent = obj, Name = "Pop" })
		sc.Scale = 0.5
		tween(sc, 0.7, { Scale = 1 }, BACK, OUT, 0.5 + i * 0.07)
	end
	task.delay(0.9, function() for _, sg in ipairs(logoShines) do if sg.Parent then shineLogo(sg) end end end)
	if not currentTab then
		task.delay(0.35, function() selectTab(TAB_NAMES[1]) end)
	else
		carousel.target = tabIndex[currentTab]
		task.delay(0.35, function() cascadeIn(currentTab) end)
	end
	task.delay(1, function() busy = false end)
end

local function close()
	if not isOpen or busy then return end
	busy, isOpen = true, false
	sfx("Close", 1.2, 0.55)
	-- 1) the window sinks back into the glass
	tween(window, 0.5, { GroupTransparency = 1 }, SINE, IN)
	tween(winScale, 0.55, { Scale = 0.9 }, Q, IN)
	tween(borderScale, 0.55, { Scale = 0.9 }, Q, IN)
	tween(borderStroke, 0.4, { Transparency = 1 }, SINE, IN)
	-- 2) the tabs slide out to the right after it
	tween(deck, 0.6, { Position = deckBase + UDim2.fromOffset(460, 0) }, Q, IN, 0.2)
	tween(deck, 0.5, { GroupTransparency = 1 }, SINE, IN, 0.3)
	setBlur(0)
	task.delay(0.85, function()
		root.Visible = false
		busy = false
		showFab(true)
	end)
end

toggleMenu = function() if isOpen then close() else open() end end

local function destroyAll()
	close()
	task.wait(0.9)
	tween(fabScale, 0.4, { Scale = 0 }, Q, IN)
	for _, c in ipairs(connections) do c:Disconnect() end
	tween(blur, 0.3, { Size = 0 })
	task.wait(0.35)
	blur:Destroy()
	gui:Destroy()
end

replayIntro = function()
	close()
	task.wait(0.9)
	fab.Visible = false
	playIntro(open)
end

bind(minBtn.Activated, close)
bind(closeBtn.Activated, function()
	notify("VIREX", "Closed. Run the script again to reopen.", 2, Theme.Bad)
	task.spawn(destroyAll)
end)
bind(UserInputService.InputBegan, function(input, processed)
	if processed then return end
	if input.KeyCode == CONFIG.ToggleKey then toggleMenu() end
end)
bind(camera:GetPropertyChangedSignal("ViewportSize"), function()
	if isOpen then rootScale.Scale = fitScale() end
end)
bind(topbar.MouseEnter, function() flip(topLogo, 40, 1, 0.14) end)


---------------------------------------------------------------------------
-- VIREX SAE HUB: solo las funciones importantes se muestran.
-- El resto sigue funcionando por dentro con sus valores normales, sin UI (menos lag).
---------------------------------------------------------------------------
local Lib = { Name = "Virex" }
do
	local ROUTES = {
		["Auto Steal"] = { page = "Farm", title = "Steal", only = { ["Auto Steal"] = true, ["Instant Steal"] = true, ["Instant Steal Steps"] = true, ["Target Areas"] = true, ["Target Rarities"] = true } },
		["Character"] = { page = "Protect", title = "Protection", only = { ["Invisibility"] = true, ["Anti Ragdoll"] = true, ["Anti Trap"] = true } },
		["ESP"] = { page = "ESP", title = "ESP" },
		["Aimlock"] = { page = "Aimlock", title = "Aimlock" },
		["Settings"] = { page = "Aimlock", title = "Settings" },
		["Dr Scramble Lab & Mech"] = { page = "Events", title = "Dr Scramble Event" },
	}
	local hubPages = {}
	for _, n in ipairs(TAB_NAMES) do
		if n ~= "Config" then hubPages[n] = addPage(n) end
	end

	local function safeCall(fn, ...)
		if type(fn) ~= "function" then return end
		local ok, err = pcall(fn, ...)
		if not ok then warn("[Virex] callback error: " .. tostring(err)) end
	end
	local function outline(c)
		for _, d in ipairs(c:GetDescendants()) do
			if d:IsA("TextLabel") and not d:FindFirstChildOfClass("UIStroke") then
				new("UIStroke", { Parent = d, Color = BLACK, Thickness = 1, Transparency = 0.45, LineJoinMode = Enum.LineJoinMode.Round })
			end
		end
	end

	-- Handles
	local Handle = {}
	Handle.__index = Handle
	local function effectiveVisible(h)
		local p = h._parent
		if p then
			if p._kind == "toggle" and p._value ~= true then return false end
			if not effectiveVisible(p) then return false end
		end
		local sw = h._showWhen
		if type(sw) == "table" and sw._kind == "toggle" and sw._value ~= true then return false end
		if type(sw) == "function" then
			local ok, r = pcall(sw)
			if ok and not r then return false end
		end
		return true
	end
	local function refreshAll(win)
		for _, h in ipairs(win._items) do
			if h._row and h._row.Parent then h._row.Visible = (not h._removed) and effectiveVisible(h) end
		end
	end
	local function newHandle(sec, o, kind)
		local h = setmetatable({}, Handle)
		h._kind, h._win, h._opts, h._enabled = kind, sec._win, o, true
		h._parent = type(o.SubOf) == "table" and o.SubOf or nil
		h._showWhen = o.ShowWhen
		h._controller = { GetValue = function() return h._value end, SetValue = function(v) h:Set(v) end }
		table.insert(sec._win._items, h)
		return h
	end
	function Handle:Get() return self._value end
	function Handle:GetValue() return self._value end
	function Handle:SetValue(v) return self:Set(v) end
	function Handle:Set() end
	function Handle:Enable() self._enabled = true end
	function Handle:Disable() self._enabled = false end
	function Handle:Destroy()
		self._removed = true
		if self._row then self._row:Destroy() end
		for i, h in ipairs(self._win._items) do
			if h == self then table.remove(self._win._items, i) break end
		end
	end
	function Handle:JoinExclusiveGroup(g)
		if type(g) ~= "table" then return end
		self._group = g
		table.insert(g.Members, self)
	end
	function Handle:_fire(v) safeCall(self._opts.Callback, v) end
	local function queueInit(h, fn)
		local win = h._win
		local f = function() if not h._removed then fn() end end
		if win._ready then task.defer(f) else table.insert(win._initQueue, f) end
	end

	-- donde va cada control: devuelve la pagina (con la cuadricula ya puesta) o nil = sin UI
	local SectionT = {}
	SectionT.__index = SectionT
	local function place(sec, o)
		local r = sec._route
		if not r then return nil end
		if r.only and not r.only[tostring(o.Name)] then return nil end
		local pg = hubPages[r.page]
		if not sec._grid then
			local prev = pg.grid
			Section(pg, r.title)
			sec._grid = pg.grid
			pg.grid = prev
		end
		return pg
	end
	local function build(pg, sec, fn)
		local prev = pg.grid
		pg.grid = sec._grid
		local ok, a, b = pcall(fn)
		pg.grid = prev
		if not ok then warn("[Virex] " .. tostring(a)) return nil end
		return a, b
	end
	local function lastCard(pg)
		local list = cardsOf[pg.name]
		local e = list[#list]
		return e and e.obj
	end

	-- TOGGLE
	function SectionT:CreateToggle(o)
		o = o or {}
		local h = newHandle(self, o, "toggle")
		h._value = o.Default == true
		local native
		local function onChange(v)
			v = v == true
			h._value = v
			if v and h._group then
				local max, active = tonumber(h._group.MaxActive) or 1, 0
				for _, m in ipairs(h._group.Members) do if m ~= h and m._value == true then active = active + 1 end end
				for _, m in ipairs(h._group.Members) do
					if active < max then break end
					if m ~= h and m._value == true then m:Set(false) active = active - 1 end
				end
			end
			refreshAll(h._win)
			h:_fire(v)
		end
		local pg = place(self, o)
		if pg then
			native = build(pg, self, function() return Toggle(pg, tostring(o.Name or ""), o.Note, h._value, onChange) end)
			h._row = lastCard(pg)
			if h._row then outline(h._row) end
		end
		function h:Set(v)
			v = v == true
			if v == self._value then return end
			if native then native.set(v) else onChange(v) end
		end
		queueInit(h, function() h:_fire(h._value) end)
		refreshAll(h._win)
		return h
	end

	-- SLIDER
	function SectionT:CreateSlider(o)
		o = o or {}
		local h = newHandle(self, o, "slider")
		local minV, maxV = tonumber(o.Min) or 0, tonumber(o.Max) or 100
		local inc = tonumber(o.Increment) or 1
		local allowDec = o.AllowDecimals == true or inc < 1
		local unit = type(o.Unit) == "string" and o.Unit or ""
		local function snap(v)
			v = math.clamp(tonumber(v) or minV, minV, maxV)
			if inc > 0 then v = minV + math.floor((v - minV) / inc + 0.5) * inc end
			if not allowDec then v = math.floor(v + 0.5) end
			return math.clamp(math.floor(v * 1e6 + 0.5) / 1e6, minV, maxV)
		end
		local function fmt(v)
			if type(o.ValueFormat) == "function" then
				local ok, r = pcall(o.ValueFormat, v)
				if ok and r ~= nil then return tostring(r) end
			end
			local s = (allowDec and inc < 1) and string.gsub(string.gsub(string.format("%.2f", v), "0+$", ""), "%.$", "") or tostring(math.floor(v + 0.5))
			if unit ~= "" then s = string.match(unit, "^%a") and (s .. " " .. unit) or (s .. unit) end
			return s
		end
		h._value = snap(o.Default)
		local native
		local pg = place(self, o)
		if pg then
			native = build(pg, self, function()
				return Slider(pg, tostring(o.Name or ""), minV, maxV, h._value, "", function(v)
					v = snap(v)
					if v ~= h._value then h._value = v h:_fire(v) end
				end, snap, fmt)
			end)
			h._row = lastCard(pg)
			if h._row then outline(h._row) end
		end
		function h:Set(v, silent)
			v = snap(v)
			local changed = v ~= self._value
			self._value = v
			if native then native.show(v) end
			if changed and not silent then self:_fire(v) end
		end
		queueInit(h, function() h:_fire(h._value) end)
		refreshAll(h._win)
		return h
	end

	-- selector flotante (dropdown y multi)
	local picker
	local function openPicker(titleText, options, isOn, onPick, multi, onAll)
		if picker then picker.close() end
		local back = new("TextButton", { Parent = content, Size = UDim2.fromScale(1, 1), BackgroundColor3 = BLACK, BackgroundTransparency = 1, AutoButtonColor = false, Text = "", ZIndex = 40 })
		local rows = #options + (multi and 1 or 0)
		local hh = math.min(math.max(rows, 1) * 40 + 58, content.AbsoluteSize.Y / math.max(rootScale.Scale, 0.01) - 24)
		local panel = new("CanvasGroup", { Parent = back, AnchorPoint = Vector2.new(0.5, 0.5), Position = UDim2.fromScale(0.5, 0.5), Size = UDim2.fromOffset(310, hh), BackgroundColor3 = Theme.Panel, GroupTransparency = 1, ZIndex = 41 }, { corner(22) })
		liquidGlass(panel, 0.25)
		local psc = new("UIScale", { Parent = panel, Scale = 0.8 })
		fontProp(new("TextLabel", { Parent = panel, BackgroundTransparency = 1, Position = UDim2.fromOffset(18, 12), Size = UDim2.new(1, -36, 0, 22), Font = FONT_HEAD, TextSize = 14, TextColor3 = Theme.Accent2, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = string.upper(titleText), ZIndex = 42 }))
		local list = new("ScrollingFrame", { Parent = panel, Position = UDim2.fromOffset(12, 44), Size = UDim2.new(1, -24, 1, -54), BackgroundTransparency = 1, BorderSizePixel = 0, ScrollBarThickness = 3, ScrollBarImageColor3 = Theme.Accent2, CanvasSize = UDim2.new(), AutomaticCanvasSize = Enum.AutomaticSize.Y, ZIndex = 42 },
			{ new("UIListLayout", { Padding = UDim.new(0, 6), SortOrder = Enum.SortOrder.LayoutOrder }) })
		local closed = false
		local function close()
			if closed then return end
			closed = true
			if picker and picker.back == back then picker = nil end
			tween(psc, 0.25, { Scale = 0.85 }, BACK, IN)
			tween(panel, 0.25, { GroupTransparency = 1 })
			tween(back, 0.25, { BackgroundTransparency = 1 })
			task.delay(0.27, function() back:Destroy() end)
		end
		picker = { back = back, close = close }
		local btns = {}
		local function paintAll()
			for opt, b in pairs(btns) do
				local on = isOn(opt)
				tween(b, 0.2, { BackgroundColor3 = on and WHITE or Theme.Card2, TextColor3 = on and Theme.Dark or Theme.Text })
			end
		end
		if multi then
			local top = new("Frame", { Parent = list, LayoutOrder = 0, Size = UDim2.new(1, 0, 0, 34), BackgroundTransparency = 1, ZIndex = 43 })
			for k, label in ipairs({ "All", "None" }) do
				local b = new("TextButton", { Parent = top, Position = UDim2.new((k - 1) * 0.5, (k - 1) * 3, 0, 0), Size = UDim2.new(0.5, -3, 1, 0), BackgroundColor3 = Theme.Accent, AutoButtonColor = false, Font = Enum.Font.GothamBlack, TextSize = 12, TextColor3 = Theme.Dark, Text = label, ZIndex = 43 }, { corner(12) })
				local bs = new("UIScale", { Parent = b })
				bind(b.Activated, function()
					pressBounce(bs, 0.9)
					sfx("Toggle", k == 1 and 1.3 or 0.8, 0.5)
					onAll(k == 1)
					paintAll()
				end)
			end
		end
		for i, opt in ipairs(options) do
			local b = new("TextButton", { Parent = list, LayoutOrder = i, Size = UDim2.new(1, 0, 0, 34), BackgroundColor3 = Theme.Card2, AutoButtonColor = false, Font = Enum.Font.GothamBold, TextSize = 13, TextColor3 = Theme.Text, Text = tostring(opt), TextTruncate = Enum.TextTruncate.AtEnd, ZIndex = 43 }, { corner(12) })
			btns[opt] = b
			local bs = new("UIScale", { Parent = b })
			bind(b.Activated, function()
				pressBounce(bs, 0.9)
				onPick(opt)
				sfx("Toggle", isOn(opt) and 1.3 or 0.8, 0.5)
				paintAll()
				if not multi then task.delay(0.12, close) end
			end)
		end
		paintAll()
		bind(back.Activated, function() sfx("Click", 0.9, 0.5) close() end)
		sfx("Open", 1.8, 0.3)
		tween(back, 0.3, { BackgroundTransparency = 0.45 })
		tween(panel, 0.3, { GroupTransparency = 0 })
		tween(psc, 0.5, { Scale = 1 }, BACK)
	end
	local function selectorCard(pg, titleText, onTap)
		local c, sc = card(pg)
		cardText(c, titleText, nil, 150)
		local pill = new("TextLabel", { Parent = c, AnchorPoint = Vector2.new(1, 0.5), Position = UDim2.new(1, -14, 0.5, 0), Size = UDim2.fromOffset(124, 32), BackgroundColor3 = BLACK, Font = Enum.Font.GothamBold, TextSize = 12, TextColor3 = Theme.Accent2, TextTruncate = Enum.TextTruncate.AtEnd, Text = "", ZIndex = 14 }, { corner(), pad(0, 26, 0, 12) })
		themeProp(pill, "TextColor3", "Accent2")
		liquidGlass(pill, 0.55)
		new("TextLabel", { Parent = pill, BackgroundTransparency = 1, AnchorPoint = Vector2.new(0, 0.5), Position = UDim2.new(1, 4, 0.5, 0), Size = UDim2.fromOffset(16, 16), Font = Enum.Font.GothamBlack, TextSize = 10, TextColor3 = Theme.Text, Text = "▼", ZIndex = 15 })
		local psc = new("UIScale", { Parent = pill })
		bind(c.Activated, function()
			pressBounce(sc, 0.96)
			pressBounce(psc, 0.85)
			onTap()
		end)
		outline(c)
		return c, pill
	end

	function SectionT:CreateDropdown(o)
		o = o or {}
		local h = newHandle(self, o, "dropdown")
		h._options = {}
		for _, v in ipairs(o.Options or {}) do table.insert(h._options, v) end
		local function find(v)
			for _, x in ipairs(h._options) do if x == v or tostring(x) == tostring(v) then return x end end
			return nil
		end
		h._value = find(o.Default)
		if h._value == nil then h._value = h._options[1] end
		local pill
		local function paint() if pill then pill.Text = h._value ~= nil and tostring(h._value) or "None" end end
		local pg = place(self, o)
		if pg then
			h._row, pill = build(pg, self, function()
				return selectorCard(pg, tostring(o.Name or ""), function()
					openPicker(tostring(o.Name or ""), h._options, function(x) return x == h._value end, function(x) h:Set(x) end, false)
				end)
			end)
		end
		paint()
		function h:Set(v, silent)
			local f = find(v)
			if f == nil then return end
			local changed = f ~= self._value
			self._value = f
			paint()
			if changed and not silent then self:_fire(f) end
		end
		function h:SetOptions(opts, selected, fire)
			self._options = {}
			for _, v in ipairs(opts or {}) do table.insert(self._options, v) end
			local keep = find(selected)
			if keep == nil then keep = find(self._value) end
			if keep == nil then keep = self._options[1] end
			self._value = keep
			paint()
			if fire == true then self:_fire(self._value) end
		end
		queueInit(h, function() h:_fire(h._value) end)
		refreshAll(h._win)
		return h
	end

	function SectionT:CreateMultiDropdown(o)
		o = o or {}
		local h = newHandle(self, o, "multi")
		h._options, h._sel = {}, {}
		for _, v in ipairs(o.Options or {}) do table.insert(h._options, v) end
		local function applySelection(v)
			h._sel = {}
			if type(v) == "table" then
				for k, x in pairs(v) do
					local name = (type(k) == "string" and x == true) and k or ((type(x) == "string") and x or nil)
					if name ~= nil then h._sel[name] = true end
				end
			end
		end
		local function toArray()
			local out = {}
			for _, opt in ipairs(h._options) do if h._sel[tostring(opt)] then table.insert(out, opt) end end
			return out
		end
		local function payload()
			local t = {}
			for i, n in ipairs(toArray()) do t[i] = n t[tostring(n)] = true end
			return t
		end
		local pill
		local function paint()
			h._value = toArray()
			if not pill then return end
			local arr = h._value
			if #arr == 0 then pill.Text = "None"
			elseif #arr == #h._options then pill.Text = "All"
			elseif #arr <= 2 then
				local names = {}
				for _, n in ipairs(arr) do table.insert(names, tostring(n)) end
				pill.Text = table.concat(names, ", ")
			else pill.Text = #arr .. " selected" end
		end
		local pg = place(self, o)
		if pg then
			h._row, pill = build(pg, self, function()
				return selectorCard(pg, tostring(o.Name or ""), function()
					openPicker(tostring(o.Name or ""), h._options, function(x) return h._sel[tostring(x)] == true end, function(x)
						local n = tostring(x)
						h._sel[n] = (not h._sel[n]) or nil
						paint()
						h:_fire(payload())
					end, true, function(all)
						h._sel = {}
						if all then for _, x in ipairs(h._options) do h._sel[tostring(x)] = true end end
						paint()
						h:_fire(payload())
					end)
				end)
			end)
		end
		applySelection(o.Default)
		paint()
		function h:Get() return toArray() end
		function h:Set(v, silent)
			applySelection(v)
			paint()
			if not silent then self:_fire(payload()) end
		end
		function h:SetOptions(opts, selected, fire)
			self._options = {}
			for _, x in ipairs(opts or {}) do table.insert(self._options, x) end
			local valid = {}
			for _, x in ipairs(self._options) do valid[tostring(x)] = true end
			if selected ~= nil then applySelection(selected) end
			for k in pairs(self._sel) do if not valid[k] then self._sel[k] = nil end end
			paint()
			if fire == true then self:_fire(payload()) end
		end
		queueInit(h, function() h:_fire(payload()) end)
		refreshAll(h._win)
		return h
	end

	-- TEXTO / LABEL / BOTON / INPUT
	local function textItem(sec, o, kind)
		local h = newHandle(sec, o, kind)
		h._value = o.Text
		local body
		local pg = place(sec, o)
		if pg then
			h._row = build(pg, sec, function()
				local c = card(pg)
				fontProp(new("TextLabel", { Parent = c, BackgroundTransparency = 1, Position = UDim2.fromOffset(16, 12), Size = UDim2.new(1, -32, 0, 16), Font = FONT_HEAD, TextSize = 12, TextColor3 = Theme.Accent2, TextXAlignment = Enum.TextXAlignment.Left, TextTruncate = Enum.TextTruncate.AtEnd, Text = string.upper(tostring(o.Name or "")), ZIndex = 13 }))
				body = new("TextLabel", { Parent = c, BackgroundTransparency = 1, Position = UDim2.fromOffset(16, 30), Size = UDim2.new(1, -32, 1, -36), Font = Enum.Font.GothamMedium, TextSize = 12, TextColor3 = Theme.Text, TextXAlignment = Enum.TextXAlignment.Left, TextYAlignment = Enum.TextYAlignment.Top, TextWrapped = true, TextTruncate = Enum.TextTruncate.AtEnd, RichText = true, Text = tostring(o.Text or ""), ZIndex = 13 })
				outline(c)
				return c
			end)
		end
		function h:Set(v)
			if type(v) == "table" then v = v.Text end
			self._value = v
			if body then body.Text = tostring(v or "") end
		end
		refreshAll(h._win)
		return h
	end
	function SectionT:CreateText(o) return textItem(self, o or {}, "text") end
	function SectionT:CreateLabel(o) return textItem(self, o or {}, "label") end
	function SectionT:CreateButton(o)
		o = o or {}
		local h = newHandle(self, o, "button")
		local pg = place(self, o)
		if pg then
			build(pg, self, function() Button(pg, tostring(o.Name or ""), o.Note, tostring(o.ButtonText or "Run"), function() safeCall(o.Callback) end) end)
			h._row = lastCard(pg)
			if h._row then outline(h._row) end
		end
		refreshAll(h._win)
		return h
	end
	function SectionT:CreateInput(o)
		o = o or {}
		local h = newHandle(self, o, "input")
		h._value = tostring(o.Default or "")
		function h:Set(v, silent)
			self._value = tostring(v or "")
			if not silent then self:_fire(self._value) end
		end
		return h
	end

	-- PESTANAS / VENTANA
	local TabT = {}
	TabT.__index = TabT
	function TabT:CreateSection(o)
		o = o or {}
		return setmetatable({ _win = self._win, _route = ROUTES[tostring(o.Name)], _name = o.Name }, SectionT)
	end
	local WindowT = {}
	WindowT.__index = WindowT
	function WindowT:GetDefaultTab() return self._default end
	function WindowT:CreateTab(o)
		return setmetatable({ _win = self, Name = tostring((o or {}).Name or "Tab") }, TabT)
	end
	function WindowT:SelectTab() end
	function WindowT:CreateState(o)
		o = o or {}
		local s = { _value = o.Default }
		function s:Get() return self._value end
		function s:Set(v) self._value = v end
		function s:GetValue() return self._value end
		function s:SetValue(v) self._value = v end
		return s
	end
	function WindowT:CreateExclusiveGroup(o)
		o = o or {}
		return { Name = o.Name, MaxActive = tonumber(o.MaxActive) or 1, Members = {} }
	end
	function WindowT:SetOpen(v) if v then open() else close() end end
	function WindowT:Toggle() toggleMenu() end
	function WindowT:Destroy() task.spawn(destroyAll) end

	function Lib.Notify(title, text, duration)
		notify(tostring(title or "VIREX"), tostring(text or ""), tonumber(duration) or 4)
	end

	function Lib:CreateWindow(o)
		o = o or {}
		local win = setmetatable({ _items = {}, _initQueue = {}, _ready = false }, WindowT)
		local introDone, opened = false, false
		win._tryOpen = function()
			if opened or not introDone or not win._ready then return end
			opened = true
			open()
			task.delay(1.4, function()
				notify("Welcome, " .. player.DisplayName, isMobile and "Tap the VIREX button to open and close" or ("Press " .. CONFIG.ToggleKey.Name .. " to open and close"), 4)
			end)
		end
		playIntro(function()
			introDone = true
			win._tryOpen()
			task.delay(10, function() if not opened then opened = true open() end end)
		end)
		win._default = win:CreateTab({ Name = o.DefaultTab or "Main" })
		return win
	end

	function Lib:Finalize(o)
		local win = (o or {}).Window
		if type(win) ~= "table" then return end
		win._ready = true
		refreshAll(win)
		win._tryOpen()
		task.spawn(function()
			local queue = win._initQueue
			win._initQueue = {}
			for i, fn in ipairs(queue) do
				safeCall(fn)
				if i % 20 == 0 then task.wait() end
			end
			refreshAll(win)
		end)
	end
end

return Lib
end)()


-- Standalone TSB Aimlock using the original Virex interface.
local Virex = VirexLib
local VirexWindow = Virex:CreateWindow({ Name = "Virex Hub - TSB", DefaultTab = "Aimlock" })
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer

local aimTab = VirexWindow:CreateTab({ Name = "Aimlock" })
local aimSection = aimTab:CreateSection({ Name = "Aimlock", Expanded = true })
local settingsSection = aimTab:CreateSection({ Name = "Settings", Expanded = true })
local autoBlockSection = aimTab:CreateSection({ Name = "AutoBlock", Expanded = true })
local blockSettingsSection = aimTab:CreateSection({ Name = "Block Settings", Expanded = true })
local kingTechSection = aimTab:CreateSection({ Name = "K1NG TECH", Expanded = true })
local kingTechSettingsSection = aimTab:CreateSection({ Name = "K1NG TECH Settings", Expanded = true })
local enabled = false
local selectedPart = "Head"
local targetMode = "Nearest to Crosshair"
local fovRadius = 180
local smoothness = 22
local status = aimSection:CreateText({ Name = "Status", Text = "Disabled" })

-- TSB AutoBlock: watches nearby opponents' Action-priority animations,
-- then briefly holds the normal block key (F).
local autoBlockEnabled = false
local blockRange = 16
local blockHoldTime = 0.28
local blockCooldown = 0.42
local lastBlockAt = 0
local blockStatus = autoBlockSection:CreateText({ Name = "Status", Text = "Disabled" })
local blockKeyDown = false

local function sendBlockKey(isDown)
    local ok = pcall(function()
        local vim = game:GetService("VirtualInputManager")
        vim:SendKeyEvent(isDown, Enum.KeyCode.F, false, game)
    end)
    if ok then blockKeyDown = isDown else blockStatus:Set("Input unavailable (F key required)") end
    return ok
end

local function releaseBlock()
    if blockKeyDown then sendBlockKey(false) end
end

local function isThreateningAnimation(opponent, track)
    if not autoBlockEnabled or not opponent or opponent == LocalPlayer then return false end
    if not track or not track.IsPlaying or track.Priority.Value < Enum.AnimationPriority.Action.Value then return false end
    local myCharacter = LocalPlayer.Character
    local myRoot = myCharacter and myCharacter:FindFirstChild("HumanoidRootPart")
    local enemyCharacter = opponent.Character
    local enemyHumanoid = enemyCharacter and enemyCharacter:FindFirstChildOfClass("Humanoid")
    local enemyRoot = enemyCharacter and enemyCharacter:FindFirstChild("HumanoidRootPart")
    if not myRoot or not enemyHumanoid or enemyHumanoid.Health <= 0 or not enemyRoot then return false end
    local offset = myRoot.Position - enemyRoot.Position
    local distance = offset.Magnitude
    if distance > blockRange or distance < 0.1 then return false end
    return enemyRoot.CFrame.LookVector:Dot(offset.Unit) > 0.15
end

local function tryAutoBlock(opponent, track)
    if not isThreateningAnimation(opponent, track) then return end
    local now = os.clock()
    if now - lastBlockAt < blockCooldown then return end
    lastBlockAt = now
    if sendBlockKey(true) then
        blockStatus:Set("Blocking: " .. tostring(opponent.DisplayName or opponent.Name))
        task.delay(blockHoldTime, function()
            releaseBlock()
            blockStatus:Set(autoBlockEnabled and "Watching for attacks" or "Disabled")
        end)
    end
end

local watchedCharacters = {}
local function watchPlayer(opponent)
    if opponent == LocalPlayer then return end
    local function attachCharacter(character)
        if watchedCharacters[character] then return end
        watchedCharacters[character] = true
        local humanoid = character:WaitForChild("Humanoid", 5)
        if not humanoid then return end
        humanoid.AnimationPlayed:Connect(function(track) tryAutoBlock(opponent, track) end)
    end
    if opponent.Character then task.spawn(attachCharacter, opponent.Character) end
    opponent.CharacterAdded:Connect(attachCharacter)
end
for _, opponent in ipairs(Players:GetPlayers()) do watchPlayer(opponent) end
Players.PlayerAdded:Connect(watchPlayer)

local function getPart(character)
    if not character then return nil end
    return character:FindFirstChild(selectedPart)
        or character:FindFirstChild("HumanoidRootPart")
        or character:FindFirstChild("Head")
end

local function findTarget(camera)
    local viewport = camera.ViewportSize
    local center = Vector2.new(viewport.X / 2, viewport.Y / 2)
    local bestPlayer, bestPart, bestScore = nil, nil, math.huge
    local myCharacter = LocalPlayer.Character
    local myRoot = myCharacter and myCharacter:FindFirstChild("HumanoidRootPart")

    for _, candidate in ipairs(Players:GetPlayers()) do
        if candidate ~= LocalPlayer then
            local character = candidate.Character
            local humanoid = character and character:FindFirstChildOfClass("Humanoid")
            local part = getPart(character)
            if humanoid and humanoid.Health > 0 and part then
                local point, visible = camera:WorldToViewportPoint(part.Position)
                if visible and point.Z > 0 then
                    local distanceFromCenter = (Vector2.new(point.X, point.Y) - center).Magnitude
                    if distanceFromCenter <= fovRadius then
                        local score = distanceFromCenter
                        if targetMode == "Closest Distance" and myRoot then
                            score = (part.Position - myRoot.Position).Magnitude
                        end
                        if score < bestScore then
                            bestScore, bestPlayer, bestPart = score, candidate, part
                        end
                    end
                end
            end
        end
    end
    return bestPlayer, bestPart
end

local aimToggle = aimSection:CreateToggle({
    Name = "Enable Aimlock",
    Default = false,
    Callback = function(value)
        enabled = value == true
        status:Set(enabled and "Searching..." or "Disabled")
    end,
})

autoBlockSection:CreateToggle({
    Name = "Enable AutoBlock",
    Default = false,
    Callback = function(value)
        autoBlockEnabled = value == true
        if autoBlockEnabled then blockStatus:Set("Watching for attacks")
        else releaseBlock(); blockStatus:Set("Disabled") end
    end,
})

blockSettingsSection:CreateSlider({
    Name = "Detection Range",
    Min = 8, Max = 30, Default = 16, Increment = 1, Unit = " studs",
    Callback = function(value) blockRange = math.clamp(tonumber(value) or 16, 8, 30) end,
})

blockSettingsSection:CreateSlider({
    Name = "Block Hold",
    Min = 10, Max = 60, Default = 28, Increment = 2, Unit = "%",
    Callback = function(value) blockHoldTime = math.clamp(tonumber(value) or 28, 10, 60) / 100 end,
})

settingsSection:CreateDropdown({
    Name = "Aim Part",
    Options = { "Head", "HumanoidRootPart", "UpperTorso" },
    Default = "Head",
    Callback = function(value) selectedPart = tostring(value) end,
})

settingsSection:CreateDropdown({
    Name = "Target Mode",
    Options = { "Nearest to Crosshair", "Closest Distance" },
    Default = "Nearest to Crosshair",
    Callback = function(value) targetMode = tostring(value) end,
})

settingsSection:CreateSlider({
    Name = "FOV Radius",
    Min = 40, Max = 500, Default = 180, Increment = 10,
    Callback = function(value) fovRadius = math.clamp(tonumber(value) or 180, 40, 500) end,
})

settingsSection:CreateSlider({
    Name = "Smoothness",
    Min = 1, Max = 100, Default = 22, Increment = 1, Unit = "%",
    Callback = function(value) smoothness = math.clamp(tonumber(value) or 22, 1, 100) end,
})

local connection = RunService.RenderStepped:Connect(function()
    if not enabled then return end
    local camera = workspace.CurrentCamera
    if not camera then return end
    local target, part = findTarget(camera)
    if not target or not part then
        status:Set("No target in FOV")
        return
    end
    local goal = CFrame.lookAt(camera.CFrame.Position, part.Position)
    camera.CFrame = camera.CFrame:Lerp(goal, math.clamp(smoothness / 100, 0.01, 1))
    status:Set("Locked: " .. tostring(target.DisplayName or target.Name))
end)


-- K1NG TECH (adapted from the supplied reference script)
-- Watches the local character's trigger animation, applies the jump impulse,
-- sends the game's W+Q dash request, then briefly flicks toward a predicted target.
local Stats = game:GetService("Stats")
local DETECT_ID = "rbxassetid://10503381238"
local DASH_ANIM_ID = "rbxassetid://10479335397"
local kingTechEnabled = false
local kingTechLoopActive = false
local kingTechGeneration = 0
local DASH_CANCEL_DELAY = 0.45
local LOCK_DURATION = 0.63
local LOOP_DELAY = 0.31
local FLICK_DELAY = 0.23
local JUMP_VELOCITY = 50
local FLICK_INTENSITY = 1
local FLICK_SMOOTHING = 1
local kingTechStatus = kingTechSection:CreateText({ Name = "Status", Text = "Disabled" })
local kingTechFlickConnection = nil
local kingTechAnimatorConnection = nil
local kingTechCharacter = nil
local kingTechRoot = nil
local kingTechHumanoid = nil

local function updateKingTechStatus(value)
    kingTechStatus:Set(value)
end

local function getKingTechTarget()
    local liveFolder = workspace:FindFirstChild("Live")
    if not liveFolder or not kingTechRoot or not kingTechRoot.Parent then return nil end
    local closestTarget
    local maxDistance = 150
    for _, obj in ipairs(liveFolder:GetChildren()) do
        if obj:IsA("Model") and obj ~= kingTechCharacter then
            if obj.Name == "Weakest Dummy" or Players:GetPlayerFromCharacter(obj) then
                local targetRoot = obj:FindFirstChild("HumanoidRootPart")
                local targetHumanoid = obj:FindFirstChildOfClass("Humanoid")
                if targetRoot and targetHumanoid and targetHumanoid.Health > 0 then
                    local distance = (kingTechRoot.Position - targetRoot.Position).Magnitude
                    if distance < maxDistance then
                        maxDistance = distance
                        closestTarget = obj
                    end
                end
            end
        end
    end
    return closestTarget
end

local function stopKingTechFlick()
    if kingTechFlickConnection then
        kingTechFlickConnection:Disconnect()
        kingTechFlickConnection = nil
    end
    if kingTechHumanoid and kingTechHumanoid.Parent then
        kingTechHumanoid.AutoRotate = true
    end
end

local function startKingTechFlick()
    if not kingTechEnabled then return end
    local targetModel = getKingTechTarget()
    local targetRoot = targetModel and targetModel:FindFirstChild("HumanoidRootPart")
    if not targetRoot then
        updateKingTechStatus("No target within 150 studs")
        return
    end
    stopKingTechFlick()
    local startTime = os.clock()
    kingTechFlickConnection = RunService.Heartbeat:Connect(function()
        if not kingTechEnabled or not kingTechRoot or not kingTechRoot.Parent
            or not kingTechHumanoid or not kingTechHumanoid.Parent
            or not targetRoot or not targetRoot.Parent then
            stopKingTechFlick()
            return
        end
        local elapsed = os.clock() - startTime
        if elapsed > LOCK_DURATION then
            stopKingTechFlick()
            updateKingTechStatus("Ready")
            return
        end
        kingTechHumanoid.AutoRotate = false
        local ping = 0
        pcall(function()
            ping = Stats.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000
        end)
        local velocity = targetRoot.AssemblyLinearVelocity
        local pTime = (0.4 - elapsed) + ping
        local predictedX = targetRoot.Position.X + velocity.X * pTime
        local predictedZ = targetRoot.Position.Z + velocity.Z * pTime
        local finalPos = Vector3.new(predictedX, kingTechRoot.Position.Y, predictedZ)
        local goalCFrame = CFrame.lookAt(kingTechRoot.Position, finalPos)
        local lerpAmount = elapsed < 0.05 and FLICK_INTENSITY or FLICK_SMOOTHING
        kingTechRoot.CFrame = kingTechRoot.CFrame:Lerp(goalCFrame, math.clamp(lerpAmount, 0, 1))
    end)
    updateKingTechStatus("Tracking: " .. tostring(targetModel.Name))
end

local function fireKingTechDash()
    if not kingTechEnabled or not kingTechCharacter then return false end
    local remote = kingTechCharacter:FindFirstChild("Communicate")
    if not remote then
        updateKingTechStatus("Dash remote not found")
        return false
    end
    local ok = pcall(function()
        remote:FireServer({ Dash = Enum.KeyCode.W, Key = Enum.KeyCode.Q, Goal = "KeyPress" })
    end)
    if not ok then updateKingTechStatus("Dash request failed") end
    return ok
end

local function connectKingTechAnimator(currentAnimator)
    if kingTechAnimatorConnection then
        kingTechAnimatorConnection:Disconnect()
        kingTechAnimatorConnection = nil
    end
    if not currentAnimator then return end
    kingTechAnimatorConnection = currentAnimator.AnimationPlayed:Connect(function(animTrack)
        if not kingTechEnabled then return end
        local animation = animTrack and animTrack.Animation
        local animationId = animation and animation.AnimationId
        if animationId == DASH_ANIM_ID and kingTechLoopActive then
            local generation = kingTechGeneration
            task.delay(DASH_CANCEL_DELAY, function()
                if not kingTechEnabled or generation ~= kingTechGeneration
                    or not kingTechRoot or not kingTechRoot.Parent then return end
                local velocity = kingTechRoot.AssemblyLinearVelocity
                kingTechRoot.AssemblyLinearVelocity = Vector3.new(0, velocity.Y, 0)
                for _, obj in ipairs(kingTechRoot:GetChildren()) do
                    if obj:IsA("BodyVelocity") or obj:IsA("LinearVelocity") then obj:Destroy() end
                end
            end)
        end
        if animationId ~= DETECT_ID or kingTechLoopActive then return end
        kingTechLoopActive = true
        local generation = kingTechGeneration
        task.spawn(function()
            updateKingTechStatus("Trigger detected")
            task.wait(LOOP_DELAY)
            if not kingTechEnabled or generation ~= kingTechGeneration
                or not kingTechRoot or not kingTechRoot.Parent then
                kingTechLoopActive = false
                return
            end
            local currentVelocity = kingTechRoot.AssemblyLinearVelocity
            kingTechRoot.AssemblyLinearVelocity = Vector3.new(currentVelocity.X, JUMP_VELOCITY, currentVelocity.Z)
            fireKingTechDash()
            task.wait(FLICK_DELAY)
            if kingTechEnabled and generation == kingTechGeneration then startKingTechFlick() end
            task.wait(0.5)
            if generation == kingTechGeneration then kingTechLoopActive = false end
        end)
    end)
end

local function bindKingTechCharacter(character)
    kingTechCharacter = character
    kingTechRoot = character and character:WaitForChild("HumanoidRootPart", 8)
    kingTechHumanoid = character and character:WaitForChild("Humanoid", 8)
    local animator = kingTechHumanoid and kingTechHumanoid:WaitForChild("Animator", 8)
    kingTechLoopActive = false
    stopKingTechFlick()
    connectKingTechAnimator(animator)
    if kingTechEnabled then updateKingTechStatus("Watching local animations") end
end

kingTechSection:CreateToggle({
    Name = "Enable K1NG TECH",
    Default = false,
    Callback = function(value)
        kingTechEnabled = value == true
        kingTechGeneration += 1
        kingTechLoopActive = false
        if not kingTechEnabled then
            stopKingTechFlick()
            updateKingTechStatus("Disabled")
        else
            updateKingTechStatus("Watching local animations")
            local character = LocalPlayer.Character
            if character and character ~= kingTechCharacter then bindKingTechCharacter(character) end
        end
    end,
})

kingTechSettingsSection:CreateSlider({
    Name = "Trigger Delay", Min = 0, Max = 100, Default = 31, Increment = 1, Unit = " ms x10",
    Callback = function(value) LOOP_DELAY = math.clamp(tonumber(value) or 31, 0, 100) / 100 end,
})
kingTechSettingsSection:CreateSlider({
    Name = "Flick Delay", Min = 0, Max = 100, Default = 23, Increment = 1, Unit = " ms x10",
    Callback = function(value) FLICK_DELAY = math.clamp(tonumber(value) or 23, 0, 100) / 100 end,
})
kingTechSettingsSection:CreateSlider({
    Name = "Lock Duration", Min = 10, Max = 150, Default = 63, Increment = 1, Unit = " ms x10",
    Callback = function(value) LOCK_DURATION = math.clamp(tonumber(value) or 63, 10, 150) / 100 end,
})
kingTechSettingsSection:CreateSlider({
    Name = "Dash Cancel Delay", Min = 0, Max = 100, Default = 45, Increment = 1, Unit = " ms x10",
    Callback = function(value) DASH_CANCEL_DELAY = math.clamp(tonumber(value) or 45, 0, 100) / 100 end,
})
kingTechSettingsSection:CreateSlider({
    Name = "Jump Velocity", Min = 10, Max = 100, Default = 50, Increment = 1,
    Callback = function(value) JUMP_VELOCITY = math.clamp(tonumber(value) or 50, 10, 100) end,
})
kingTechSettingsSection:CreateSlider({
    Name = "Flick Intensity", Min = 1, Max = 100, Default = 100, Increment = 1, Unit = "%",
    Callback = function(value) FLICK_INTENSITY = math.clamp(tonumber(value) or 100, 1, 100) / 100 end,
})
kingTechSettingsSection:CreateSlider({
    Name = "Flick Smoothing", Min = 1, Max = 100, Default = 100, Increment = 1, Unit = "%",
    Callback = function(value) FLICK_SMOOTHING = math.clamp(tonumber(value) or 100, 1, 100) / 100 end,
})

if LocalPlayer.Character then task.spawn(bindKingTechCharacter, LocalPlayer.Character) end
LocalPlayer.CharacterAdded:Connect(bindKingTechCharacter)
LocalPlayer.CharacterRemoving:Connect(function()
    kingTechGeneration += 1
    kingTechLoopActive = false
    stopKingTechFlick()
    if kingTechAnimatorConnection then kingTechAnimatorConnection:Disconnect(); kingTechAnimatorConnection = nil end
end)

LocalPlayer.CharacterRemoving:Connect(function() releaseBlock() end)

Virex:Finalize({ Window = VirexWindow, ShowMainTab = true })
