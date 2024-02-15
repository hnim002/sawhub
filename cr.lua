getgenv().Config = {
    Team="Marines",

}
for i,v in pairs(getconnections(game:GetService("Players")["LocalPlayer"].PlayerGui.MainGui.ClickFrame.Click.Activated)) do
	v.Function()
end 

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
local placeId = game.PlaceId
if placeId == 2753915549 then
	OldWorld = true
elseif placeId == 4442272183 then
	NewWorld = true
elseif placeId == 7449423635 then
	ThreeWorld = true
end

local Lib = {}
local Players = game:GetService("Players")
local _Workspace = game:GetService("Workspace")
local UIS = game:GetService("UserInputService")
local plr = game.Players.LocalPlayer
local Mouse = plr:GetMouse()

function DraggingEnabled(frame, parent)
	parent = parent or frame
	local gui = parent
	local dragging
	local dragInput
	local dragStart
	local startPos

	local function update(input)
		local delta = input.Position - dragStart
		gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
	end

	gui.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = gui.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	gui.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	game:GetService("UserInputService").InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)
end

function CretateWindow(name)
	local UI = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local Border = Instance.new("Frame")
	local Holder = Instance.new("ImageLabel")
	local Border_2 = Instance.new("Frame")
	local ScrollingFrame = Instance.new("ScrollingFrame")
	local UIListLayout = Instance.new("UIListLayout")
	local UIPadding = Instance.new("UIPadding")
	local WindowName = Instance.new("TextLabel")
	local Frame = Instance.new("Frame")
	local Pages = Instance.new("Frame")
	
	UI.Name = "UI"
	UI.Parent = game:GetService("CoreGui")
	UI.ResetOnSpawn = false
	
	Main.Name = "Main"
	Main.Parent = UI
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Main.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Main.BorderSizePixel = 0
	Main.Position = UDim2.new(0.5, 0, 0.5, 0)
	Main.Size = UDim2.new(0, 500, 0, 500)
	
	Border.Name = "Border"
	Border.Parent = Main
	Border.AnchorPoint = Vector2.new(0.5, 0.5)
	Border.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Border.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Border.Position = UDim2.new(0.5, 0, 0.5, 0)
	Border.Size = UDim2.new(1, 2, 1, 2)
	Border.ZIndex = 0
	
	Holder.Name = "Holder"
	Holder.Parent = Main
	Holder.AnchorPoint = Vector2.new(0.5, 0.5)
	Holder.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Holder.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Holder.BorderSizePixel = 0
	Holder.Position = UDim2.new(0.5, 0, 0.5, 0)
	Holder.Size = UDim2.new(1, -10, 1, -10)
	Holder.ZIndex = 2
	Holder.ScaleType = Enum.ScaleType.Tile
	Holder.TileSize = UDim2.new(0, 500, 0, 500)
	
	Border_2.Name = "Border"
	Border_2.Parent = Holder
	Border_2.AnchorPoint = Vector2.new(0.5, 0.5)
	Border_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Border_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Border_2.Position = UDim2.new(0.5, 0, 0.5, 0)
	Border_2.Size = UDim2.new(1, 2, 1, 2)
	
	ScrollingFrame.Parent = Holder
	ScrollingFrame.Active = true
	ScrollingFrame.AnchorPoint = Vector2.new(0.5, 0)
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
	ScrollingFrame.BorderSizePixel = 0
	ScrollingFrame.Position = UDim2.new(0.5, 0, 0, 0)
	ScrollingFrame.Size = UDim2.new(1, 0, 0, 30)
	ScrollingFrame.ZIndex = 2
	ScrollingFrame.CanvasSize = UDim2.new(2, 0, 0, 0)
	ScrollingFrame.ScrollBarThickness = 0
	
	UIListLayout.Parent = ScrollingFrame
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout.Padding = UDim.new(0, 4)
	
	UIPadding.Parent = ScrollingFrame
	UIPadding.PaddingLeft = UDim.new(0, 10)
	
	WindowName.Name = "WindowName"
	WindowName.Parent = ScrollingFrame
	WindowName.AnchorPoint = Vector2.new(0.5, 0.5)
	WindowName.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	WindowName.BackgroundTransparency = 1.000
	WindowName.BorderColor3 = Color3.fromRGB(25, 25, 25)
	WindowName.BorderSizePixel = 0
	WindowName.Position = UDim2.new(0.096874997, 0, 0.5, 0)
	WindowName.ZIndex = 2
	WindowName.Font = Enum.Font.SourceSansSemibold
	WindowName.Text = name
	WindowName.TextColor3 = Color3.fromRGB(255, 255, 255)
	WindowName.TextSize = 15.000
	WindowName.TextStrokeTransparency = 0.750
	WindowName.TextXAlignment = Enum.TextXAlignment.Left
	WindowName.Size = UDim2.new(0,WindowName.TextBounds.X+5,1,0)

	Frame.Parent = ScrollingFrame
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BorderSizePixel = 0
	Frame.Size = UDim2.new(0, 2, 1, -15)
	Frame.ZIndex = 2
	
	Pages.Name = "Pages"
	Pages.Parent = Holder
	Pages.AnchorPoint = Vector2.new(0.5, 0)
	Pages.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Pages.BorderSizePixel = 0
	Pages.Position = UDim2.new(0.5, 0, 0.0489795916, 7)
	Pages.Size = UDim2.new(1, -10, 0.936734676, 0)
	Pages.ZIndex = 2
	return Main,ScrollingFrame,Pages,UIListLayout,ScrollingFrame
end

function CreatePage(title,obj,obj2)
	local TabButton = Instance.new("TextButton")
	local Title = Instance.new("TextLabel")
	local Frame = Instance.new("Frame")
	local Page = Instance.new("ScrollingFrame")
	local LeftSide = Instance.new("Frame")
	local ListLayout = Instance.new("UIListLayout")
	local Padding = Instance.new("UIPadding")
	local RightSide = Instance.new("Frame")
	local Padding_2 = Instance.new("UIPadding")
	local ListLayout_2 = Instance.new("UIListLayout")
	
	TabButton.Name = "TabButton"
	TabButton.Parent = obj
	TabButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TabButton.BackgroundTransparency = 1.000
	TabButton.BorderSizePixel = 0
	TabButton.ZIndex = 2
	TabButton.Font = Enum.Font.SourceSans
	TabButton.Text = ""
	TabButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	TabButton.TextSize = 14.000
	
	Title.Name = "Title"
	Title.Parent = TabButton
	Title.AnchorPoint = Vector2.new(0.5, 0.5)
	Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.5, 0, 0.5, 0)
	Title.Size = UDim2.new(1, 0, 1, 0)
	Title.ZIndex = 3
	Title.Font = Enum.Font.SourceSans
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(255, 255, 255)
	Title.TextSize = 15.000
	Title.TextStrokeTransparency = 0.750
	TabButton.Size = UDim2.new(0, Title.TextBounds.X+5, 1, 0)

	Frame.Parent = TabButton
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.5, 0, 1, 0)
	Frame.Size = UDim2.new(1, 0, 0, 2)
	Frame.Visible = false
	Frame.ZIndex = 2
	
	Page.Name = "Page"
	Page.Parent = obj2
	Page.Active = true
	Page.AnchorPoint = Vector2.new(0.5, 0.5)
	Page.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Page.BackgroundTransparency = 1.000
	Page.BorderSizePixel = 0
	Page.Position = UDim2.new(0.5, 0, 0.5, 0)
	Page.Size = UDim2.new(1, 10, 1, 0)
	Page.ZIndex = 2
	Page.ScrollBarThickness = 4
	Page.Visible = false
	
	LeftSide.Name = "LeftSide"
	LeftSide.Parent = Page
	LeftSide.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	LeftSide.BackgroundTransparency = 1.000
	LeftSide.BorderColor3 = Color3.fromRGB(25, 25, 25)
	LeftSide.BorderSizePixel = 0
	LeftSide.Position = UDim2.new(0, 5, 0, 0)
	LeftSide.Size = UDim2.new(0, 235, 1, 0)
	LeftSide.ZIndex = 2
	
	ListLayout.Name = "ListLayout"
	ListLayout.Parent = LeftSide
	ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ListLayout.Padding = UDim.new(0, 10)
	
	Padding.Name = "Padding"
	Padding.Parent = LeftSide
	Padding.PaddingTop = UDim.new(0, 10)
	
	RightSide.Name = "RightSide"
	RightSide.Parent = Page
	RightSide.AnchorPoint = Vector2.new(1, 0)
	RightSide.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	RightSide.BackgroundTransparency = 1.000
	RightSide.BorderColor3 = Color3.fromRGB(25, 25, 25)
	RightSide.BorderSizePixel = 0
	RightSide.Position = UDim2.new(1, -5, 0, 0)
	RightSide.Size = UDim2.new(0, 235, 1, 0)
	RightSide.ZIndex = 2
	
	Padding_2.Name = "Padding"
	Padding_2.Parent = RightSide
	Padding_2.PaddingTop = UDim.new(0, 10)
	
	ListLayout_2.Name = "ListLayout"
	ListLayout_2.Parent = RightSide
	ListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	ListLayout_2.Padding = UDim.new(0, 10)
	return Page,TabButton
end

function CreateSection(titlesection,obj)
	local Section = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local Container = Instance.new("Frame")
	local ListLayout = Instance.new("UIListLayout")
	local Border = Instance.new("Frame")

	Section.Name = "Section"
	Section.Parent = obj
	Section.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Section.BorderColor3 = Color3.fromRGB(50, 50, 50)
	Section.BorderSizePixel = 0
	Section.Size = UDim2.new(1, 0, 0, 235)
	Section.ZIndex = 3

	Title.Name = "Title"
	Title.Parent = Section
	Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Title.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0, 5, 0, -2)
	Title.Size = UDim2.new(0, 45, 0, 2)
	Title.ZIndex = 3
	Title.Font = Enum.Font.SourceSans
	Title.Text = titlesection
	Title.Size = UDim2.new(0,Title.TextBounds.X + 10,0,2)
	Title.TextColor3 = Color3.fromRGB(200, 200, 200)
	Title.TextSize = 15.000
	Title.TextStrokeTransparency = 0.750

	Container.Name = "Container"
	Container.Parent = Section
	Container.AnchorPoint = Vector2.new(0.5, 0)
	Container.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Container.BackgroundTransparency = 1.000
	Container.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Container.Position = UDim2.new(0.5, 0, 0, 10)
	Container.Size = UDim2.new(1, 0, 1, -10)
	Container.ZIndex = 3

	ListLayout.Name = "ListLayout"
	ListLayout.Parent = Container
	ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ListLayout.Padding = UDim.new(0, 5)

	Border.Name = "Border"
	Border.Parent = Section
	Border.AnchorPoint = Vector2.new(0.5, 0.5)
	Border.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Border.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Border.Position = UDim2.new(0.5, 0, 0.5, 0)
	Border.Size = UDim2.new(1, 2, 1, 2)
	Border.ZIndex = 2
	return Section
end

function CreateToggle(title,obj)
	local Toggle = Instance.new("TextButton")
	local Toggle_2 = Instance.new("Frame")
	local Border = Instance.new("Frame")
	local Title = Instance.new("TextLabel")
	local Keybind = Instance.new("TextButton")

	Toggle.Name = "Toggle"
	Toggle.Parent = obj
	Toggle.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Toggle.BackgroundTransparency = 1.000
	Toggle.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Toggle.BorderSizePixel = 0
	Toggle.Size = UDim2.new(1, -10, 0, 20)
	Toggle.ZIndex = 3
	Toggle.AutoButtonColor = false
	Toggle.Font = Enum.Font.SourceSans
	Toggle.Text = ""
	Toggle.TextColor3 = Color3.fromRGB(200, 200, 200)
	Toggle.TextSize = 15.000
	Toggle.TextStrokeTransparency = 0.750

	Toggle_2.Name = "Toggle"
	Toggle_2.Parent = Toggle
	Toggle_2.AnchorPoint = Vector2.new(0, 0.5)
	Toggle_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Toggle_2.BorderColor3 = Color3.fromRGB(50, 50, 50)
	Toggle_2.BorderSizePixel = 0
	Toggle_2.Position = UDim2.new(0, 0, 0.5, 0)
	Toggle_2.Size = UDim2.new(0, 10, 0, 10)
	Toggle_2.ZIndex = 4

	Border.Name = "Border"
	Border.Parent = Toggle_2
	Border.AnchorPoint = Vector2.new(0.5, 0.5)
	Border.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Border.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Border.Position = UDim2.new(0.5, 0, 0.5, 0)
	Border.Size = UDim2.new(1, 2, 1, 2)
	Border.ZIndex = 3

	Title.Name = "Title"
	Title.TextWrapped = true
	Title.Parent = Toggle
	Title.AnchorPoint = Vector2.new(0, 0.5)
	Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0, 15, 0.5, 0)
	Title.Size = UDim2.new(1, -66, 1, 0)
	Title.ZIndex = 3
	Title.Font = Enum.Font.SourceSans
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(200, 200, 200)
	Title.TextSize = 15.000
	Title.TextStrokeTransparency = 0.750
	Title.TextXAlignment = Enum.TextXAlignment.Left

	Keybind.Name = "Keybind"
	Keybind.Parent = Toggle
	Keybind.AnchorPoint = Vector2.new(1, 0.5)
	Keybind.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Keybind.BackgroundTransparency = 1.000
	Keybind.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Keybind.BorderSizePixel = 0
	Keybind.Position = UDim2.new(1, 0, 0.5, 0)
	Keybind.Size = UDim2.new(0, 51, 1, 0)
	Keybind.ZIndex = 3
	Keybind.Font = Enum.Font.SourceSans
	Keybind.Text = "[ NONE ]"
	Keybind.TextColor3 = Color3.fromRGB(100, 100, 100)
	Keybind.TextSize = 15.000
	Keybind.TextStrokeTransparency = 0.750
	Keybind.TextXAlignment = Enum.TextXAlignment.Right
	Keybind.Visible = false
	return Toggle
end

function CreateButton(title,obj)
	local Button = Instance.new("TextButton")
	local Title = Instance.new("TextLabel")
	local Border = Instance.new("Frame")

	Button.Name = "Button"
	Button.Parent = obj
	Button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Button.BorderSizePixel = 0
	Button.Size = UDim2.new(1, -10, 0, 20)
	Button.ZIndex = 4
	Button.AutoButtonColor = false
	Button.Font = Enum.Font.SourceSans
	Button.Text = ""
	Button.TextColor3 = Color3.fromRGB(200, 200, 200)
	Button.TextSize = 15.000
	Button.TextStrokeTransparency = 0.750

	Title.Name = "Title"
	Title.Parent = Button
	Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Title.BorderSizePixel = 0
	Title.Size = UDim2.new(1, 0, 1, 0)
	Title.ZIndex = 4
	Title.Font = Enum.Font.SourceSans
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(200, 200, 200)
	Title.TextSize = 15.000
	Title.TextStrokeTransparency = 0.750

	Border.Name = "Border"
	Border.Parent = Button
	Border.AnchorPoint = Vector2.new(0.5, 0.5)
	Border.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Border.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Border.Position = UDim2.new(0.5, 0, 0.5, 0)
	Border.Size = UDim2.new(1, 2, 1, 2)
	Border.ZIndex = 3
	return Button
end

function CreateDropDown(title,obj)
	local Dropdown = Instance.new("TextButton")
	local Title = Instance.new("TextLabel")
	local Container = Instance.new("Frame")
	local Value = Instance.new("TextLabel")
	local Holder = Instance.new("Frame")
	local Container_2 = Instance.new("Frame")
	local ListLayout = Instance.new("UIListLayout")
	local Border = Instance.new("Frame")
	local Gradient = Instance.new("UIGradient")
	local Border_2 = Instance.new("Frame")

	Dropdown.Name = "Dropdown"
	Dropdown.Parent = obj
	Dropdown.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Dropdown.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Dropdown.BorderSizePixel = 0
	Dropdown.Size = UDim2.new(1, -10, 0, 40)
	Dropdown.ZIndex = 3
	Dropdown.AutoButtonColor = false
	Dropdown.Font = Enum.Font.SourceSans
	Dropdown.Text = ""
	Dropdown.TextColor3 = Color3.fromRGB(200, 200, 200)
	Dropdown.TextSize = 15.000
	Dropdown.TextStrokeTransparency = 0.750

	Title.Name = "Title"
	Title.Parent = Dropdown
	Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Title.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Title.BorderSizePixel = 0
	Title.Size = UDim2.new(1, 0, 0, 20)
	Title.ZIndex = 3
	Title.Font = Enum.Font.SourceSans
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(200, 200, 200)
	Title.TextSize = 15.000
	Title.TextStrokeTransparency = 0.750
	Title.TextXAlignment = Enum.TextXAlignment.Left

	Container.Name = "Container"
	Container.Parent = Dropdown
	Container.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Container.BorderSizePixel = 0
	Container.Position = UDim2.new(0, 0, 0, 20)
	Container.Size = UDim2.new(1, 0, 0, 20)
	Container.ZIndex = 4

	Value.Name = "Value"
	Value.Parent = Container
	Value.AnchorPoint = Vector2.new(0.5, 0)
	Value.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Value.BackgroundTransparency = 1.000
	Value.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Value.BorderSizePixel = 0
	Value.Position = UDim2.new(0.5, 0, 0, 0)
	Value.Size = UDim2.new(1, -10, 0, 20)
	Value.ZIndex = 4
	Value.Font = Enum.Font.SourceSans
	Value.Text = "..."
	Value.TextColor3 = Color3.fromRGB(200, 200, 200)
	Value.TextSize = 15.000
	Value.TextStrokeTransparency = 0.750
	Value.TextXAlignment = Enum.TextXAlignment.Left

	Holder.Name = "Holder"
	Holder.Parent = Container
	Holder.AnchorPoint = Vector2.new(0.5, 0)
	Holder.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Holder.BorderSizePixel = 0
	Holder.Position = UDim2.new(0.5, 0, 0, 25)
	Holder.Size = UDim2.new(1, 0, 0, 0)
	Holder.Visible = false
	Holder.ZIndex = 4

	Container_2.Name = "Container"
	Container_2.Parent = Holder
	Container_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Container_2.BackgroundTransparency = 1.000
	Container_2.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Container_2.BorderSizePixel = 0
	Container_2.Size = UDim2.new(1, 0, 1, 0)
	Container_2.ZIndex = 4

	ListLayout.Name = "ListLayout"
	ListLayout.Parent = Container_2
	ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ListLayout.Padding = UDim.new(0, 4)

	Border.Name = "Border"
	Border.Parent = Holder
	Border.AnchorPoint = Vector2.new(0.5, 0.5)
	Border.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Border.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Border.Position = UDim2.new(0.5, 0, 0.5, 0)
	Border.Size = UDim2.new(1, 2, 1, 2)
	Border.ZIndex = 3

	Gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(180, 180, 180))}
	Gradient.Rotation = 90
	Gradient.Name = "Gradient"
	Gradient.Parent = Container

	Border_2.Name = "Border"
	Border_2.Parent = Container
	Border_2.AnchorPoint = Vector2.new(0.5, 0.5)
	Border_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Border_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Border_2.Position = UDim2.new(0.5, 0, 0.5, 0)
	Border_2.Size = UDim2.new(1, 2, 1, 2)
	Border_2.ZIndex = 3
	return Dropdown
end

function CreateTable(title,valuee,obj)
	local Table_ = Instance.new("TextButton")
	local Title = Instance.new("TextLabel")
	local Container = Instance.new("Frame")
	local Value = Instance.new("TextLabel")
	local Holder = Instance.new("Frame")
	local Container_2 = Instance.new("Frame")
	local ListLayout = Instance.new("UIListLayout")
	local Border = Instance.new("Frame")
	local Gradient = Instance.new("UIGradient")
	local Border_2 = Instance.new("Frame")

	Table_.Name = "Table_"
	Table_.Parent = obj
	Table_.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Table_.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Table_.BorderSizePixel = 0
	Table_.Size = UDim2.new(1, -10, 0, 40)
	Table_.ZIndex = 3
	Table_.AutoButtonColor = false
	Table_.Font = Enum.Font.SourceSans
	Table_.Text = ""
	Table_.TextColor3 = Color3.fromRGB(200, 200, 200)
	Table_.TextSize = 15.000
	Table_.TextStrokeTransparency = 0.750

	Title.Name = "Title"
	Title.Parent = Table_
	Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Title.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Title.BorderSizePixel = 0
	Title.Size = UDim2.new(1, 0, 0, 20)
	Title.ZIndex = 3
	Title.Font = Enum.Font.SourceSans
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(200, 200, 200)
	Title.TextSize = 15.000
	Title.TextStrokeTransparency = 0.750
	Title.TextXAlignment = Enum.TextXAlignment.Left

	Container.Name = "Container"
	Container.Parent = Table_
	Container.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Container.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Container.BorderSizePixel = 0
	Container.Position = UDim2.new(0, 0, 0, 20)
	Container.Size = UDim2.new(1, 0, 0, 20)
	Container.ZIndex = 4

	Value.Name = "Value"
	Value.Parent = Container
	Value.AnchorPoint = Vector2.new(0.5, 0)
	Value.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Value.BackgroundTransparency = 1.000
	Value.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Value.BorderSizePixel = 0
	Value.Position = UDim2.new(0.5, 0, 0, 0)
	Value.Size = UDim2.new(1, -10, 0, 20)
	Value.ZIndex = 4
	Value.Font = Enum.Font.SourceSans
	Value.Text = valuee
	Value.TextColor3 = Color3.fromRGB(200, 200, 200)
	Value.TextSize = 15.000
	Value.TextStrokeTransparency = 0.750
	Value.TextXAlignment = Enum.TextXAlignment.Left

	Holder.Name = "Holder"
	Holder.Parent = Container
	Holder.AnchorPoint = Vector2.new(0.5, 0)
	Holder.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Holder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Holder.BorderSizePixel = 0
	Holder.Position = UDim2.new(0.5, 0, 0, 25)
	Holder.Size = UDim2.new(1, 0, 0, 0)
	Holder.Visible = false
	Holder.ZIndex = 4

	Container_2.Name = "Container"
	Container_2.Parent = Holder
	Container_2.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Container_2.BackgroundTransparency = 1.000
	Container_2.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Container_2.BorderSizePixel = 0
	Container_2.Size = UDim2.new(1, 0, 1, 0)
	Container_2.ZIndex = 4

	ListLayout.Name = "ListLayout"
	ListLayout.Parent = Container_2
	ListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ListLayout.Padding = UDim.new(0, 4)

	Border.Name = "Border"
	Border.Parent = Holder
	Border.AnchorPoint = Vector2.new(0.5, 0.5)
	Border.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Border.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Border.Position = UDim2.new(0.5, 0, 0.5, 0)
	Border.Size = UDim2.new(1, 2, 1, 2)
	Border.ZIndex = 3

	Gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(180, 180, 180))}
	Gradient.Rotation = 90
	Gradient.Name = "Gradient"
	Gradient.Parent = Container

	Border_2.Name = "Border"
	Border_2.Parent = Container
	Border_2.AnchorPoint = Vector2.new(0.5, 0.5)
	Border_2.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Border_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Border_2.Position = UDim2.new(0.5, 0, 0.5, 0)
	Border_2.Size = UDim2.new(1, 2, 1, 2)
	Border_2.ZIndex = 3
	return Table_
end

function OptionName(title,obj)
	local Option = Instance.new("TextButton")
	local Title = Instance.new("TextLabel")
	local Border = Instance.new("Frame")

	Option.Name = "Option"
	Option.Parent = obj
	Option.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Option.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Option.BorderSizePixel = 0
	Option.Size = UDim2.new(1, -10, 0, 20)
	Option.ZIndex = 5
	Option.AutoButtonColor = false
	Option.Font = Enum.Font.SourceSans
	Option.Text = ""
	Option.TextColor3 = Color3.fromRGB(200, 200, 200)
	Option.TextSize = 15.000
	Option.TextStrokeTransparency = 0.750

	Title.Name = "Title"
	Title.Parent = Option
	Title.AnchorPoint = Vector2.new(0.5, 0)
	Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Title.BorderSizePixel = 0
	Title.Position = UDim2.new(0.5, 0, 0, 0)
	Title.Size = UDim2.new(1, -10, 0, 20)
	Title.ZIndex = 5
	Title.Font = Enum.Font.SourceSans
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(200, 200, 200)
	Title.TextSize = 15.000
	Title.TextStrokeTransparency = 0.750

	Border.Name = "Border"
	Border.Parent = Option
	Border.AnchorPoint = Vector2.new(0.5, 0.5)
	Border.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Border.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Border.Position = UDim2.new(0.5, 0, 0.5, 0)
	Border.Size = UDim2.new(1, 2, 1, 2)
	Border.ZIndex = 4
	return Option
end

function CreateSlider(title,obj)
	local Slider = Instance.new("TextButton")
	local Title = Instance.new("TextLabel")
	local Slider_2 = Instance.new("Frame")
	local Bar = Instance.new("Frame")
	local Border = Instance.new("Frame")
	local Value = Instance.new("TextBox")

	Slider.Name = "Slider"
	Slider.Parent = obj
	Slider.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Slider.BackgroundTransparency = 1.000
	Slider.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Slider.BorderSizePixel = 0
	Slider.Size = UDim2.new(1, -10, 0, 30)
	Slider.ZIndex = 4
	Slider.AutoButtonColor = false
	Slider.Font = Enum.Font.SourceSans
	Slider.Text = ""
	Slider.TextColor3 = Color3.fromRGB(200, 200, 200)
	Slider.TextSize = 15.000
	Slider.TextStrokeTransparency = 0.750

	Title.Name = "Title"
	Title.Parent = Slider
	Title.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Title.BackgroundTransparency = 1.000
	Title.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Title.BorderSizePixel = 0
	Title.Size = UDim2.new(1, 0, 0, 20)
	Title.ZIndex = 3
	Title.Font = Enum.Font.SourceSans
	Title.Text = title
	Title.TextColor3 = Color3.fromRGB(200, 200, 200)
	Title.TextSize = 15.000
	Title.TextStrokeTransparency = 0.750
	Title.TextXAlignment = Enum.TextXAlignment.Left

	Slider_2.Name = "Slider"
	Slider_2.Parent = Slider
	Slider_2.AnchorPoint = Vector2.new(0, 1)
	Slider_2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
	Slider_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Slider_2.BorderSizePixel = 0
	Slider_2.Position = UDim2.new(0, 0, 1, 0)
	Slider_2.Size = UDim2.new(1, 0, 0, 10)
	Slider_2.ZIndex = 4

	Bar.Name = "Bar"
	Bar.Parent = Slider_2
	Bar.AnchorPoint = Vector2.new(0, 0.5)
	Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Bar.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Bar.BorderSizePixel = 0
	Bar.Position = UDim2.new(0, 0, 0.5, 0)
	Bar.Size = UDim2.new(0.5, 0, 1, 0)
	Bar.ZIndex = 4

	Border.Name = "Border"
	Border.Parent = Slider_2
	Border.AnchorPoint = Vector2.new(0.5, 0.5)
	Border.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
	Border.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Border.Position = UDim2.new(0.5, 0, 0.5, 0)
	Border.Size = UDim2.new(1, 2, 1, 2)
	Border.ZIndex = 3

	Value.Name = "Value"
	Value.Parent = Slider
	Value.AnchorPoint = Vector2.new(0, 1)
	Value.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Value.BackgroundTransparency = 1.000
	Value.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Value.BorderSizePixel = 0
	Value.Position = UDim2.new(0, 0, 1, -10)
	Value.Size = UDim2.new(1, 0, 0, 20)
	Value.ZIndex = 3
	Value.Font = Enum.Font.SourceSans
	Value.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
	Value.Text = ""
	Value.TextColor3 = Color3.fromRGB(200, 200, 200)
	Value.TextSize = 15.000
	Value.TextWrapped = true
	Value.TextXAlignment = Enum.TextXAlignment.Right
	return Slider
end

function CreateLabel(title,obj)
	local Label = Instance.new("TextLabel")

	Label.Name = "Label"
	Label.Parent = obj
	Label.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
	Label.BackgroundTransparency = 1.000
	Label.BorderColor3 = Color3.fromRGB(25, 25, 25)
	Label.BorderSizePixel = 0
	Label.Size = UDim2.new(1, -10, 0, 15)
	Label.ZIndex = 3
	Label.Font = Enum.Font.SourceSans
	Label.Text = title
	Label.TextColor3 = Color3.fromRGB(200, 200, 200)
	Label.TextSize = 15.000
	Label.TextStrokeTransparency = 0.750

    return Label
end

function Lib:CreateWindow(title,keybind)
	local Main,PageList,Pages,ListPage = CretateWindow(title)
	keybind = kebind or Enum.KeyCode.RightControl
	DraggingEnabled(Main)
	PageList.CanvasSize = UDim2.new(0, 10 + ListPage.AbsoluteContentSize.X, 0, 0)
	ListPage:GetPropertyChangedSignal('AbsoluteContentSize'):Connect(function()
		PageList.CanvasSize = UDim2.new(0, 10 + ListPage.AbsoluteContentSize.X, 0, 0)
	end)
	game:GetService("UserInputService").InputBegan:Connect(function(k,c)
		if c then return end
		if k.KeyCode == keybind then
			Main.Parent.Enabled = not Main.Parent.Enabled
		end
	end)
	local PageFunc = {TopPage=false}
	function PageFunc:DestroyGui()
		Main.Parent:Destroy()
	end
	function PageFunc:SetKeyBind(v)
		keybind = v
	end
	function PageFunc:CreatePage(titlepage)
		local Page,TabButton = CreatePage(titlepage,PageList,Pages)
		local function GetSide(Longest)
			if Longest then
				print(Page.LeftSide.ListLayout.AbsoluteContentSize.Y,Page.RightSide.ListLayout.AbsoluteContentSize.Y)
				if Page.LeftSide.ListLayout.AbsoluteContentSize.Y > Page.RightSide.ListLayout.AbsoluteContentSize.Y then
					return Page.LeftSide
				else
					return Page.RightSide
				end
			else
				if Page.LeftSide.ListLayout.AbsoluteContentSize.Y > Page.RightSide.ListLayout.AbsoluteContentSize.Y then
					return Page.RightSide
				else
					return Page.LeftSide
				end
			end
		end

		local function CloseAll()
			for i,v in pairs(PageList:GetChildren()) do
				if v.Name == "TabButton"then
					v.Frame.Visible = false
				end
			end
			for i,v in pairs(Pages:GetChildren()) do
				if v.Name == "Page"then
					v.Visible = false
				end
			end
		end

		TabButton.MouseButton1Click:Connect(function()
			CloseAll()
			Page.Visible = true
			TabButton.Frame.Visible = true
		end)

		Page.LeftSide.ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			if GetSide(true).Name == Page.RightSide.Name then
				Page.CanvasSize = UDim2.new(0,0,0,Page.LeftSide.ListLayout.AbsoluteContentSize.Y + 15)
			else
				Page.CanvasSize = UDim2.new(0,0,0,Page.RightSide.ListLayout.AbsoluteContentSize.Y + 15)
			end
		end)
		Page.RightSide.ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
			if GetSide(true).Name == Page.LeftSide.Name then
				Page.CanvasSize = UDim2.new(0,0,0,Page.LeftSide.ListLayout.AbsoluteContentSize.Y + 15)
			else
				Page.CanvasSize = UDim2.new(0,0,0,Page.RightSide.ListLayout.AbsoluteContentSize.Y + 15)
			end
		end)
		if PageFunc.TopPage == false then
			PageFunc.TopPage = true
			CloseAll()
			Page.Visible = true
			TabButton.Frame.Visible = true
		end
		local SectionFunc = {}
		function SectionFunc:CreateSection(titlesection)
			local Section = CreateSection(titlesection,GetSide(false))
			Section.Container.ListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
				Section.Size = UDim2.new(1,0,0,Section.Container.ListLayout.AbsoluteContentSize.Y + 25)
			end)
			local Object = {}
			function Object:CreateToggle(titletoggle,state,CallBack)
				local Toggle = CreateToggle(titletoggle,Section.Container)
				local Toggled = state or false
				local function StateToggle()
					if not Toggled then
						Toggle.Toggle.BackgroundColor3 = Color3.fromRGB(255,255,255)
					else
						Toggle.Toggle.BackgroundColor3 = Color3.fromRGB(20,20,20)
					end
					Toggled = not Toggled
				end
				Toggle.MouseButton1Click:Connect(function()
					StateToggle()
					CallBack(Toggled)
				end)
				if Toggled then
					Toggle.Toggle.BackgroundColor3 = Color3.fromRGB(255,255,255)
					CallBack(Toggled)
				end
				local ToggleInit = {}
				function ToggleInit:CreateKeybind(Bind)
					local KeybindInit = {}
					Bind = Bind or "NONE"

					local WaitingForBind = false
					local Selected = Bind
					local Blacklist = {"W","A","S","D","Slash","Tab","Backspace","Escape","Space","Delete","Unknown","Backquote"}

					Toggle.Keybind.Visible = true
					Toggle.Keybind.Text = "[ " .. Bind .. " ]"

					Toggle.Keybind.MouseButton1Click:Connect(function()
						Toggle.Keybind.Text = "[ ... ]"
						WaitingForBind = true
					end)

					Toggle.Keybind:GetPropertyChangedSignal("TextBounds"):Connect(function()
						Toggle.Keybind.Size = UDim2.new(0,Toggle.Keybind.TextBounds.X,1,0)
						Toggle.Title.Size = UDim2.new(1,-Toggle.Keybind.Size.X.Offset - 15,1,0)
					end)

					game:GetService("UserInputService").InputBegan:Connect(function(Input)
						if WaitingForBind and Input.UserInputType == Enum.UserInputType.Keyboard then
							local Key = tostring(Input.KeyCode):gsub("Enum.KeyCode.", "")
							if not table.find(Blacklist, Key) then
								Toggle.Keybind.Text = "[ " .. Key .. " ]"
								Selected = Key
							else
								Toggle.Keybind.Text = "[ NONE ]"
								Selected = "NONE"
							end
							WaitingForBind = false
						elseif Input.UserInputType == Enum.UserInputType.Keyboard then
							local Key = tostring(Input.KeyCode):gsub("Enum.KeyCode.", "")
							if Key == Selected then
								StateToggle()
								CallBack(Toggled)
							end
						end
					end)

					function KeybindInit:SetBind(Key)
						Toggle.Keybind.Text = "[ " .. Key .. " ]"
						Selected = Key
					end

					function KeybindInit:GetBind()
						return Selected
					end

					return KeybindInit
				end
				return ToggleInit
			end
			function Object:CreateButton(titlebutton,CallBack)
				local Button = CreateButton(titlebutton,Section.Container)
				Button.MouseButton1Click:Connect(function()
					CallBack()
				end)
			end
			function Object:CreateDropDown(titledrop, OptionTable, Callback, InitialValue)
				local Dropdown = CreateDropDown(titledrop,Section.Container)
				local DropdownToggle = false

				Dropdown.MouseButton1Click:Connect(function()
					DropdownToggle = not DropdownToggle
					if DropdownToggle then
						Dropdown.Size = UDim2.new(1,-10,0,Dropdown.Container.Holder.Container.ListLayout.AbsoluteContentSize.Y + Dropdown.Title.TextBounds.Y + 30)
						Dropdown.Container.Holder.Visible = true
					else
						Dropdown.Size = UDim2.new(1,-10,0,Dropdown.Title.TextBounds.Y + 25)
						Dropdown.Container.Holder.Visible = false
					end
				end)
				for _,OptionNamev in pairs(OptionTable) do
					local Option = OptionName(OptionNamev,Dropdown.Container.Holder.Container)
					Option.Size = UDim2.new(1,0,0,Option.Title.TextBounds.Y + 5)
					Dropdown.Container.Holder.Size = UDim2.new(1,-5,0,Dropdown.Container.Holder.Container.ListLayout.AbsoluteContentSize.Y)
					Option.MouseButton1Click:Connect(function()
						Dropdown.Container.Value.Text = OptionNamev
						Callback(OptionNamev)
					end)
				end
				
				local DropdownInit = {}

				function DropdownInit:GetOption()
					return Dropdown.Container.Value.Text
				end
				function DropdownInit:SetOption(Name)
					Dropdown.Container.Value.Text = Name
					Callback(Name)
				end
				function DropdownInit:RemoveOption(Name)
					for _,Option in pairs(Dropdown.Container.Holder.Container:GetChildren()) do
						if Option:IsA("TextButton") and string.find(Option.Name, Name) then
							Option:Destroy()
						end
					end
					Dropdown.Container.Holder.Size = UDim2.new(1,-5,0,Dropdown.Container.Holder.Container.ListLayout.AbsoluteContentSize.Y)
							Dropdown.Size = UDim2.new(1,-10,0,Dropdown.Container.Holder.Container.ListLayout.AbsoluteContentSize.Y + Dropdown.Title.TextBounds.Y + 30)
				end
				function DropdownInit:ClearOptions()
					for _, Option in pairs(Dropdown.Container.Holder.Container:GetChildren()) do
						if Option:IsA("TextButton") then
							Option:Destroy()
						end
					end
					Dropdown.Container.Holder.Size = UDim2.new(1,-5,0,Dropdown.Container.Holder.Container.ListLayout.AbsoluteContentSize.Y)
					Dropdown.Size = UDim2.new(1,-10,0,Dropdown.Container.Holder.Container.ListLayout.AbsoluteContentSize.Y + Dropdown.Title.TextBounds.Y + 30)
				end
				function DropdownInit:NewList(v)
					for _,Option in pairs(Dropdown.Container.Holder.Container:GetChildren()) do
						if Option:IsA("TextButton") then
							Option:Destroy()
						end
					end
					for _,OptionNamev in pairs(v) do
						local Option = OptionName(OptionNamev,Dropdown.Container.Holder.Container)
						Option.Size = UDim2.new(1,0,0,Option.Title.TextBounds.Y + 5)
						Dropdown.Container.Holder.Size = UDim2.new(1,-5,0,Dropdown.Container.Holder.Container.ListLayout.AbsoluteContentSize.Y + 20)
						Option.MouseButton1Click:Connect(function()
							Dropdown.Container.Value.Text = OptionNamev
							Callback(OptionNamev)
						end)
					end
				end
				if InitialValue then
					DropdownInit:SetOption(InitialValue)
				end
				return DropdownInit
			end
			function Object:CreateSlider(titleslider, Min, Max, Precise, Callback)
				local Slider = CreateSlider(titleslider,Section.Container)


				local GlobalSliderValue = 0
				local Dragging = false
				local function Sliding(Input)
                    local Position = UDim2.new(math.clamp((Input.Position.X - Slider.Slider.AbsolutePosition.X) / Slider.Slider.AbsoluteSize.X,0,1),0,1,0)
                    Slider.Slider.Bar.Size = Position
					local SliderPrecise = ((Position.X.Scale * Max) / Max) * (Max - Min) + Min
					local SliderNonPrecise = math.floor(((Position.X.Scale * Max) / Max) * (Max - Min) + Min)
                    local SliderValue = Precise and SliderNonPrecise or SliderPrecise
					SliderValue = tonumber(string.format("%.2f", SliderValue))
					GlobalSliderValue = SliderValue
                    Slider.Value.PlaceholderText = tostring(SliderValue)
                    Callback(GlobalSliderValue)
                end
				local function SetValue(Value)
					GlobalSliderValue = Value
					Slider.Slider.Bar.Size = UDim2.new(Value / Max,0,1,0)
					Slider.Value.PlaceholderText = Value
					Callback(Value)
				end
				SetValue(Precise)
				Slider.Value.FocusLost:Connect(function()
					if not tonumber(Slider.Value.Text) then
						Slider.Value.Text = GlobalSliderValue
					elseif Slider.Value.Text == "" or tonumber(Slider.Value.Text) <= Min then
						Slider.Value.Text = Min
					elseif Slider.Value.Text == "" or tonumber(Slider.Value.Text) >= Max then
						Slider.Value.Text = Max
					end
		
					GlobalSliderValue = Slider.Value.Text
					Slider.Slider.Bar.Size = UDim2.new(Slider.Value.Text / Max,0,1,0)
					Slider.Value.PlaceholderText = Slider.Value.Text
					Callback(tonumber(Slider.Value.Text))
					Slider.Value.Text = ""
				end)
				Slider.InputBegan:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
                        Sliding(Input)
						Dragging = true
                    end
                end)

				Slider.InputEnded:Connect(function(Input)
                    if Input.UserInputType == Enum.UserInputType.MouseButton1 then
						Dragging = false
                    end
                end)
				game:GetService("UserInputService").InputChanged:Connect(function(Input)
					if Dragging and Input.UserInputType == Enum.UserInputType.MouseMovement then
						Sliding(Input)
					end
				end)

			end
			function Object:CreateTable(titletable,valuee, defTable, OptionTable, Callback)
				local Table_ = CreateTable(titletable,valuee,Section.Container)
				local TableToggle = false
				local table2 = {}
				Table_.MouseButton1Click:Connect(function()
					TableToggle = not TableToggle
					if TableToggle then
						Table_.Size = UDim2.new(1,-10,0,Table_.Container.Holder.Container.ListLayout.AbsoluteContentSize.Y + Table_.Title.TextBounds.Y + 30)
						Table_.Container.Holder.Visible = true
					else
						Table_.Size = UDim2.new(1,-10,0,Table_.Title.TextBounds.Y + 25)
						Table_.Container.Holder.Visible = false
					end
				end)
				for _,OptionNamev in pairs(defTable) do
					local Option = OptionName(OptionNamev,Table_.Container.Holder.Container)
					Option.Size = UDim2.new(1,0,0,Option.Title.TextBounds.Y + 5)
					Table_.Container.Holder.Size = UDim2.new(1,-5,0,Table_.Container.Holder.Container.ListLayout.AbsoluteContentSize.Y)
					Option.MouseButton1Click:Connect(function()
						if Option.BackgroundColor3 == Color3.fromRGB(25,25,25) then
							if not table.find(table2,OptionNamev) then
								table.insert(table2,OptionNamev)
							end
							Option.BackgroundColor3 = Color3.fromRGB(50,50,50)
						elseif Option.BackgroundColor3 ==Color3.fromRGB(50,50,50) then
							for i,v in pairs(table2) do
								if v == OptionNamev then
									table.remove(table2,i)
								end
							end
							Option.BackgroundColor3 = Color3.fromRGB(25,25,25)
						end
						Callback(table2)
					end)
				end
				for c,d in pairs(Table_.Container.Holder.Container:GetChildren()) do
					if d:IsA("TextButton") and table.find(OptionTable,d.Title.Text) then
						if not table.find(table2,d.Title.Text) then
							table.insert(table2,d.Title.Text)
							d.BackgroundColor3 = Color3.fromRGB(50,50,50)
							Callback(table2) 
						end
					end
				end
				Callback(table2)
			end
			function Object:CreateLabel(titlelabel)
				local Label = CreateLabel(titlelabel,Section.Container)
				local Labelinit ={}
				function Labelinit:NewText(v)
					Label.Text =v
				end
				return Labelinit
			end
			return Object
		end
		return SectionFunc
	end
	return PageFunc
end

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

function toTarget(targetCFrame,Spd)
    if game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local Distance = (targetCFrame.Position - game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").Position).Magnitude
        local Speed = 250
        if Spd ~= nil then
            Speed = Spd
        else
            if Distance < 500 then
                Speed = 500
            elseif Distance < 750 then
                Speed = 325
            elseif Distance < 1000 then
                Speed = 275
            elseif Distance >= 1000 then
                Speed = 250
            end
        end
        local info = TweenInfo.new(Distance/Speed,Enum.EasingStyle.Linear)
        local tween2 = game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = targetCFrame})
        tween2:Play()
        
        if targetCFrame.Y >= 6 then
            tween2:Cancel()
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.X,targetCFrame.Y,game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Z)
        end
        

        local tweenfunc = {}
    
        local tween = game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character["HumanoidRootPart"], info, {CFrame = targetCFrame})
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
	for i,v in pairs(plr.Backpack:GetChildren()) do
		if v:IsA("Tool") then
			if v.ToolTip == ToolTip then
				EquipWeapon(v.Name)
			end
		end
	end
end


local LP=game.Players.LocalPlayer
local CbFw = getupvalues(require(LP.PlayerScripts.CombatFramework))
local CbFw2 = CbFw[2]
function GetCurrentBlade() 
    local p13 = CbFw2.activeController
    local ret = p13.blades[1]
    if not ret then return end
    while ret.Parent~=game.Players.LocalPlayer.Character do ret=ret.Parent end
    return ret
end

function getRoot(char)

    if char then
       local rootPart = char:FindFirstChild('HumanoidRootPart')
       return rootPart
    end
    return false
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
    local t = tick()
    while wait(0.125) do
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

local NoClip = false

spawn(function()
	game:GetService("RunService").Stepped:Connect(function()
		if NoClip then
			for _, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
				if v:IsA("BasePart") then
					v.CanCollide = false
				end
			end
			if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyPosition") then
				game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyPosition"):Destroy()
			end
		end
	end)
end)

local SawHub = Lib:CreateWindow("Saw Hub",Enum.KeyCode.RightControl)

do
	local Main = SawHub:CreatePage("Main")

	do
		local fov_circle = Drawing.new("Circle")
		fov_circle.Thickness = 1
		fov_circle.NumSides = 100
		fov_circle.Radius = 180
		fov_circle.Filled = false
		fov_circle.Visible = false
		fov_circle.ZIndex = 999
		fov_circle.Transparency = 1
		fov_circle.Color = Color3.fromRGB(255, 0, 0)

		local FindFirstChild = game.FindFirstChild
		local Camera = workspace.CurrentCamera
		local GetPartsObscuringTarget = Camera.GetPartsObscuringTarget
		local WorldToScreen = Camera.WorldToScreenPoint
		local GetMouseLocation = UIS.GetMouseLocation
		local GetPlayers = Players.GetPlayers

		function IsPlayerVisible(Player)
			local PlayerCharacter = Player.Character
			local LocalPlayerCharacter = plr.Character

			if not (PlayerCharacter or LocalPlayerCharacter) then return end 

			local PlayerRoot = FindFirstChild(PlayerCharacter, "HumanoidRootPart")

			if not PlayerRoot then return end 

			local CastPoints, IgnoreList = {PlayerRoot.Position, LocalPlayerCharacter, PlayerCharacter}, {LocalPlayerCharacter, PlayerCharacter}
			local ObscuringObjects = #GetPartsObscuringTarget(Camera, CastPoints, IgnoreList)

			return ((ObscuringObjects == 0 and true) or (ObscuringObjects > 0 and false))
		end

		function getMousePosition()
			return GetMouseLocation(UIS)
		end

		function getPositionOnScreen(Vector)
			local Vec3, OnScreen = WorldToScreen(Camera, Vector)
			return Vector2.new(Vec3.X, Vec3.Y), OnScreen
		end


		function getClosestPlayer()
			local Closest
			local DistanceToMouse
			for _, Player in next, GetPlayers(Players) do
				if Player == LP then continue end
		
				local Character = Player.Character
				if not Character then continue end
		
				local HumanoidRootPart = FindFirstChild(Character, "HumanoidRootPart")
				local Humanoid = FindFirstChild(Character, "Humanoid")
				if not HumanoidRootPart or not Humanoid or Humanoid and Humanoid.Health <= 0 then continue end
		
				local ScreenPosition, OnScreen = getPositionOnScreen(HumanoidRootPart.Position)
				if not OnScreen then continue end
		
				local Distance = (getMousePosition() - ScreenPosition).Magnitude
				if Distance <= (DistanceToMouse or getgenv().FOV or 2000) then
					Closest = Character["HumanoidRootPart"]
					DistanceToMouse = Distance
				end
			end
			return Closest
		end

		local Aimtion = Main:CreateSection("Aim FOV")
		Aimtion:CreateToggle("Enabled",false,function(v)
			getgenv().AimFov = v
		end)

		Aimtion:CreateToggle("Aim Cam",false,function(v)
			getgenv().AimCam = v
			repeat wait()
				local HitPart = getClosestPlayer()
				if HitPart then
					workspace.CurrentCamera.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.Position,HitPart.Position)
				end
			until not getgenv().AimCam
		end)

		Aimtion:CreateToggle("Show FOV",false,function(v)
			getgenv().ShowFOV = v
			task.spawn(function()
				repeat wait()
					fov_circle.Visible = v
					fov_circle.Color = Color3.fromRGB(54, 57, 241)
					fov_circle.Position = getMousePosition()
				until not getgenv().ShowFOV
			end)
		end)

		Aimtion:CreateSlider("FOV Circle Radius",0,360,180,function(v)
			fov_circle.Radius = v
			getgenv().FOV = v
		end)

		oldIndex = hookmetamethod(game, "__index", newcclosure(function(self, Index)
			if self == Mouse and not checkcaller() and getgenv().AimFov and getClosestPlayer() then
				local HitPart = getClosestPlayer()
				
				if Index == "Target" or Index == "target" then 
					return HitPart
				elseif Index == "Hit" or Index == "hit" then 
					return HitPart.CFrame
				elseif Index == "X" or Index == "x" then 
					return self.X 
				elseif Index == "Y" or Index == "y" then 
					return self.Y 
				elseif Index == "UnitRay" then 
					return Ray.new(self.Origin, (self.Hit - self.Origin).Unit)
				end
			end

			return oldIndex(self, Index)
		end))

	end

	do
		getgenv().FlySpeed =100
		function ActiveFly()
			local mouse=game.Players.LocalPlayer:GetMouse''
			local keys={a=false,d=false,w=false,s=false}
			local e1
			local e2
			local function start()
				local pos = Instance.new("BodyPosition",getgenv().MyBoat.VehicleSeat)
				pos.Name="EPIXPOS"
				pos.maxForce = Vector3.new(math.huge, math.huge, math.huge)
				pos.position = getgenv().MyBoat.VehicleSeat.Position
				local gyro = Instance.new("BodyGyro",getgenv().MyBoat.VehicleSeat)
				gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
				gyro.cframe = mouse.Hit
				repeat
					wait()
					gyro.cframe = mouse.Hit
					if keys.w then
						pos.Position = (getgenv().MyBoat.VehicleSeat.CFrame * CFrame.new(0,0,-getgenv().FlySpeed)).Position
					end
					if keys.s then
						pos.Position = (getgenv().MyBoat.VehicleSeat.CFrame * CFrame.new(0,0,getgenv().FlySpeed)).Position
					end
					if keys.d then
						pos.Position = (getgenv().MyBoat.VehicleSeat.CFrame * CFrame.new(getgenv().FlySpeed,0,0)).Position
					end
					if keys.a then
						pos.Position = (getgenv().MyBoat.VehicleSeat.CFrame * CFrame.new(-getgenv().FlySpeed,0,0)).Position
					end
				until not Fly
				if pos then 
					pos:Destroy() 
				end
				if gyro then
					gyro:Destroy()
				end
				e1:disconnect() e2:disconnect() 
			end
			e1=mouse.KeyDown:connect(function(key)
				if key=="w" then
					keys.w=true
				elseif key=="s" then
					keys.s=true
				elseif key=="a" then
					keys.a=true
				elseif key=="d" then
					keys.d=true
				end
			end)
			e2=mouse.KeyUp:connect(function(key)
				if key=="w" then
					keys.w=false
				elseif key=="s" then
					keys.s=false
				elseif key=="a" then
					keys.a=false
				elseif key=="d" then
					keys.d=false
				end
			end)
			start()
		end

		
		local Boattion = Main:CreateSection("Boat Troll")

		Boattion:CreateButton("Buy Boat",function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", "MarineSloop")
			for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
				if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
					getgenv().MyBoat = v
					pcall(function()
						v.VehicleSeat.BodyGyro:Destroy()
						v.VehicleSeat.BodyPosition:Destroy()
					end)
				end
			end
		end)

		Boattion:CreateToggle("Tp Boat",false,function(v)
			getgenv().TpBoat = v
			task.spawn(function()
				repeat task.wait()
					if getgenv().MyBoat ~= nil and getgenv().SelectPlayer ~= nil then
						pcall(function()
							getgenv().MyBoat.VehicleSeat.CFrame = game:GetService("Workspace").Characters[getgenv().SelectPlayer].HumanoidRootPart.CFrame
						end)
					end
				until not getgenv().TpBoat
			end)
		end)

		
		Boattion:CreateToggle("Start Disconnect Boat",false,function(v)
			getgenv().StartDisconnectBoat = v
			task.spawn(function()
				repeat wait(.1)
					if getgenv().MyBoat ~= nil and getgenv().SelectPlayer ~= nil then
						pcall(function()
							getgenv().MyBoat.VehicleSeat.CFrame = CFrame.new(math.random(-99999,99999),0,math.random(-99999,99999))
						end)
					end
				until not getgenv().StartDisconnectBoat
			end)
		end)

		Boattion:CreateSlider("Boat Speed",1,500,100,function(v)
			getgenv().FlySpeed = v
		end)

		Boattion:CreateToggle("Boat Fly",false,function(v)
			Fly = v
			ActiveFly()
		end)

		Boattion:CreateToggle("Tween Player",false,function(v)
			getgenv().TweenPlayer = v
			Float(false)
			NoClip=false
			task.spawn(function()
				repeat task.wait()
					if getgenv().SelectPlayer ~= nil then
						pcall(function()
							toTarget(game:GetService("Workspace").Characters[getgenv().SelectPlayer].HumanoidRootPart.CFrame)
							Float(true)
							NoClip=true
						end)
					end
				until not getgenv().TweenPlayer
				Float(false)
				NoClip=false
			end)
		end)

		Boattion:CreateToggle("Tween Boat",false,function(v)
			getgenv().TweenBoat = v
			task.spawn(function()
				spawn(function()
					for i,v in pairs(getgenv().MyBoat:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = false
						end
					end
				end)
				repeat task.wait()
					if getgenv().SelectPlayer ~= nil then
						pcall(function()
							local targetCFrame = game:GetService("Workspace").Characters[getgenv().SelectPlayer].HumanoidRootPart.CFrame
							local Distance = (targetCFrame.Position - getgenv().MyBoat.VehicleSeat.Position).Magnitude
							local info = TweenInfo.new(Distance/200,Enum.EasingStyle.Linear)
							game:GetService("TweenService"):Create(getgenv().MyBoat.VehicleSeat, info, {CFrame = targetCFrame}):Play()
						end)
					end
				until not getgenv().TweenBoat
				spawn(function()
					for i,v in pairs(getgenv().MyBoat:GetDescendants()) do
						if v:IsA("BasePart") then
							v.CanCollide = true
						end
					end
				end)
			end)
		end)

		Boattion:CreateToggle("Tp Player",false,function(v)
			getgenv().TpPlayer = v
			task.spawn(function()
				repeat task.wait()
					if getgenv().SelectPlayer ~= nil then
						pcall(function()
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Workspace").Characters[getgenv().SelectPlayer].HumanoidRootPart.CFrame
						end)
					end
				until not getgenv().TpPlayer
			end)
		end)

		Boattion:CreateButton("Tp Player 2",function()
			if getgenv().SelectPlayer ~= nil then
				pcall(function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Workspace").Characters[getgenv().SelectPlayer].HumanoidRootPart.CFrame
				end)
			end
		end)

		Boattion:CreateButton("Tp Boat To Me",function()
			if getgenv().MyBoat ~= nil then
				pcall(function()
					getgenv().MyBoat.VehicleSeat.CFrame = plr.Character.HumanoidRootPart.CFrame
				end)
			end
		end)
	end

	do
		local Racetion = Main:CreateSection("Race")

		Racetion:CreateToggle("Tp To Mirage",false,function(v)
			getgenv().TpMirage = v
			if v then
				spawn(function()
					repeat wait()
						for i,v in pairs(getnilinstances()) do
							if v:FindFirstChild("Head") and v.Head:FindFirstChild("Talk") and v.Name == "Advanced Fruit Dealer" then
								NoClip = true
								Float(true)
								toTarget(v.HumanoidRootPart.CFrame)
							end
						end
					until not getgenv().TpMirage
					NoClip = false
					Float(false)
					toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
				end)
			else
				NoClip = false
				Float(false)
				toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
			end
		end)

		Racetion:CreateToggle("Tp To Gear",false,function(v)
			getgenv().TpGear = v
			if v then
				spawn(function()
					repeat wait()
						for i,v in pairs(game:GetService("Workspace").Map.MysticIsland:GetChildren()) do
							if v.Name == "Part" and v.ClassName == "MeshPart" then
								NoClip = true
								Float(true)
								toTarget(v.CFrame)
							end
						end
					until not getgenv().TpGear
					NoClip = false
					Float(false)
					toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
				end)
			else
				NoClip = false
				Float(false)
				toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)
			end
		end)
		
		Racetion:CreateButton("Lever",function()
			fireproximityprompt(game:GetService("Workspace").Map["Temple of Time"].Lever.Prompt.ProximityPrompt, 0, true) 
		end)

		Racetion:CreateButton("Tp To Temple of Time in second",function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14896.5341796875, 102.62469482421875)
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress", "Teleport")
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28286.35546875, 14896.5341796875, 102.62469482421875)
		end)

		Racetion:CreateButton("Tp Mink Trial ( In Temple of Time )",function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29007.5, 14890.7, -380.27)
		end)

		Racetion:CreateButton("Tp Cyborg Trial ( In Temple of Time )",function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28537.9, 14887.5, -414.528)
		end)

		Racetion:CreateButton("Tp Fish Trial ( In Temple of Time )",function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28248.7, 14896.7, -211.227)
		end)

		Racetion:CreateButton("Tp Ghoul Trial ( In Temple of Time )",function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28688.5, 14916.3, 364.389)
		end)

		Racetion:CreateButton("Tp Angel Trial ( In Temple of Time )",function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28953.2, 14918.7, 229.828)
		end)

		Racetion:CreateButton("Tp Human Trial ( In Temple of Time )",function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(29163.5, 14890.7, -213.937)
		end)


		Racetion:CreateButton("Complete Mink Trial in second",function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame=game:GetService("Workspace").Map.MinkTrial.Floor.CFrame
		end)

		Racetion:CreateButton("Complete Angel Trial in second",function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").Map.SkyTrial.Model.FinishPart.CFrame
		end)

		Racetion:CreateButton("Buy Update",function()
			game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
		end)

		Racetion:CreateSlider("Time Stop Train (Second)",0,1800,600,function(v)
			getgenv().TimeAU = v
		end)

		Racetion:CreateToggle("Auto Train",false,function(v)
			local ts = os.time()
			getgenv().AutoTrain = v
			task.spawn(function()
				repeat task.wait()
					NoClip=true
					if not plr.Character.RaceTransformed.Value or os.time()-ts < getgenv().TimeAU then
						pcall(function()
							local f = game.Players.LocalPlayer.Backpack:FindFirstChild("Awakening") or game.Players.LocalPlayer.Character:FindFirstChild("Awakening")
							if f then
								f.RemoteFunction:InvokeServer(true)
							end
							if game:GetService("Workspace").Enemies:FindFirstChild("Reborn Skeleton [Lv. 1975]") or game:GetService("Workspace").Enemies:FindFirstChild("Living Zombie [Lv. 2000]") or game:GetService("Workspace").Enemies:FindFirstChild("Demonic Soul [Lv. 2025]") or game:GetService("Workspace").Enemies:FindFirstChild("Posessed Mummy [Lv. 2050]") then
								for i,v in pairs(game:GetService("Workspace").Enemies:GetChildren()) do
									if not plr.Character.RaceTransformed.Value and v.Name == "Reborn Skeleton [Lv. 1975]" or v.Name == "Living Zombie [Lv. 2000]" or v.Name == "Demonic Soul [Lv. 2025]" or v.Name == "Posessed Mummy [Lv. 2050]" then
										if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
											repeat task.wait()
												Float(true)
												EquipToolTip("Melee")
												v.HumanoidRootPart.CanCollide = false
												v.Humanoid.WalkSpeed = 0
												v.Head.CanCollide = false 
												PosMonBone = v.HumanoidRootPart.CFrame
												StartMagnetBoneMon = true
												toTarget(v.HumanoidRootPart.CFrame * CFrame.new(2,20,2))
												Usefastattack = true
												game:GetService('VirtualUser'):CaptureController()
                								game:GetService('VirtualUser'):ClickButton1(Vector2.new(851, 158), game:GetService("Workspace").Camera.CFrame)
											until not getgenv().AutoTrain or not v.Parent or v.Humanoid.Health <= 0
										end
									end
								end
							else
								StartMagnetBoneMon = false
								toTarget(CFrame.new(-9506, 172, 6101))
							end
						end)
					elseif os.time()-ts > getgenv().TimeAU then
						repeat task.wait()
							toTarget(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,30,0))
							wait(0.5)
						until not plr.Character.RaceTransformed.Value or not getgenv().AutoTrain
						game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("UpgradeRace", "Buy")
						ts = os.time()
					end
				until not getgenv().AutoTrain
				Float(false)
				Usefastattack = false
				NoClip=false
			end)
			task.spawn(function()
				repeat
					if StartMagnetBoneMon then
						pcall(function()
							for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
								if StartMagnetBoneMon and v.Humanoid.Health > 0 and (PosMonBone.Position - v.HumanoidRootPart.Position).magnitude <= 250 then
									v.HumanoidRootPart.CFrame = PosMonBone
									sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
								end
							end
						end)
					end
					wait(0.08)
				until not getgenv().AutoTrain
			end)
		end)
	end

	do
		if ThreeWorld then
			local Statustion = Main:CreateSection("Status")

			local Moon = Statustion:CreateLabel("Moon : ???")
			
			local MirageIsland = Statustion:CreateLabel("Mirage Island : False")
			
			spawn(function()
				while wait(1) do
					if game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
						Moon:NewText("Moon : FULL MOON")
					elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
						Moon:NewText("Moon : 3/4")
					else
						Moon:NewText("Moon : Trash")
					end
					if game:GetService("Workspace").Map:FindFirstChild("MysticIsland") then
						MirageIsland:NewText("Mirage Island : True")
					else
						MirageIsland:NewText("Mirage Island : False")
					end
				end
			end)
		end
	end

	do
		function FindTool(name)
			for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
				if v:IsA("Tool") and v.Name == name then 
					return v
				end
			end
			for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
				if v:IsA("Tool") and v.Name == name then 
					return v
				end
			end
			return nil
		end
		local Playertion = Main:CreateSection("Player")
		
		Playertion:CreateToggle("Bring Player",false,function(v)
			getgenv().BringPlr = v
			if getgenv().SelectPlayer ~= nil then
				if getRoot(game.Players[getgenv().SelectPlayer].Character) then
				   local SpectatePlrr =  getRoot(game.Players[getgenv().SelectPlayer].Character)
				   if SpectatePlrr then
					local old = getRoot(LP.Character).CFrame
					  repeat task.wait()
						pcall(function ()
							SpectatePlrr.Size = Vector3.new(50,50,50)
							if getRoot(LP.Character):FindFirstChild("BodyVelocity") then
								delay(.5,function()
									getRoot(LP.Character).CFrame = old
								end)
							else
								getRoot(LP.Character).CFrame =SpectatePlrr.CFrame
							end
						end)
					  until not getgenv().BringPlr
					  SpectatePlrr.Size = Vector3.new(2,1,1)
				   end
				end
			 end
		end)

		Playertion:CreateToggle("Spectate Player",false,function(v)
			getgenv().Spectate= v
			if getgenv().SelectPlayer ~= nil then
				if getRoot(game.Players[getgenv().SelectPlayer].Character) then
				   local SpectatePlrr =  getRoot(game.Players[getgenv().SelectPlayer].Character)
				   if SpectatePlrr then
					  repeat wait(.1)
						 if SpectatePlrr then
							if SpectatePlrr.Parent:FindFirstChild("Humanoid") then
							   game.Workspace.Camera.CameraSubject = SpectatePlrr.Parent:FindFirstChild("Humanoid")
							end
						 else
							game.Workspace.Camera.CameraSubject = LP.Character:FindFirstChild('Humanoid')
						 end
					  until not getgenv().Spectate
				   end
				   game.Workspace.Camera.CameraSubject = LP.Character:FindFirstChild('Humanoid')
		  
				end
			 end
			 if not getgenv().Spectate then
				game.Workspace.Camera.CameraSubject = LP.Character:FindFirstChild('Humanoid')
			 end
		end)

		Playertion:CreateToggle("Strafe Player",false,function(v)
			getgenv().Strafe = v
			_G.on = not _G.on

			repeat task.wait()
				pcall(function()
					if game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyPosition") then
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyPosition"):Destroy()
					end
					NoClip = true
					Float(true)
					if getgenv().SelectPlayer and game.Workspace.Characters:FindFirstChild(getgenv().SelectPlayer) then
						local I = game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("I") or Instance.new("Part")
						I.Anchored = true
						I.Name = "I"
						I.CanCollide = false
						I.Size = Vector3.new(1,1,1)
						I.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
						I.Position = game.Workspace.Characters:FindFirstChild(getgenv().SelectPlayer).HumanoidRootPart.Position
						I.CFrame = I.CFrame  * CFrame.fromAxisAngle(Vector3.new(0,1,0), math.rad(5))
						if (game.Workspace.Characters:FindFirstChild(getgenv().SelectPlayer).HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 100 then
							if math.random(1,5) == 1 then
								for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.Main.Skills:GetChildren()) do
									if game.Workspace.Characters:FindFirstChild(game.Players.LocalPlayer.Name) and (game.Players.LocalPlayer.Backpack:FindFirstChild(v.Name) or game.Players.LocalPlayer.Character:FindFirstChild(v.Name)) then
										local abc = FindTool(v.Name)
										if abc then 
											for i2,v2 in pairs(v:GetChildren()) do
												if (v2.Name == "Z" or v2.Name == "X" or v2.Name == "C" or v2.Name == "V" or v2.Name == "F") then
													if game:GetService("Players").LocalPlayer.Character.Busy.Value == false and v2.Title.TextColor3 == Color3.fromRGB(255,255,255) and v2.Cooldown.Size == UDim2.new(0, 0, 1, -1) then

														EquipWeapon(v.Name)
														toTarget(CFrame.new(game.Workspace.Characters:FindFirstChild(getgenv().SelectPlayer).HumanoidRootPart.Position + Vector3.new(0,10,0),game.Workspace.Characters:FindFirstChild(getgenv().SelectPlayer).HumanoidRootPart.Position))
														if abc.ToolTip == "Gun" then
															game:GetService('VirtualUser'):CaptureController()
															game:GetService('VirtualUser'):ClickButton1(Vector2.new(0, 0), game:GetService("Workspace").Camera.CFrame)
														end
														game:service('VirtualInputManager'):SendKeyEvent(true, v2.Name, false, game)
														task.wait(0.1)
														toTarget(CFrame.new(game.Workspace.Characters:FindFirstChild(getgenv().SelectPlayer).HumanoidRootPart.Position + Vector3.new(0,10,0),game.Workspace.Characters:FindFirstChild(getgenv().SelectPlayer).HumanoidRootPart.Position))
														game:service('VirtualInputManager'):SendKeyEvent(false, v2.Name, false, game)
														repeat task.wait() until game:GetService("Players").LocalPlayer.Character.Busy.Value == false
														task.wait(0.5)
													else
														toTarget(I.CFrame * CFrame.new(0,20,-70))
													end
												end
											end
										end
									end
								end
							else
								toTarget(I.CFrame * CFrame.new(0,20,-70))
							end
						else
							toTarget(I.CFrame * CFrame.new(0,20,-70))
						end
					end
				end)
			until not getgenv().Strafe
			NoClip = false
			Float(false)
		end)

		Playertion:CreateToggle("Steal Player ( Need Boat )",false,function(v)
			getgenv().StealPlayer = v
			repeat task.wait()
				if getgenv().MyBoat ~= nil and getgenv().SelectPlayer and game.Workspace.Characters:FindFirstChild(getgenv().SelectPlayer) then
					pcall(function()
						if math.random(1,2) == 1 then
							getgenv().MyBoat.VehicleSeat.CFrame = game.Workspace.Characters:FindFirstChild(getgenv().SelectPlayer).HumanoidRootPart.CFrame * CFrame.new(5, -1, 28)
						else
							getgenv().MyBoat.VehicleSeat.CFrame = game.Workspace.Characters:FindFirstChild(getgenv().SelectPlayer).HumanoidRootPart.CFrame * CFrame.new(-5, -1, 28)
						end
					end)
				end
			until not getgenv().StealPlayer
		end)

		Playertion:CreateButton("Steal Player ( Need Boat ) 2",function()
			if getgenv().MyBoat ~= nil and getgenv().SelectPlayer and game.Workspace.Characters:FindFirstChild(getgenv().SelectPlayer) then
				if math.random(1,2) == 1 then
					getgenv().MyBoat.VehicleSeat.CFrame = game.Workspace.Characters:FindFirstChild(getgenv().SelectPlayer).HumanoidRootPart.CFrame * CFrame.new(5, -1, 28)
				else
					getgenv().MyBoat.VehicleSeat.CFrame = game.Workspace.Characters:FindFirstChild(getgenv().SelectPlayer).HumanoidRootPart.CFrame * CFrame.new(-5, -1, 28)
				end
			end
		end)
	end
	
	do
		local Settingtion = Main:CreateSection("Setting")
		local slpr = Settingtion:CreateDropDown("Select Player", {}, function(v)
			getgenv().SelectPlayer = v
		end)

		Settingtion:CreateButton("Refesh",function()
			local tabl = {}
			for i,v in pairs(game.Players:GetChildren()) do
				table.insert( tabl, v.Name )
			end
			slpr:NewList(tabl)
		end)
	end
end

do
	local LocalPlayerPage = SawHub:CreatePage("Local Player")
	
	local Charactertion = LocalPlayerPage:CreateSection("Character")

	Charactertion:CreateToggle("Enabled Speed",false,function(v)
		getgenv().HackSpeedAndJump = v
		if v then
			task.spawn(function()
				repeat wait(1)
					pcall(function()
						plr.Character["Movement + Swim"].Disabled = true
						plr.Character["Humanoid"].WalkSpeed = getgenv().SpeedHack
					end)
				until not getgenv().HackSpeedAndJump
				pcall(function()
					plr.Character["Movement + Swim"].Disabled = false
				end)
			end)
		else
			pcall(function()
				plr.Character["Movement + Swim"].Disabled = false
			end)
		end
	end)

	Charactertion:CreateSlider("Speed",16,500,50,function(v)
		getgenv().SpeedHack = v
		pcall(function()
			plr.Character["Humanoid"].WalkSpeed = v
		end)
	end)

	Charactertion:CreateButton("Invisible",function()
        local Clone = game.Players.LocalPlayer.Character.LowerTorso.Root:Clone()
		game.Players.LocalPlayer.Character.LowerTorso.Root:Destroy()
		Clone.Parent = game.Players.LocalPlayer.Character.LowerTorso
	end)

	local Clienttion = LocalPlayerPage:CreateSection("Client")

	Clienttion:CreateButton("Tp To Safe",function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28275.771484375, 14896.544921875, 154.59725952148438)
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress", "Teleport")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28275.771484375, 14896.544921875, 154.59725952148438)
	end)

	Clienttion:CreateButton("Tp To Pvp Zone",function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28692.357421875, 14954.8515625, -72.62789916992188)
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("RaceV4Progress", "Teleport")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(28692.357421875, 14954.8515625, -72.62789916992188)
	end)

	Clienttion:CreateButton("Muti Tool",function()
	
	for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
		if v.ToolTip == "Gun" or v.ToolTip == "Melee" then
			v.Parent = game.Players.LocalPlayer.Character
		end
	end
end)

	Clienttion:CreateButton("Fast Click Gun (Unequip Weapon)",function()
		for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
			if v.ToolTip == "Gun" then
				v.Cooldown.Value = 0
			end
		end
	end)

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
	

	Clienttion:CreateToggle("Join Sever Full Moon",false,function(v)
		getgenv().FullMoon = v
		if v then
			spawn(function()
				repeat wait()
					if game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149052" then
					elseif game:GetService("Lighting").Sky.MoonTextureId == "http://www.roblox.com/asset/?id=9709149431" then
					else
						queue_on_teleport([[
							getgenv().FullMoon = true
							print("memaybeo")
						]])
						HopServer()
					end
				until not getgenv().FullMoon
			end)
		end
	end)

	Clienttion:CreateToggle("Enderman Mode",false,function(v)
		getgenv().EndermanMode = v
		if v then
			spawn(function()
				repeat wait()
					pcall(function()
						local End = Instance.new("Part")
						local functp
						End.Size = Vector3.new(1,1,1)
						End.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(math.random(-25,25),30,math.random(-25,25))
						End.Parent = workspace
						functp = End.Touched:Connect(function(hit)
							functp:Disconnect()
							game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = End.CFrame
							End:Destroy()
						end)
					end)
				until not getgenv().EndermanMode
			end)
		end
	end)

	Clienttion:CreateToggle("Fast Attack (Support Trigon)",false,function(v)
		Usefastattack = v
	end)

	Clienttion:CreateToggle("Run Mode",false,function(v)
		getgenv().RunMode = v
		repeat task.wait()
			pcall(function()
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame *= CFrame.new(0,1000,0)
			end)
		until not getgenv().RunMode
	end)

	Clienttion:CreateToggle("Inf Stamina",false,function(v)
		getgenv().InfStamina = v
		repeat task.wait()
			pcall(function()
				LP.Character.Energy.Value = LP.Character.Energy.MaxValue
			end)
		until not getgenv().InfStamina
	end)

	Clienttion:CreateToggle("Copy Part",false,function(v)
		getgenv().CopyPart = v
	end)

	game:GetService("UserInputService").InputBegan:Connect(function(key,chat)
		if chat then return end
		if key.KeyCode == Enum.KeyCode.P and getgenv().CopyPart then
			setclipboard(game.Players.LocalPlayer:GetMouse().Target:GetFullName())
			print(game.Players.LocalPlayer:GetMouse().Target:GetFullName())
		end
	end)

	Clienttion:CreateButton("Fix lag",function()
		settings().Physics.PhysicsEnvironmentalThrottle = 1
		settings().Rendering.QualityLevel = 'Level01'
		workspace.ClientAnimatorThrottling = Enum.ClientAnimatorThrottlingMode.Enabled
		workspace.InterpolationThrottling = Enum.InterpolationThrottlingMode.Enabled
		settings():GetService("RenderSettings").EagerBulkExecution = false
		workspace.LevelOfDetail = Enum.ModelLevelOfDetail.Disabled
		game:GetService("Lighting").GlobalShadows = false

		for _, v in next, game:GetDescendants() do
			if v:IsA('Workspace') then
				v.Terrain.Elasticity = 0
				v.Terrain.WaterWaveSize = 0
				v.Terrain.WaterWaveSpeed = 0
				v.Terrain.WaterReflectance = 0
				v.Terrain.WaterTransparency = 1
			elseif v:IsA('Lighting') then
				v.GlobalShadows = false
				v.FogEnd = 1/0
				v.Brightness = 0
			elseif v:IsA('Decal') or v:IsA('Texture')  then
				v.Transparency = 1
			elseif v:IsA('Fire') or v:IsA('SpotLight') or v:IsA('Smoke') or v:IsA('Sparkles') then
				v.Enabled = false
			elseif v:IsA('SpecialMesh') then
				v.TextureId = ''
				v.MeshId = ''
			elseif v:IsA('ParticleEmitter') or v:IsA('Trail') then
				v.Lifetime = NumberRange.new(0)
			elseif v:IsA('BlurEffect') or v:IsA('SunRaysEffect') or v:IsA('ColorCorrectionEffect') or v:IsA('BloomEffect') or v:IsA('DepthOfFieldEffect')  then
				v.Enabled = false
			elseif (v:IsA('BasePart') or v:IsA("Union") or v:IsA("CornerWedgePart")) and not v:IsA('MeshPart') then
				v.Reflectance = 0
				v.Material = 'SmoothPlastic'
			elseif v:IsA('Pants') or v:IsA('Shirt') then
				v[v.ClassName..'Template'] = ''
			elseif v:IsA('Explosion') then
				v.BlastPressure = 0
				v.BlastRadius = 0
				v.Visible = false
				v.Position = Vector3.new(0, 0, 0)
			elseif v:IsA('ForceField') then
				v.Visible = false
			elseif v:IsA('ShirtGraphic') then
				v.Graphic = ''
			end
		end
		
		workspace.DescendantAdded:Connect(function(v)
			if v:IsA('Model') then
			elseif v:IsA('Decal') or v:IsA('Texture')  then
				v.Transparency = 1
			elseif v:IsA('Fire') or v:IsA('SpotLight') or v:IsA('Smoke') or v:IsA('Sparkles') then
				v.Enabled = false
			elseif v:IsA('SpecialMesh') then
				v.TextureId = ''
				v.MeshId = ''
			elseif v:IsA('ParticleEmitter') or v:IsA('Trail') then
				v.Lifetime = NumberRange.new(0)
			elseif v:IsA('BlurEffect') or v:IsA('SunRaysEffect') or v:IsA('ColorCorrectionEffect') or v:IsA('BloomEffect') or v:IsA('DepthOfFieldEffect')  then
				v.Enabled = false
			elseif v:IsA('BasePart') and not v:IsA('MeshPart') then
				v.Reflectance = 0
				v.Material = 'SmoothPlastic'
			elseif v:IsA('Pants') or v:IsA('Shirt') then
				v[v.ClassName..'Template'] = ''
			elseif v:IsA('Explosion') then
				v.BlastPressure = 0
				v.BlastRadius = 0
				v.Visible = false
				v.Position = Vector3.new(0, 0, 0)
			elseif v:IsA('ForceField') then
				v.Visible = false
			elseif v:IsA('ShirtGraphic') then
				v.Graphic = ''
			end
		end)
	end)

	Clienttion:CreateButton("Remove Fog",function()
		game.Lighting.FogEnd = 1000000
		game:GetService("Lighting").BaseAtmosphere:Destroy()
	end)
end

do
	local RaidTab = SawHub:CreatePage("Raid")

	local Raidsec = RaidTab:CreateSection("Raid")

	Raidsec:CreateToggle("Kill Aura",false,function(v)
		getgenv().KillAura = v
		task.spawn(function()
			repeat task.wait()
				for i,v in pairs(game:GetService("Workspace").Enemies:GetDescendants()) do
					if v.Name == "Humanoid" then
						v.Health = 0
					elseif v.Name == "HumanoidRootPart" then
						v.Size = Vector3.new(50,50,50)
					end
					sethiddenproperty(game:GetService("Players").LocalPlayer,"SimulationRadius",math.huge)
				end
			until not getgenv().KillAura
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
	

	Raidsec:CreateToggle("Next Island",false,function(v)
		getgenv().NextIsland = v
		task.spawn(function()
			repeat task.wait()
				Float(true)
				NoClip=true
				local g = GetIsland()
                if g then
                    toTarget(g.CFrame * CFrame.new(0,30,0)) 
                end
			until not getgenv().NextIsland
			NoClip=false
			Float(false)
		end)
	end)
end

do
	local ShopTab = SawHub:CreatePage("Shop")

	local Abilitiessec = ShopTab:CreateSection("Abilities")

	Abilitiessec:CreateButton("Race Ghoul",function()
		local args = {
			[1] = "Ectoplasm",
			[2] = "BuyCheck",
			[3] = 4
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		local args = {
			[1] = "Ectoplasm",
			[2] = "Change",
			[3] = 4
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	Abilitiessec:CreateButton("Race Cyborg",function()
		local args = {
			[1] = "CyborgTrainer",
			[2] = "Buy"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	Abilitiessec:CreateButton("Random Race (Use 3K Fragments)",function()
		local args = {
			[1] = "BlackbeardReward",
			[2] = "Reroll",
			[3] = "2"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	Abilitiessec:CreateButton("Reset Stats (Use 2.5K Fragments)",function()
		local args = {
			[1] = "BlackbeardReward",
			[2] = "Refund",
			[3] = "2"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	Abilitiessec:CreateButton("Buy Random Devil Fruit",function()
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("Cousin","Buy")
	end)

	local Fightingsec = ShopTab:CreateSection("Fighting Style")

	Fightingsec:CreateButton("Black Leg",function()
		local args = {
			[1] = "BuyBlackLeg"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	Fightingsec:CreateButton("Electro",function()
		local args = {
			[1] = "BuyElectro"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	Fightingsec:CreateButton("Fishman Karate",function()
		local args = {
			[1] = "BuyFishmanKarate"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	Fightingsec:CreateButton("Dragon Claw",function()
		local args = {
			[1] = "BlackbeardReward",
			[2] = "DragonClaw",
			[3] = "2"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	Fightingsec:CreateButton("Superhuman",function()
		local args = {
			[1] = "BuySuperhuman"
		}

		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	Fightingsec:CreateButton("Death Step",function()
		local args = {
			[1] = "BuyDeathStep"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	Fightingsec:CreateButton("Sharkman Karate",function()
		local args = {
			[1] = "BuySharkmanKarate",
			[2] = true
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
		local args = {
			[1] = "BuySharkmanKarate"
		}
		game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer(unpack(args))
	end)
	Fightingsec:CreateButton("Electric Claw",function()
		local string_1 = "BuyElectricClaw";
		local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
		Target:InvokeServer(string_1);
	end)
	Fightingsec:CreateButton("Dragon Talon",function()
		local string_1 = "BuyDragonTalon";
		local bool_1 = true;
		local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
		Target:InvokeServer(string_1, bool_1);
		local string_1 = "BuyDragonTalon";
		local Target = game:GetService("ReplicatedStorage").Remotes["CommF_"];
		Target:InvokeServer(string_1);
	end)
	Fightingsec:CreateButton("Godhuman",function()
		local Event = game:GetService("ReplicatedStorage").Remotes["CommF_"]
		Event:InvokeServer("BuyGodhuman", true)
		Event:InvokeServer("BuyGodhuman")
	end)
end

do
	local mbPage = SawHub:CreatePage("Minh blus")
	local LegitSec = mbPage:CreateSection("Pvp Legit")
	LegitSec:CreateToggle("visible real character player",false,function(v)
		getgenv().vsr = v
		repeat task.wait()
			if getgenv().SelectPlayer then
				local g = workspace.Characters:FindFirstChild(getgenv().SelectPlayer)
				if g then
					for i,v in pairs(g:GetDescendants()) do
						if v:IsA("BasePart") then
							v.Transparency = 1
						end
					end
				end
			end
		until not getgenv().vsr
		for i,v in pairs(g:GetDescendants()) do
			if v:IsA("BasePart") then
				v.Transparency = 0
			end
		end
	end)
	LegitSec:CreateToggle("Prection player in second",false,function(v)
		getgenv().PrectionPlr = v
		repeat task.wait()
			if getgenv().SelectPlayer then
				local g = workspace.Characters:FindFirstChild(getgenv().SelectPlayer)
				if g then
					g.Archivable = true
					getgenv().ec = getgenv().ec or g:Clone()
					getgenv().ec.HumanoidRootPart.Anchored = true
					getgenv().ec.Parent = workspace
					getgenv().ec.HumanoidRootPart.CFrame = g.HumanoidRootPart.CFrame + (g.HumanoidRootPart.Velocity * 0.1)
				end
			end
		until not getgenv().PrectionPlr
		getgenv().ec:Destroy()
		getgenv().ec = nil
	end)

	local IslandSec = mbPage:CreateSection("Island")

	local PosTable = {}

	function SavePoint()
		local TableSave = {}
		for i,v in pairs(PosTable) do
			if typeof(v) == "CFrame" then
				TableSave[i] = {
					X = v.X,
					Y = v.Y,
					Z = v.Z
				}
			end
		end
		local json = game:GetService("HttpService"):JSONEncode(TableSave)
        writefile("Saw Hub/Position.json", json)
	end

	function ReadPoint()
        local s,e = pcall(function()
            local HttpService = game:GetService("HttpService")
            if not isfolder("Saw Hub") then
                makefolder("Saw Hub")
            end
            return HttpService:JSONDecode(readfile("Saw Hub/Position.json"))
        end)
        if s then 
	        local Out = {}
				for i,v in pairs(e) do
					table.insert(Out,CFrame.new(v.X,v.Y,v.Z))
			
				end
	        return Out
        else
            SavePoint()
			local ReadP = ReadPoint()
			local Out = {}
			for i,v in pairs(ReadP) do
				table.insert(Out,CFrame.new(v.X,v.Y,v.Z))
				print(CFrame.new(v.X,v.Y,v.Z),"D")
			end
            return Out
        end
	end


	PosTable = ReadPoint()

	IslandSec:CreateButton("Set Point",function()
		local pos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		local p2 = CFrame.new(pos.X,1.98613954,pos.Z)
		PosTable[#PosTable + 1] = p2
	end)

	IslandSec:CreateButton("Save Point",function()
		SavePoint()
	end)

	IslandSec:CreateButton("Clear Point",function()
		table.clear(PosTable)
	end)

	IslandSec:CreateButton("Automatic Point",function()
		PosTable = {CFrame.new(-5055.3701171875,1.98613954,11807.2958984375),CFrame.new(-16498.001953125,1.98613954,1638.365966796875),CFrame.new(-12245.296875,1.98613954,248.85699462890625),CFrame.new(-8264.677734375,1.98613954,248.85699462890625),CFrame.new(-3234.656005859375,1.98613954,2031.9630126953125),CFrame.new(-815.5560302734375,1.98613954,-1971.1180419921875),CFrame.new(2896.93896484375,1.98613954,7212.15380859375),CFrame.new(6514.07421875,1.98613954,-13965.212890625),CFrame.new(11142.201171875,1.98613954,-5285.15380859375),CFrame.new(-5056.5908203125,1.98613954,-7520.35888671875),CFrame.new(-7114.19384765625,1.98613954,-15603.853515625)}
	end)

	local tt = {"Melee","Blox Fruit","Sword","Gun"}

	IslandSec:CreateToggle("Auto Mirage",false,function(v)
		getgenv().AutoMirage = v
		if v then
			spawn(function()
				game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", "Swan")
							for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
								if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
									getgenv().SelectBC = v
								end
							end
				repeat wait()
					Float(true)
					NoClip = true
					if (#game.Workspace.SeaBeasts:GetChildren() == 0 or not getgenv().AutoEventSea) then
						if getgenv().SelectBC ~= nil then
							for k =1,#PosTable do
								v = PosTable[k]
								repeat wait()
									spawn(function()
										for i,v in pairs(getgenv().SelectBC:GetDescendants()) do
											if v:IsA("BasePart") then
												v.CanCollide = false
											end
										end
									end)
									if game:GetService("Players").LocalPlayer.Character.Humanoid.SeatPart == getgenv().SelectBC.VehicleSeat then
										local mg = (v.Position-getgenv().SelectBC.VehicleSeat.Position).Magnitude
										getgenv().SelectBC.VehicleSeat.ThrottleFloat = 1
										getgenv().SelectBC.VehicleSeat.Throttle = 1
										getgenv().SelectBC.VehicleSeat.CFrame = CFrame.new(getgenv().SelectBC.VehicleSeat.Position,v.Position)
										game:GetService("TweenService"):Create(getgenv().SelectBC.VehicleSeat,TweenInfo.new(mg/250,Enum.EasingStyle.Linear),{CFrame = v}):Play()
										toTarget(getgenv().SelectBC.VehicleSeat.CFrame)
										Float(true)
										NoClip = true
									else
										getgenv().SelectBC.VehicleSeat.ThrottleFloat = 0
										getgenv().SelectBC.VehicleSeat.Throttle = 0
										game:GetService("TweenService"):Create(getgenv().SelectBC.VehicleSeat,TweenInfo.new(0,Enum.EasingStyle.Linear),{CFrame = getgenv().SelectBC.VehicleSeat.CFrame}):Play()
										toTarget(getgenv().SelectBC.VehicleSeat.CFrame)
									end
								until (v.Position-getgenv().SelectBC.VehicleSeat.Position).Magnitude <= 10 or (#game.Workspace.SeaBeasts:GetChildren() ~= 0 and getgenv().AutoEventSea) or not getgenv().AutoMirage
							end

						else
							game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", "Swan")
							for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
								if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
									getgenv().SelectBC = v
								end
							end
						end	
					elseif getgenv().AutoEventSea and #game.Workspace.SeaBeasts:GetChildren() == 0 and (game.Workspace.Enemies:FindFirstChild("PirateBasic") or game.Workspace.Enemies:FindFirstChild("PirateBrigade")) then
						for i,v in pairs(game.Workspace.Enemies:GetChildren()) do
							if v.Name == "PirateBasic" or v.Name == "PirateBrigade" then
								repeat wait()
									LP.Character.Humanoid.Sit = false
									Float(true)
									NoClip = true
									if ((v.VehicleSeat.Position+Vector3.new(0,30,0))-getRoot(LP.Character).Position).magnitude <= 350 then
									   getRoot(LP.Character).CFrame = v.VehicleSeat.CFrame * CFrame.new(0, 30, 0)
		
											for i,v in pairs(LP.Backpack:GetChildren()) do
												if table.find(tt,v.ToolTip) then
													EquipWeapon(v.Name)
													if v.ToolTip == "Melee" then
														game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
														game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
														wait()
														game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
														game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
														wait()
														game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
														game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
													elseif v.ToolTip == "Blox Fruit" then
														game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
														game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
														wait()
														game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
														game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
		
														if v.Name ~= "Portal-Portal" then
															wait()
															game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
															game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
															wait()
															game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
															game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
															
														end
														wait()
														game:service('VirtualInputManager'):SendKeyEvent(true, "F", false, game)
														game:service('VirtualInputManager'):SendKeyEvent(false, "F", false, game)
													elseif v.ToolTip == "Sword" or v.ToolTip == "Gun" then
														game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
														game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
														wait()
														game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
														game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
													end
													wait(0.1)
												end
											end
								
									else
									   toTarget(v.VehicleSeat.CFrame* CFrame.new(0, 300, 0))
									end
								 until not v.Parent or not v or not v:FindFirstChild("HumanoidRootPart") or not v:FindFirstChild("Humanoid")  or not getgenv().AutoEventSea or getgenv().AutoMirage
							end
						end
					elseif getgenv().AutoEventSea then
						local NearestSeaBeast;
						local NearestDistSeaBeast = math.huge
						for i,v in pairs(game.Workspace.SeaBeasts:GetChildren()) do
							if getRoot(v) then
								if (getRoot(v).Position-getRoot(LP.Character).Position).magnitude < NearestDistSeaBeast then
									NearestSeaBeast = v
									NearestDistSeaBeast = (getRoot(v).Position-getRoot(LP.Character).Position).magnitude
								end
							end
						end
						repeat wait()
							LP.Character.Humanoid.Sit = false
							Float(true)
							NoClip = true
							if ((NearestSeaBeast.HumanoidRootPart.Position+Vector3.new(0,300,0))-getRoot(LP.Character).Position).magnitude <= 350 then
							   getRoot(LP.Character).CFrame = NearestSeaBeast.HumanoidRootPart.CFrame * CFrame.new(0, 500, 0)

									for i,v in pairs(LP.Backpack:GetChildren()) do
										if table.find(tt,v.ToolTip) then
											EquipWeapon(v.Name)
											if v.ToolTip == "Melee" then
												game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
												game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
												wait()
												game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
												game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
												wait()
												game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
												game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
											elseif v.ToolTip == "Blox Fruit" then
												game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
												game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
												wait()
												game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
												game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)

												if v.Name ~= "Portal-Portal" then
													wait()
													game:service('VirtualInputManager'):SendKeyEvent(true, "C", false, game)
													game:service('VirtualInputManager'):SendKeyEvent(false, "C", false, game)
													wait()
													game:service('VirtualInputManager'):SendKeyEvent(true, "V", false, game)
													game:service('VirtualInputManager'):SendKeyEvent(false, "V", false, game)
													
												end
												wait()
												game:service('VirtualInputManager'):SendKeyEvent(true, "F", false, game)
												game:service('VirtualInputManager'):SendKeyEvent(false, "F", false, game)
											elseif v.ToolTip == "Sword" or v.ToolTip == "Gun" then
												game:service('VirtualInputManager'):SendKeyEvent(true, "Z", false, game)
												game:service('VirtualInputManager'):SendKeyEvent(false, "Z", false, game)
												wait()
												game:service('VirtualInputManager'):SendKeyEvent(true, "X", false, game)
												game:service('VirtualInputManager'):SendKeyEvent(false, "X", false, game)
											end
											wait(0.1)
										end
									end
						
							else
							   toTarget(NearestSeaBeast.HumanoidRootPart.CFrame* CFrame.new(0, 300, 0))
							end
						 until not NearestSeaBeast.Parent or not NearestSeaBeast or not NearestSeaBeast:FindFirstChild("HumanoidRootPart") or not NearestSeaBeast:FindFirstChild("Humanoid")  or not getgenv().AutoEventSea or getgenv().AutoMirage
					end
				until not getgenv().AutoMirage
				Float(false)
				NoClip = false
			end)
		end

	end)

	IslandSec:CreateToggle("Auto Mirage2",false,function(v)
		getgenv().AutoMirage2 = v
		if v then
			spawn(function()
				

						repeat wait()
							Float(true)
							NoClip = true
							if getgenv().SelectBC ~= nil then
								spawn(function()
									for i,v in pairs(getgenv().SelectBC:GetDescendants()) do
										if v:IsA("BasePart") then
											v.CanCollide = false
										end
									end
								end)
								if game:GetService("Players").LocalPlayer.Character.Humanoid.SeatPart == getgenv().SelectBC.VehicleSeat then
									game:GetService("TweenService"):Create(getgenv().SelectBC.VehicleSeat,TweenInfo.new(0,Enum.EasingStyle.Linear),{CFrame = getgenv().SelectBC.VehicleSeat.CFrame}):Play()
									wait()
									getgenv().SelectBC.VehicleSeat.CFrame *= CFrame.Angles(0,math.random(1,10),0)
									local ray = Ray.new(getgenv().SelectBC.VehicleSeat.CFrame.p,getgenv().SelectBC.VehicleSeat.CFrame.LookVector*5000)
									local hit,pos2 = workspace:FindPartOnRay(ray,getgenv().SelectBC)
									local pos = Vector3.new(pos2.X,1.98613954,pos2,Z)
									if (pos - workspace.Camera.Part.Position).Magnitude >= 15000 then
										if hit ==  nil then
											repeat wait() 
												if game:GetService("Players").LocalPlayer.Character.Humanoid.SeatPart == getgenv().SelectBC.VehicleSeat then
													getgenv().SelectBC.VehicleSeat.CFrame = CFrame.new(getgenv().SelectBC.VehicleSeat.Position,pos)
													game:GetService("TweenService"):Create(getgenv().SelectBC.VehicleSeat,TweenInfo.new((pos-LP.Character.HumanoidRootPart.Position).Magnitude/300,Enum.EasingStyle.Linear),{CFrame = CFrame.new(pos)}):Play()
													Float(true)
													NoClip = true
												else
													game:GetService("TweenService"):Create(getgenv().SelectBC.VehicleSeat,TweenInfo.new(0,Enum.EasingStyle.Linear),{CFrame = getgenv().SelectBC.VehicleSeat.CFrame}):Play()
													toTarget(getgenv().SelectBC.VehicleSeat.CFrame)
												end
											until not getgenv().AutoMirage2 or (pos-LP.Character.HumanoidRootPart.Position).Magnitude <= 10
										end
									else
										repeat wait() 
											pos = Vector3.new(workspace.Camera.Part.Position.X,1.98613954,workspace.Camera.Part.Position.Z)
											if game:GetService("Players").LocalPlayer.Character.Humanoid.SeatPart == getgenv().SelectBC.VehicleSeat then
												getgenv().SelectBC.VehicleSeat.CFrame = CFrame.new(getgenv().SelectBC.VehicleSeat.Position,workspace.Camera.Part.Position)
												game:GetService("TweenService"):Create(getgenv().SelectBC.VehicleSeat,TweenInfo.new((pos-LP.Character.HumanoidRootPart.Position).Magnitude/300,Enum.EasingStyle.Linear),{CFrame = CFrame.new(pos)}):Play()
												Float(true)
												NoClip = true
											else
												game:GetService("TweenService"):Create(getgenv().SelectBC.VehicleSeat,TweenInfo.new(0,Enum.EasingStyle.Linear),{CFrame = getgenv().SelectBC.VehicleSeat.CFrame}):Play()
												toTarget(getgenv().SelectBC.VehicleSeat.CFrame)
											end
										until not getgenv().AutoMirage2 or (pos-LP.Character.HumanoidRootPart.Position).Magnitude <= 10
									end
								else
									game:GetService("TweenService"):Create(getgenv().SelectBC.VehicleSeat,TweenInfo.new(0,Enum.EasingStyle.Linear),{CFrame = getgenv().SelectBC.VehicleSeat.CFrame}):Play()
									toTarget(getgenv().SelectBC.VehicleSeat.CFrame)
								end
							else
								game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("BuyBoat", "Swan")
								for i,v in pairs(game:GetService("Workspace").Boats:GetChildren()) do
									if v:FindFirstChild("Owner") and v.Owner.Value == game.Players.LocalPlayer then
										getgenv().SelectBC = v
									end
								end
							end	
							until not getgenv().AutoMirage2
			

				
			end)
		end
	end)

	IslandSec:CreateToggle("Auto Farm Events At Sea",false,function(v)
		getgenv().AutoEventSea = v

	end)
end
