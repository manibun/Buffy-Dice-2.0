
local BuffyDiceUI = ISPanel:derive("BuffyDiceUI")

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)
local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)
local FONT_HGT_LARGE = getTextManager():getFontHeight(UIFont.Large)
local FONT_SCALE = FONT_HGT_SMALL / 14


local function LoadListings(module, command, arguments)
  if module == "BuffyDice" and command == "load" then
    Events.OnServerCommand.Remove(LoadListings)
    local view = BuffyDiceUI.instance.tabPanel:getView("Dice")
    for i,v in ipairs(arguments.Stats) do
      view.statsList:addItem(v, nil).isPrimary = true
    end

    for k,v in pairs(arguments.Attributes) do
      view.attributeList:addItem(k, nil).isPrimary = true
      for i,v in ipairs(v) do
        view.attributeList:addItem(v, nil)
      end
    end

  end
end

local function OnTick()
  Events.OnTick.Remove(OnTick)
  Events.OnServerCommand.Add(LoadListings)
  sendClientCommand("BuffyDice", "load", nil)
end

function BuffyDiceUI:createChildren()
  local btnWid = 125 * FONT_SCALE
  local btnHgt = FONT_HGT_SMALL + 5 * 2 * FONT_SCALE
  local padBottom = 10 * FONT_SCALE

  self.tabPanel = ISTabPanel:new(0, 0, self.width, self.height - padBottom - btnHgt - padBottom)
  self.tabPanel:initialise()
  self.tabPanel.tabFont = UIFont.Medium
  self.tabPanel.tabHeight = FONT_HGT_MEDIUM + 6
  self.tabPanel.render = self.tabPanelRender
  self.tabPanel.addView = self.addView
  self:addChild(self.tabPanel)

  local test = ISPanel:new(1, 0, self.tabPanel.width - 2, self.tabPanel.height - self.tabPanel.tabHeight)
  test.background = false
  test:initialise()
  test.onMouseDown = self.clickThroughDown
  test.onMouseUp = self.clickThroughUp
  test.render = function(self)
    self:drawText("Stats", 2 * FONT_SCALE, 2 * FONT_SCALE, 1,1,1,1, UIFont.Small)

    self:drawText("Attributes", 2 * FONT_SCALE, self.statsList:getBottom() + 10 * FONT_SCALE, 1,1,1,1, UIFont.Small)
  end
  self.tabPanel:addView("Dice", test)

  local y = FONT_HGT_SMALL + 4 * FONT_SCALE
  local height = 4 * (FONT_HGT_MEDIUM + 7 * FONT_SCALE * 2)
  test.statsList = ISScrollingListBox:new(0, y, test.width, height)
  test.statsList.itemheight = FONT_HGT_MEDIUM + 7 * FONT_SCALE * 2
  test.statsList.font = UIFont.Medium
  test.statsList:initialise()
  test.statsList.doDrawItem = self.doDrawItem
  test:addChild(test.statsList)

  y = y + height + 10 * FONT_SCALE + FONT_HGT_SMALL + 2 * FONT_SCALE
  height = test.height - y
  test.attributeList = ISScrollingListBox:new(0, y, test.width, height)
  test.attributeList.itemheight = FONT_HGT_MEDIUM + 7 * FONT_SCALE * 2
  test.attributeList.font = UIFont.Medium
  test.attributeList:initialise()
  test.attributeList.doDrawItem = self.doDrawItem
  test:addChild(test.attributeList)

  self.tabPanel:addView("Abilities", test)
  self.tabPanel:activateView("Dice")
  Events.OnTick.Add(OnTick)

  self.cancelButton = ISButton:new(self.width - padBottom - btnWid, self.height - padBottom - btnHgt, btnWid, btnHgt, getText("UI_btn_close"), self, BuffyDiceUI.onOptionMouseDown)
  self.cancelButton.internal = "CANCEL"
  self.cancelButton:initialise()
  self.cancelButton:instantiate()
  self:addChild(self.cancelButton)
end

function BuffyDiceUI:doDrawItem(y, item, alt)
  if item.isPrimary then
    self:drawRect(0, y + 1, self.width, item.height - 2, 0.5, 0.4, 0.35, 0.27)
    self:drawText(item.text, 10 * FONT_SCALE, y + 7 * FONT_SCALE, 0.7, 0.7, 0.7, 1.0, self.font)
  else
    self:drawRect(10, y + 1, self.width - 10, item.height - 2, 0.5, self.borderColor.r, self.borderColor.g, self.borderColor.b)
    self:drawText(item.text, 20 * FONT_SCALE, y + 7 * FONT_SCALE, 0.7, 0.7, 0.7, 1.0, self.font)
  end

  y = y + item.height
  return y
end

function BuffyDiceUI:clickThroughDown() -- click through so we can drag intended for tab views
  self.parent.parent:onMouseDown(x, y)
end

function BuffyDiceUI:clickThroughUp() -- click through so we can drag intended for tab views
  self.parent.parent:onMouseUp(x, y)
end

function BuffyDiceUI:onOptionMouseDown(button, x, y)
  if button.internal == "CANCEL" then
    self:setVisible(false)
  end
end

function BuffyDiceUI:tabPanelRender()
  local inset = 1 -- assumes a 1-pixel window border on the left to avoid

  local x = inset + self.scrollX
  local widthOfAllTabs = self:getWidthOfAllTabs()
  local overflowLeft = self.scrollX < 0
  local overflowRight = x + widthOfAllTabs > self.width
  if widthOfAllTabs > self.width then
    self:setStencilRect(0, 0, self.width, self.tabHeight)
  end
  for i, viewObject in ipairs(self.viewList) do
    local tabWidth = self.equalTabWidth and self.maxLength or viewObject.tabWidth
    -- if this tab is the active one, we make the tab btn lighter
    if viewObject == self.activeView then
      self:drawRect(x, 0, tabWidth, self.tabHeight, 1, 0.4, 0.4, 0.4)
    else
      self:drawRect(x + tabWidth, 0, 1, self.tabHeight, 1, 0.4, 0.4, 0.4)
      if self:getMouseY() >= 0 and self:getMouseY() < self.tabHeight and self:isMouseOver() and self:getTabIndexAtX(self:getMouseX()) == i then
        viewObject.fade:setFadeIn(true)
      else
        viewObject.fade:setFadeIn(false)
      end
      viewObject.fade:update()
      self:drawRect(x, 0, tabWidth, self.tabHeight, 0.2 * viewObject.fade:fraction(), 1, 1, 1)
    end
    self:drawTextCentre(viewObject.name, x + (tabWidth / 2), 3, 1, 1, 1, 1, self.tabFont)
    x = x + tabWidth
  end
  self:drawRect(0, self.tabHeight-1, self.width, 1, 1, 0.4, 0.4, 0.4)
  local butPadX = 3
  if overflowLeft then
    local tex = getTexture("media/ui/ArrowLeft.png")
    local butWid = tex:getWidthOrig() + butPadX * 2
    self:drawRect(inset, 0, butWid, self.tabHeight-1, 1, 0, 0, 0)
    self:drawRectBorder(inset, -1, butWid, self.tabHeight+1, 1, 0.4, 0.4, 0.4)
    self:drawTexture(tex, inset + butPadX, (self.tabHeight - tex:getHeightOrig()) / 2, 1, 1, 1, 1)
  end
  if overflowRight then
    local tex = getTexture("media/ui/ArrowRight.png")
    local butWid = tex:getWidthOrig() + butPadX * 2
    self:drawRect(self.width - inset - butWid, 0, butWid, self.tabHeight-1, 1, 0, 0, 0)
    self:drawRectBorder(self.width - inset - butWid, -1, butWid, self.tabHeight+1, 1, 0.4, 0.4, 0.4)
    self:drawTexture(tex, self.width - butWid + butPadX, (self.tabHeight - tex:getHeightOrig()) / 2, 1, 1, 1, 1)
  end
  if widthOfAllTabs > self.width then
    self:clearStencilRect()
  end
  --self:drawRect(0, self.height, self.width, 1, 1, 0.4, 0.4, 0.4)
end

function BuffyDiceUI:addView(name, view)
	local viewObject = {};
	viewObject.name = name;
	viewObject.view = view;
	viewObject.tabWidth = getTextManager():MeasureStringX(self.tabFont, name) + self.tabPadX;
	viewObject.fade = UITransition.new()
	table.insert(self.viewList, viewObject);
	-- the view have to be under our tab
	view:setY(self.tabHeight);
--	view:initialise();
	self:addChild(view);
	view.parent = self;
	-- the 1st view will be default visible
	if #self.viewList == 1 then
		view:setVisible(true);
		self.activeView = viewObject;
		self.maxLength = viewObject.tabWidth;
	else
		view:setVisible(false);
		if viewObject.tabWidth > self.maxLength then
			self.maxLength = viewObject.tabWidth;
		end
	end
end

function BuffyDiceUI:new(x, y, width, height)
  local o = ISPanel:new(x, y, width, height)
  setmetatable(o, self)
  self.__index = self
  o.variableColor = {r = 0.9, g = 0.55, b = 0.1, a = 1}
  o.borderColor = {r = 0.4, g = 0.4, b = 0.4, a = 1}
  o.backgroundColor = {r = 0, g = 0, b = 0, a = 0.8}
  o.buttonBorderColor = {r = 0.7, g = 0.7, b = 0.7, a = 0.5}
  o.moveWithMouse = true
  BuffyDiceUI.instance = o
  return o
end

if isClient() then
  local oldISPlayerDataObject_createInventoryInterface = ISPlayerDataObject.createInventoryInterface
  function ISPlayerDataObject:createInventoryInterface()
    oldISPlayerDataObject_createInventoryInterface(self)

    self.buffyDice = ISButton:new(self.safetyUI:getAbsoluteX(), self.safetyUI:getBottom() + 10, self.safetyUI.width, self.safetyUI.height, nil, nil, nil)
    self.buffyDice:forceImageSize(40, 40)
    self.buffyDice:setImage(getTexture("media/ui/Dice_Off.png"))
    self.buffyDice:setDisplayBackground(false)
    self.buffyDice:initialise()
    self.buffyDice:addToUIManager()
  end
end

return BuffyDiceUI
