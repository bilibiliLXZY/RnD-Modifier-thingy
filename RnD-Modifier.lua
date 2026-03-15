if LXZY_RnD_MODIFIER or (game.PlaceId ~= 12208518151) then
  -- error("Already loaded!")
	return
end

pcall(function() getgenv().LXZY_RnD_MODIFIER = true end)

local Players = game:GetService("Players");
local localPlayer = Players.LocalPlayer;
local playerGui = Players.LocalPlayer:WaitForChild("PlayerGui");
local ReplicatedStorage = game:GetService("ReplicatedStorage");

-- Area for Instances

-- Main Modifier GUI
local modifierGui = Instance.new("ScreenGui"); -- Container
modifierGui.Parent = playerGui;
modifierGui.Name = "ModifierGui";

local frameForButtonz = Instance.new("Frame"); -- Frame, The gray thing
frameForButtonz.Parent = modifierGui
frameForButtonz.AnchorPoint = Vector2.new(1, 0.5);
frameForButtonz.BackgroundColor3 = Color3.fromRGB(50, 50, 50);
frameForButtonz.Position = UDim2.new(1, 0, 0.5, 0);
frameForButtonz.Size = UDim2.new(0.1, 35, 0.3, 80);

local cornerThingy = Instance.new("UICorner"); -- Look smoother
cornerThingy.Parent = frameForButtonz
cornerThingy.CornerRadius = UDim.new(0.05, 1);

local textLabelDesc = Instance.new("TextLabel"); -- Modifier Text
textLabelDesc.Parent = frameForButtonz
textLabelDesc.BackgroundTransparency = 1
textLabelDesc.BorderSizePixel = 0
textLabelDesc.Size = UDim2.new(1, 0, 0.15, 0);
textLabelDesc.FontFace = Font.fromEnum(Enum.Font.Jura);
textLabelDesc.Text = "Modifiers"
textLabelDesc.TextColor3 = Color3.new(255, 255, 255);
textLabelDesc.TextScaled = true;

local textButtonExpand = Instance.new("TextButton"); -- Expand Button
textButtonExpand.Parent = modifierGui
textButtonExpand.Name = "ExpandButton"
textButtonExpand.AnchorPoint = Vector2.new(1, 0.5);
textButtonExpand.BackgroundColor3 = Color3.fromRGB(75, 75, 75);
textButtonExpand.Position = UDim2.new(1, 0, 0.225, 0);
textButtonExpand.Size = UDim2.new(0, 20, 0, 50);
textButtonExpand.Text = "<"
textButtonExpand.FontFace = Font.fromEnum(Enum.Font.Jura);
textButtonExpand.TextColor3 = Color3.new(255, 255, 255);
textButtonExpand.TextScaled = true;

local uiCornerExpand = Instance.new("UICorner"); -- Look smoother
uiCornerExpand.Parent = textButtonExpand
uiCornerExpand.CornerRadius = UDim.new(0, 8);

local scrollingFrameButtons = Instance.new("ScrollingFrame"); -- self explanatory
scrollingFrameButtons.Parent = frameForButtonz
scrollingFrameButtons.BackgroundColor3 = Color3.fromRGB(25, 25, 25);
scrollingFrameButtons.AnchorPoint = Vector2.new(0, 1);
scrollingFrameButtons.Position = UDim2.new(0, 0, 1, 0);
scrollingFrameButtons.Size = UDim2.new(1, 0, 0.8, 0);
scrollingFrameButtons.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0);
scrollingFrameButtons.ScrollingDirection = Enum.ScrollingDirection.Y;
scrollingFrameButtons.ScrollBarImageTransparency = 0.75;
scrollingFrameButtons.ScrollBarThickness = 0;

local uiCornerScrollingFrame = Instance.new("UICorner"); -- YOU KNOW IT ALREADY.
uiCornerScrollingFrame.Parent = scrollingFrameButtons
uiCornerScrollingFrame.CornerRadius = UDim.new(0.05, 1);

local function addTextButtonToScrollingFrame(name, color, text, position)
	local textButton = Instance.new("TextButton");
	textButton.Name = name
	textButton.Parent = scrollingFrameButtons
	textButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25); -- If active, it would be 100, 100, 100
	textButton.Position = position
	textButton.Size = UDim2.new(1, 0, 0.05, 10)
	textButton.FontFace = Font.fromEnum(Enum.Font.Jura);
	textButton.Text = text
	textButton.TextColor3 = color
	textButton.TextScaled = true;
	
	local uiCornerTextButton = Instance.new("UICorner");
	uiCornerTextButton.Parent = textButton
	uiCornerTextButton.CornerRadius = UDim.new(0.075, 1);
	
	local uiStrokeTextButton = Instance.new("UIStroke");
	uiStrokeTextButton.Parent = textButton
	uiStrokeTextButton.Color = color;
	uiStrokeTextButton.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	uiStrokeTextButton.BorderStrokePosition = Enum.BorderStrokePosition.Inner;
	uiStrokeTextButton.Thickness = 2;
	
	return textButton;
end

-- Area for Connections
textButtonExpand.MouseButton1Click:Connect(function()
	if (frameForButtonz.Visible == false) then
		frameForButtonz.Visible = true
		textButtonExpand.Text = "<"
	elseif (frameForButtonz.Visible == true) then
		frameForButtonz.Visible = false
		textButtonExpand.Text = ">"
	end
end)

local buttonRentsDue = addTextButtonToScrollingFrame("InstantDarkness", Color3.fromRGB(255, 133, 133), "Rent's Due+", UDim2.new(0, 0, 0, 0));
buttonRentsDue.MouseButton1Click:Connect(function()
	if buttonRentsDue.BackgroundColor3 == Color3.fromRGB(25, 25, 25) then
		buttonRentsDue.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
		local folderas = Instance.new("Folder")
		folderas.Name = "instantdarkness"
		folderas.Parent = workspace
	else
		buttonRentsDue.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		for _, v in pairs(workspace:GetChildren()) do
			if v.Name == "instantdarkness" then
				v:Destroy()
			end
		end
	end
end)
local buttonBackForMore = addTextButtonToScrollingFrame("MoreScribbleRebounds", Color3.fromRGB(225, 225, 225), "Back for More", UDim2.new(0, 0, 0.05, 15));
buttonBackForMore.MouseButton1Click:Connect(function()
	if buttonBackForMore.BackgroundColor3 == Color3.fromRGB(25, 25, 25) then
		local charrrrrrrrr = playerGui
		if charrrrrrrrr then
			nahnahnah = charrrrrrrrr.ChildAdded:Connect(function(ch) 
				if ch:IsA("LocalScript") and ch.Name == "localscribble" then ch.reb.Value = math.random(4, 12) end
			end)
		end
		buttonBackForMore.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
		
	else
		buttonBackForMore.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		if nahnahnah then nahnahnah:Disconnect(); nahnahnah = nil end
	end
end)
local buttonAgainAgainAgain = addTextButtonToScrollingFrame("InfScribbleRebounds", Color3.fromRGB(225, 225, 225), "Again & Again & Again", UDim2.new(0, 0, 0.1, 30));
buttonAgainAgainAgain.MouseButton1Click:Connect(function()
	if buttonAgainAgainAgain.BackgroundColor3 == Color3.fromRGB(25, 25, 25) then
		local charrrrrrrrr = playerGui
		if charrrrrrrrr then
			nahnahnahm = charrrrrrrrr.ChildAdded:Connect(function(ch) 
				if ch:IsA("LocalScript") and ch.Name == "localscribble" then ch.reb.Value = 2147483647 end
			end)
		end
		buttonAgainAgainAgain.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
	else
		buttonAgainAgainAgain.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		if nahnahnahm then nahnahnahm:Disconnect(); nahnahnahm = nil end
	end
end)
local buttonRentsPaid = addTextButtonToScrollingFrame("InfiniteDarkness", Color3.fromRGB(255, 175, 133), "Rent's Paid", UDim2.new(0, 0, 0.15, 45));
buttonRentsPaid.MouseButton1Click:Connect(function()
	if buttonRentsPaid.BackgroundColor3 == Color3.fromRGB(25, 25, 25) then
		buttonRentsPaid.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
		if ReplicatedStorage then
			local v116 = ReplicatedStorage:FindFirstChild("darknesslocker", true) or ReplicatedStorage:FindFirstChild("A-50", true)
			if v116 then
				v116.Name = "A-50"
			end
		end
	else
		buttonRentsPaid.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		if ReplicatedStorage then
			local v116 = ReplicatedStorage:FindFirstChild("darknesslocker", true) or ReplicatedStorage:FindFirstChild("A-50", true)
			if v116 then
				v116.Name = "darknesslocker"
			end
		end
	end
end)
local buttonPlaceBought = addTextButtonToScrollingFrame("EnterShell", Color3.fromRGB(200, 200, 200), "Place Bought", UDim2.new(0, 0, 0.2, 60));
buttonPlaceBought.MouseButton1Click:Connect(function()
	if buttonPlaceBought.BackgroundColor3 == Color3.fromRGB(25, 25, 25) then
		buttonPlaceBought.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
		meowymeowmeow = playerGui.ChildAdded:Connect(function(ch) 
			if ch.Name == "animplay" and ch.seq.Value == "jackjump" and ch.chara.Value == localPlayer.Character then ch.seq.Value = "hidelocker" end
		end)
	else
		if meowymeowmeow then meowymeowmeow:Disconnect(); meowymeowmeow = nil end
		buttonPlaceBought.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	end
end)
local buttonBackForMorea = addTextButtonToScrollingFrame("NoScribbleRebounds", Color3.fromRGB(225, 225, 225), "Slothful Scribble", UDim2.new(0, 0, 0.25, 75));
buttonBackForMorea.MouseButton1Click:Connect(function()
	if buttonBackForMorea.BackgroundColor3 == Color3.fromRGB(25, 25, 25) then
		local charrrrrrrrr = playerGui
		if charrrrrrrrr then
			nahnahnaha = charrrrrrrrr.ChildAdded:Connect(function(ch) 
				if ch:IsA("LocalScript") and ch.Name == "localscribble" then ch.reb.Value = 0 end
			end)
		end
		buttonBackForMorea.BackgroundColor3 = Color3.fromRGB(100, 100, 100)

	else
		buttonBackForMorea.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		if nahnahnaha then nahnahnaha:Disconnect(); nahnahnaha = nil end
	end
end)
local buttonSilentA60 = addTextButtonToScrollingFrame("SilentA60", Color3.fromRGB(255, 100, 100), "I'm Tip-Toein' Here", UDim2.new(0, 0, 0.3, 90));
buttonSilentA60.MouseButton1Click:Connect(function()
	if buttonSilentA60.BackgroundColor3 == Color3.fromRGB(25, 25, 25) then
		buttonSilentA60.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
		whatthemeow = workspace.ChildAdded:Connect(function(child)
			if child.Name == "Arrival" or child.Name == "Shake" then
				task.wait()
				child:Destroy()
			end
		end)
	else
		buttonSilentA60.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		
	end
end)
local prevlocker;
local shouldshell = false;
local buttonShellPrevLocker = addTextButtonToScrollingFrame("WahShell", Color3.fromRGB(200, 200, 200), "New Roommate", UDim2.new(0, 0, 0.35, 105));
buttonShellPrevLocker.MouseButton1Click:Connect(function()
	if buttonShellPrevLocker.BackgroundColor3 == Color3.fromRGB(25, 25, 25) then
		buttonShellPrevLocker.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
		meowymeowmeowma = workspace.rooms.DescendantAdded:Connect(function(ch) 
			if ch.Name == "Occupied" and ch.Value == localPlayer.Character then
				if prevlocker == ch.Parent then
					shouldshell = true
				else
					shouldshell = false
				end
			end
		end)
		aiouebgaefbiieioains = playerGui.ChildAdded:Connect(function(child))
			if child.Name == "animplay" and child.chara.Value == localPlayer.Character and child.seq.Value == "hidelocker" then
				if shouldshell then
					child.seq.Value = "jackjump"
				end
			end
		end)
	else
		if meowymeowmeowma then meowymeowmeowma:Disconnect(); meowymeowmeowma = nil end
		buttonShellPrevLocker.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	end
end)
