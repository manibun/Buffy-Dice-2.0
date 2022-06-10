require "ISUI/ISPanelJoypad"
require "ISUI/ISRichTextPanel"
require "ISUI/ISButton"
require('ISUI/ISScrollingListBox')
require "ISUI/ISPanel"

NecroDiceUI = ISPanel:derive("NecroDiceUI");
local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

--************************************************************************--
--** NecroDiceUI:initialise
--**
--************************************************************************--

function NecroDiceUI:initialise()
    ISPanelJoypad.initialise(self);
end

--************************************************************************--
--** NecroDiceUI:instantiate
--**
--************************************************************************--
local btnWid = 75
local btnHgt = FONT_HGT_SMALL + 2 * 4
local padBottom = getCore():getScreenHeight() / 1.015 - 120

dicerolling = true
local strengthy = 235
local dexterityy = 340
local constitutiony = 515
local wisdomy = 550
local rollx = 25
local background_rect_width = rollx + 549
local grey_background_rect_width = rollx + 540
local boxwidth = getCore():getScreenWidth()
function NecroDiceUI:createChildren()


    -- CREATE TUTORIAL PANEL
    local panel = ISRichTextPanel:new(-20, 10, rollx + 400, 100);
    panel:initialise();

    self:addChild(panel);
    panel:paginate();
    self.richtext = panel;
    self.richtext.text = "Roleplay Dice Menu"
    self.richtext:paginate();
    self.richtext.backgroundColor.a = 1;

    self.health = ISButton:new(rollx + 300, 100, btnWid, btnHgt, "Chat", self, NecroDiceUI.removeSelf);
    self.health.internal = "HEALTH";
    self.health:initialise();
    self.health:instantiate();
    self.health.borderColor = self.buttonBorderColor;
    self:addChild(self.health);

    --roll buttons
    if dicerolling then
        self.strength = ISButton:new(rollx + 300, strengthy, btnWid, btnHgt, "Roll", self, NecroDiceUI.removeSelf);
        self.strength.internal = "STRENGTH";
        self.strength:initialise();
        self.strength:instantiate();
        self.strength.borderColor = self.buttonBorderColor;
        self:addChild(self.strength);

        self.melee = ISButton:new(rollx + 300, strengthy + 35, btnWid, btnHgt, "Roll", self, NecroDiceUI.removeSelf);
        self.melee.internal = "MELEE";
        self.melee:initialise();
        self.melee:instantiate();
        self.melee.borderColor = self.buttonBorderColor;
        self:addChild(self.melee);

        self.toughness = ISButton:new(rollx + 300, strengthy + 70, btnWid, btnHgt, "Roll", self, NecroDiceUI.removeSelf);
        self.toughness.internal = "TOUGHNESS";
        self.toughness:initialise();
        self.toughness:instantiate();
        self.toughness.borderColor = self.buttonBorderColor;
        self:addChild(self.toughness);

        self.dexterity = ISButton:new(rollx + 300, dexterityy, btnWid, btnHgt, "Roll", self, NecroDiceUI.removeSelf);
        self.dexterity.internal = "DEXTERITY";
        self.dexterity:initialise();
        self.dexterity:instantiate();
        self.dexterity.borderColor = self.buttonBorderColor;
        self:addChild(self.dexterity);

        self.acrobatics = ISButton:new(rollx + 300, dexterityy + 35, btnWid, btnHgt, "Roll", self, NecroDiceUI.removeSelf);
        self.acrobatics.internal = "ACROBATICS";
        self.acrobatics:initialise();
        self.acrobatics:instantiate();
        self.acrobatics.borderColor = self.buttonBorderColor;
        self:addChild(self.acrobatics);

        self.escapeartist = ISButton:new(rollx + 300, dexterityy + 70, btnWid, btnHgt, "Roll", self, NecroDiceUI.removeSelf);
        self.escapeartist.internal = "ESCAPEARTIST";
        self.escapeartist:initialise();
        self.escapeartist:instantiate();
        self.escapeartist.borderColor = self.buttonBorderColor;
        self:addChild(self.escapeartist);

        self.sleightofhand = ISButton:new(rollx + 300, dexterityy + 105, btnWid, btnHgt, "Roll", self, NecroDiceUI.removeSelf);
        self.sleightofhand.internal = "SLEIGHTOFHAND";
        self.sleightofhand:initialise();
        self.sleightofhand:instantiate();
        self.sleightofhand.borderColor = self.buttonBorderColor;
        self:addChild(self.sleightofhand);

        self.stealth = ISButton:new(rollx + 300, dexterityy + 140, btnWid, btnHgt, "Roll", self, NecroDiceUI.removeSelf);
        self.stealth.internal = "STEALTH";
        self.stealth:initialise();
        self.stealth:instantiate();
        self.stealth.borderColor = self.buttonBorderColor;
        self:addChild(self.stealth);

        self.wisdom = ISButton:new(rollx + 300, wisdomy, btnWid, btnHgt, "Roll", self, NecroDiceUI.removeSelf);
        self.wisdom.internal = "WISDOM";
        self.wisdom:initialise();
        self.wisdom:instantiate();
        self.wisdom.borderColor = self.buttonBorderColor;
        self:addChild(self.wisdom);

        self.animalhandling = ISButton:new(rollx + 300, wisdomy + 35, btnWid, btnHgt, "Roll", self, NecroDiceUI.removeSelf);
        self.animalhandling.internal = "ANIMALHANDLING";
        self.animalhandling:initialise();
        self.animalhandling:instantiate();
        self.animalhandling.borderColor = self.buttonBorderColor;
        self:addChild(self.animalhandling);

        self.medicine = ISButton:new(rollx + 300, wisdomy + 70, btnWid, btnHgt, "Roll", self, NecroDiceUI.removeSelf);
        self.medicine.internal = "MEDICINE";
        self.medicine:initialise();
        self.medicine:instantiate();
        self.medicine.borderColor = self.buttonBorderColor;
        self:addChild(self.medicine);

        self.insight = ISButton:new(rollx + 300, wisdomy + 105, btnWid, btnHgt, "Roll", self, NecroDiceUI.removeSelf);
        self.insight.internal = "INSIGHT";
        self.insight:initialise();
        self.insight:instantiate();
        self.insight.borderColor = self.buttonBorderColor;
        self:addChild(self.insight);

        self.perception = ISButton:new(rollx + 300, wisdomy + 140, btnWid, btnHgt, "Roll", self, NecroDiceUI.removeSelf);
        self.perception.internal = "PERCEPTION";
        self.perception:initialise();
        self.perception:instantiate();
        self.perception.borderColor = self.buttonBorderColor;
        self:addChild(self.perception);

        self.survival = ISButton:new(rollx + 300, wisdomy + 175, btnWid, btnHgt, "Roll", self, NecroDiceUI.removeSelf);
        self.survival.internal = "SURVIVAL";
        self.survival:initialise();
        self.survival:instantiate();
        self.survival.borderColor = self.buttonBorderColor;
        self:addChild(self.survival);
    else
        self.strength = ISButton:new(rollx + 300, strengthy, btnWid, btnHgt, "+", self, NecroDiceUI.removeSelf);
        self.strength.internal = "STRENGTH";
        self.strength:initialise();
        self.strength:instantiate();
        self.strength.borderColor = self.buttonBorderColor;
        self:addChild(self.strength);

        self.melee = ISButton:new(rollx + 300, strengthy + 35, btnWid, btnHgt, "+", self, NecroDiceUI.removeSelf);
        self.melee.internal = "MELEE";
        self.melee:initialise();
        self.melee:instantiate();
        self.melee.borderColor = self.buttonBorderColor;
        self:addChild(self.melee);

        self.toughness = ISButton:new(rollx + 300, strengthy + 70, btnWid, btnHgt, "+", self, NecroDiceUI.removeSelf);
        self.toughness.internal = "TOUGHNESS";
        self.toughness:initialise();
        self.toughness:instantiate();
        self.toughness.borderColor = self.buttonBorderColor;
        self:addChild(self.toughness);

        self.dexterity = ISButton:new(rollx + 300, dexterityy, btnWid, btnHgt, "+", self, NecroDiceUI.removeSelf);
        self.dexterity.internal = "DEXTERITY";
        self.dexterity:initialise();
        self.dexterity:instantiate();
        self.dexterity.borderColor = self.buttonBorderColor;
        self:addChild(self.dexterity);

        self.acrobatics = ISButton:new(rollx + 300, dexterityy + 35, btnWid, btnHgt, "+", self, NecroDiceUI.removeSelf);
        self.acrobatics.internal = "ACROBATICS";
        self.acrobatics:initialise();
        self.acrobatics:instantiate();
        self.acrobatics.borderColor = self.buttonBorderColor;
        self:addChild(self.acrobatics);

        self.escapeartist = ISButton:new(rollx + 300, dexterityy + 70, btnWid, btnHgt, "+", self, NecroDiceUI.removeSelf);
        self.escapeartist.internal = "ESCAPEARTIST";
        self.escapeartist:initialise();
        self.escapeartist:instantiate();
        self.escapeartist.borderColor = self.buttonBorderColor;
        self:addChild(self.escapeartist);

        self.sleightofhand = ISButton:new(rollx + 300, dexterityy + 105, btnWid, btnHgt, "+", self, NecroDiceUI.removeSelf);
        self.sleightofhand.internal = "SLEIGHTOFHAND";
        self.sleightofhand:initialise();
        self.sleightofhand:instantiate();
        self.sleightofhand.borderColor = self.buttonBorderColor;
        self:addChild(self.sleightofhand);

        self.stealth = ISButton:new(rollx + 300, dexterityy + 140, btnWid, btnHgt, "+", self, NecroDiceUI.removeSelf);
        self.stealth.internal = "STEALTH";
        self.stealth:initialise();
        self.stealth:instantiate();
        self.stealth.borderColor = self.buttonBorderColor;
        self:addChild(self.stealth);

        self.wisdom = ISButton:new(rollx + 300, wisdomy, btnWid, btnHgt, "+", self, NecroDiceUI.removeSelf);
        self.wisdom.internal = "WISDOM";
        self.wisdom:initialise();
        self.wisdom:instantiate();
        self.wisdom.borderColor = self.buttonBorderColor;
        self:addChild(self.wisdom);

        self.animalhandling = ISButton:new(rollx + 300, wisdomy + 35, btnWid, btnHgt, "+", self, NecroDiceUI.removeSelf);
        self.animalhandling.internal = "ANIMALHANDLING";
        self.animalhandling:initialise();
        self.animalhandling:instantiate();
        self.animalhandling.borderColor = self.buttonBorderColor;
        self:addChild(self.animalhandling);

        self.medicine = ISButton:new(rollx + 300, wisdomy + 70, btnWid, btnHgt, "+", self, NecroDiceUI.removeSelf);
        self.medicine.internal = "MEDICINE";
        self.medicine:initialise();
        self.medicine:instantiate();
        self.medicine.borderColor = self.buttonBorderColor;
        self:addChild(self.medicine);

        self.insight = ISButton:new(rollx + 300, wisdomy + 105, btnWid, btnHgt, "+", self, NecroDiceUI.removeSelf);
        self.insight.internal = "INSIGHT";
        self.insight:initialise();
        self.insight:instantiate();
        self.insight.borderColor = self.buttonBorderColor;
        self:addChild(self.insight);

        self.perception = ISButton:new(rollx + 300, wisdomy + 140, btnWid, btnHgt, "+", self, NecroDiceUI.removeSelf);
        self.perception.internal = "PERCEPTION";
        self.perception:initialise();
        self.perception:instantiate();
        self.perception.borderColor = self.buttonBorderColor;
        self:addChild(self.perception);

        self.survival = ISButton:new(rollx + 300, wisdomy + 175, btnWid, btnHgt, "+", self, NecroDiceUI.removeSelf);
        self.survival.internal = "SURVIVAL";
        self.survival:initialise();
        self.survival:instantiate();
        self.survival.borderColor = self.buttonBorderColor;
        self:addChild(self.survival);
    end



    self.cancel = ISButton:new(300, 17, btnWid, btnHgt, "Close", self, NecroDiceUI.removeSelf);
    self.cancel.internal = "CANCEL";
    self.cancel:initialise();
    self.cancel:instantiate();
    self.cancel.borderColor = self.buttonBorderColor;
    self:addChild(self.cancel);

    self.togglerolling = ISButton:new(350, 17, btnWid, btnHgt, "Toggle Rolling", self, NecroDiceUI.onMouseDown);
    self.togglerolling.internal = "TOGGLEROLLING";
    self.togglerolling:initialise();
    self.togglerolling:instantiate();
    self.togglerolling.borderColor = self.buttonBorderColor;
    self:addChild(self.togglerolling);

end

function NecroDiceUI:prerender()

    self:drawRect(0, 0, 500, 800, 0.95, 0.05, 0.05, 0.05) --main window

    self:drawRect(10, 100, grey_background_rect_width / 1.45, 30, 0.45, 0.25, 0.25, 0.25) --health points
    self:drawRect(10, 140, grey_background_rect_width / 1.45, 30, 0.45, 0.25, 0.25, 0.25) --armor class

    self:drawRect(rollx - 20, strengthy, background_rect_width / 1.45, 30, 0.45, 0.25, 0.25, 0.25) --strength

    self:drawRect(rollx, strengthy + 35, grey_background_rect_width / 1.5, 30, 0.05, 0.25, 0.25, 0.25)

    self:drawRect(rollx, strengthy + 70, grey_background_rect_width / 1.5, 30, 0.15, 0.25, 0.25, 0.25)

    self:drawRect(rollx - 20, dexterityy, background_rect_width / 1.45, 30, 0.45, 0.25, 0.25, 0.25) --dex

    self:drawRect(rollx, dexterityy + 35, grey_background_rect_width / 1.5, 30, 0.05, 0.25, 0.25, 0.25)

    self:drawRect(rollx, dexterityy + 70, grey_background_rect_width / 1.5, 30, 0.15, 0.25, 0.25, 0.25)
    self:drawRect(rollx, dexterityy + 105, grey_background_rect_width / 1.5, 30, 0.05, 0.25, 0.25, 0.25)
    self:drawRect(rollx, dexterityy + 140, grey_background_rect_width / 1.5, 30, 0.15, 0.25, 0.25, 0.25)

    self:drawRect(rollx - 20, constitutiony, background_rect_width / 1.45, 30, 0.45, 0.25, 0.25, 0.25) --con

    self:drawRect(rollx - 20, wisdomy, background_rect_width / 1.45, 30, 0.45, 0.25, 0.25, 0.25) --wis

    self:drawRect(rollx, wisdomy + 35, grey_background_rect_width / 1.5, 30, 0.05, 0.25, 0.25, 0.25)

    self:drawRect(rollx, wisdomy + 70, grey_background_rect_width / 1.5, 30, 0.15, 0.25, 0.25, 0.25)
    self:drawRect(rollx, wisdomy + 105, grey_background_rect_width / 1.5, 30, 0.05, 0.25, 0.25, 0.25)
    self:drawRect(rollx, wisdomy + 140, grey_background_rect_width / 1.5, 30, 0.15, 0.25, 0.25, 0.25)


end

local healthmin = tostring(0)
local healthmax = tostring(9)
local armorclass = tostring(12)
local strengthValue = tostring(1)
local strengthModifier = "+" .. tostring(1)
local athleticsValue = tostring(1)
local athleticsModifier = "+" .. tostring(1)
local defenseValue = tostring(1)
local defenseModifier = "+" .. tostring(1)
local dexterityValue = tostring(1)
local dexterityModifier = "+" .. tostring(1)
local accuracyValue = tostring(1)
local accuracyModifier = "+" .. tostring(1)
local sleightofhandValue = tostring(1)
local sleightofhandModifier = "+" .. tostring(1)
local lockpickingValue = tostring(1)
local lockpickingModifier = "+" .. tostring(1)
local stealthValue = tostring(1)
local stealthModifier = "+" .. tostring(1)
local constitutionValue = tostring(1)
local constitutionModifier = "+" .. tostring(1)
local wisdomValue = tostring(1)
local wisdomModifier = "+" .. tostring(1)
local animalhandlingValue = tostring(1)
local animalhandlingModifier = "+" .. tostring(1)
local medicineValue = tostring(1)
local medicineModifier = "+" .. tostring(1)
local insightValue = tostring(1)
local insightModifier = "+" .. tostring(1)
local perceptionValue = tostring(1)
local perceptionModifier = "+" .. tostring(1)
local survivalValue = tostring(1)
local survivalModifier = "+" .. tostring(1)

function NecroDiceUI:render()
    self:drawText("Stats", 20, 60, 1, 1, 1, 1, UIFont.Large)
    self:drawTexture(getTexture("media/ui/XpSystemUI/SkillBarSeparator.png"), 5, 95,1,1,1,1)
    self:drawText("Health Points", 25, 100, 1, 1, 1, 1, UIFont.Medium)
    self:drawText(healthmin.."/"..healthmax, rollx + 238, 100, 1, 1, 1, 1, UIFont.Small) --value
    self:drawText("Armor Class", 25, 140, 1, 1, 1, 1, UIFont.Medium)
    self:drawText(armorclass, rollx + 238, 140, 1, 1, 1, 1, UIFont.Small) --value

    self:drawText("Attributes & Skills", 20, 180, 1, 1, 1, 1, UIFont.Large)
    self:drawTexture(getTexture("media/ui/XpSystemUI/SkillBarSeparator.png"), 5, 215,1,1,1,1)
    self:drawText("Strength", rollx, strengthy, 1, 1, 1, 1, UIFont.Medium)

    self:drawText("Athletics", rollx + 25, strengthy + 38, 1, 1, 1, 1, UIFont.Small)
    self:drawText("Defense", rollx + 25, strengthy + 71, 1, 1, 1, 1, UIFont.Small)
    -- self:drawText("Toughness", rollx + 25, strengthy + 108, 1, 1, 1, 1, UIFont.Small)
    -- self:drawText("Evasion", rollx + 25, strengthy + 143, 1, 1, 1, 1, UIFont.Small)

    --attributes values
    self:drawText(strengthValue, rollx + 238, strengthy + 3, 1, 1, 1, 1, UIFont.Small) --value
    self:drawText(strengthModifier, rollx + 268, strengthy + 3, 1, 1, 1, 1, UIFont.Small) --modifier

    self:drawText(athleticsValue, rollx + 238, strengthy + 38, 1, 1, 1, 1, UIFont.Small) --value
    self:drawText(athleticsModifier, rollx + 268, strengthy + 38, 1, 1, 1, 1, UIFont.Small) --modifier

    self:drawText(defenseValue, rollx + 238, strengthy + 71, 1, 1, 1, 1, UIFont.Small) --value
    self:drawText(defenseModifier, rollx + 268, strengthy + 71, 1, 1, 1, 1, UIFont.Small) --modifier

    self:drawText("Dexterity", rollx, dexterityy, 1, 1, 1, 1, UIFont.Medium)

    self:drawText("Ranged Accuracy", rollx + 25, dexterityy + 38, 1, 1, 1, 1, UIFont.Small)
    self:drawText("Sleight of Hand", rollx + 25, dexterityy + 71, 1, 1, 1, 1, UIFont.Small)
    self:drawText("Lockpicking", rollx + 25, dexterityy + 108, 1, 1, 1, 1, UIFont.Small)
    self:drawText("Stealth", rollx + 25, dexterityy + 143, 1, 1, 1, 1, UIFont.Small)

    --attributes values
    self:drawText(dexterityValue, rollx + 238, dexterityy + 3, 1, 1, 1, 1, UIFont.Small) --value
    self:drawText(dexterityModifier, rollx + 268, dexterityy + 3, 1, 1, 1, 1, UIFont.Small) --modifier

    self:drawText(accuracyValue, rollx + 238, dexterityy + 38, 1, 1, 1, 1, UIFont.Small) --value
    self:drawText(accuracyModifier, rollx + 268, dexterityy + 38, 1, 1, 1, 1, UIFont.Small) --modifier

    self:drawText(sleightofhandValue, rollx + 238, dexterityy + 71, 1, 1, 1, 1, UIFont.Small) --value
    self:drawText(sleightofhandModifier, rollx + 268, dexterityy + 71, 1, 1, 1, 1, UIFont.Small) --modifier

    self:drawText(lockpickingValue, rollx + 238, dexterityy + 108, 1, 1, 1, 1, UIFont.Small) --value
    self:drawText(lockpickingModifier, rollx + 268, dexterityy + 108, 1, 1, 1, 1, UIFont.Small) --modifier

    self:drawText(stealthValue, rollx + 238, dexterityy + 143, 1, 1, 1, 1, UIFont.Small) --value
    self:drawText(stealthModifier, rollx + 268, dexterityy + 143, 1, 1, 1, 1, UIFont.Small) --modifier

    --attributes text
    --self:drawTexture(getTexture("media/ui/XpSystemUI/SkillBarSeparator.png"), rollx - 30, constitutiony - 10,1,1,1,1)
    self:drawText("Constitution", rollx, constitutiony, 1, 1, 1, 1, UIFont.Medium)

    --attributes values
    self:drawText(constitutionValue, rollx + 238, constitutiony + 3, 1, 1, 1, 1, UIFont.Small) --value
    self:drawText(constitutionModifier, rollx + 268, constitutiony + 3, 1, 1, 1, 1, UIFont.Small) --modifier

    --attributes text
    --self:drawTexture(getTexture("media/ui/XpSystemUI/SkillBarSeparator.png"), rollx - 30, wisdomy - 10,1,1,1,1)
    self:drawText("Wisdom", rollx, wisdomy, 1, 1, 1, 1, UIFont.Medium)

    self:drawText("Animal Handling", rollx + 25, wisdomy + 38, 1, 1, 1, 1, UIFont.Small)
    self:drawText("Medicine", rollx + 25, wisdomy + 71, 1, 1, 1, 1, UIFont.Small)
    self:drawText("Insight", rollx + 25, wisdomy + 108, 1, 1, 1, 1, UIFont.Small)
    self:drawText("Perception", rollx + 25, wisdomy + 143, 1, 1, 1, 1, UIFont.Small)
    self:drawText("Survival", rollx + 25, wisdomy + 176, 1, 1, 1, 1, UIFont.Small)

    --attributes values
    self:drawText(wisdomValue, rollx + 238, wisdomy + 3, 1, 1, 1, 1, UIFont.Small) --value
    self:drawText(wisdomModifier, rollx + 268, wisdomy + 3, 1, 1, 1, 1, UIFont.Small) --modifier

    self:drawText(animalhandlingValue, rollx + 238, wisdomy + 38, 1, 1, 1, 1, UIFont.Small) --value
    self:drawText(animalhandlingModifier, rollx + 268, wisdomy + 38, 1, 1, 1, 1, UIFont.Small) --modifier

    self:drawText(medicineValue, rollx + 238, wisdomy + 71, 1, 1, 1, 1, UIFont.Small) --value
    self:drawText(medicineModifier, rollx + 268, wisdomy + 71, 1, 1, 1, 1, UIFont.Small) --modifier

    self:drawText(insightValue, rollx + 238, wisdomy + 108, 1, 1, 1, 1, UIFont.Small) --value
    self:drawText(insightModifier, rollx + 268, wisdomy + 108, 1, 1, 1, 1, UIFont.Small) --modifier

    self:drawText(perceptionValue, rollx + 238, wisdomy + 143, 1, 1, 1, 1, UIFont.Small) --value
    self:drawText(perceptionModifier, rollx + 268, wisdomy + 143, 1, 1, 1, 1, UIFont.Small) --modifier

    self:drawText(survivalValue, rollx + 238, wisdomy + 176, 1, 1, 1, 1, UIFont.Small) --value
    self:drawText(survivalModifier, rollx + 268, wisdomy + 176, 1, 1, 1, 1, UIFont.Small) --modifier

    --self:refresh()
end

function NecroDiceUI:setInfo(item)

end

--************************************************************************--
--** NecroDiceUI:onMouseDown
--**
--************************************************************************--

function NecroDiceUI:onMouseMove(dx, dy)
	self.mouseOver = true
	if self.moving then
		self:setX(self.x + dx)
		self:setY(self.y + dy)
		self:bringToTop()
	end
end

function NecroDiceUI:onMouseDown(button, x, y)
    if button.internal == "TOGGLEROLLING" then
        if dicerolling then
            dicerolling = false
        else
            dicerolling = true
        end
        openDiceUI()
    end
    --self:refresh()
    if not self:getIsVisible() then
		return
	end
	self.downX = x
	self.downY = y
	self.moving = true
	self:bringToTop()
end

function NecroDiceUI:onMouseDownOutside(dx, dy)
    self.mouseOver = false
	if self.moving then
		self:setX(self.x + dx)
		self:setY(self.y + dy)
		self:bringToTop()
	end
end

function NecroDiceUI:onMouseUp(x, y)
	if not self:getIsVisible() then
		return;
	end
	self.moving = false
	if ISMouseDrag.tabPanel then
		ISMouseDrag.tabPanel:onMouseUp(x,y)
	end
	ISMouseDrag.dragView = nil
end

function NecroDiceUI:onMouseUpOutside(x, y)
	if not self:getIsVisible() then
		return
	end
	self.moving = false
	ISMouseDrag.dragView = nil
end
--[[
function NecroDiceUI:onJoypadDown(button, joypadData)
    self:removeSelf()
    joypadData.focus = nil
    joypadData.lastfocus = nil
end
--]]

function NecroDiceUI:removeSelf(button)
    print(tostring(button.internal))
    NecroDiceUI.instance = nil;
    self:removeFromUIManager()
end

--[[
function NecroDiceUI.OnJoypadActivate(id)
    if NecroDiceUI.instance and not NecroDiceUI.instance.joyfocus then
        NecroDiceUI.instance:removeSelf()
    end
end
--]]

NecroDiceUI.getInstance = function()
    if NecroDiceUI.instance ~= nil then
        return NecroDiceUI.instance;
    end;
    local x = 500
    local y = 800
    --x = x - (333 / 2);
    --y = y - 70;
    NecroDiceUI.instance = NecroDiceUI:new(75, 50, x, y);
    NecroDiceUI.instance:initialise();
    NecroDiceUI.instance:addToUIManager();
    local joypadData = JoypadState.getMainMenuJoypad()
    if joypadData then
        if not joypadData.player then
            JoypadState.forceActivate = joypadData.id
            JoypadState.onGameStart()
        end
        joypadData.focus = NecroDiceUI.instance
        updateJoypadFocus(joypadData)
    end
   -- SurvivalGuideManager.instance.panel:setVisible(false);
    return NecroDiceUI.instance;
end

--************************************************************************--
--** NecroDiceUI:new
--**
--************************************************************************--
function NecroDiceUI:new (x, y, width, height)
    --local o = {}
    --o.data = {}
    width = 800
    height = 800
    local o = ISPanelJoypad:new(0, 0, width, height);
    setmetatable(o, self)
    self.__index = self
    o.x = x;
    o.y = y;
    o.borderColor = {r=1, g=1, b=1, a=0.7};
    o.backgroundColor = {r=0.10, g=0.10, b=0.10, a=1};
    o.buttonBorderColor = {r=0.7, g=0.7, b=0.7, a=0.5};
    o.width = width;
    o.height = height;
    o.anchorLeft = false;
    o.anchorRight = true;
    o.anchorTop = true;
    o.anchorBottom = false;
    o.timer = 0;
    o.titlebarbkg = getTexture("media/ui/Panel_TitleBar.png");
    return o
end

local function openDiceUI()
    if getCore():getGameMode() == "Tutorial" then return end
    NecroDiceUI.getInstance();
end
local function onCustomUIKeyPressed(key)
    if key == 21 then
        --self:removeSelf()
        openDiceUI()
    end
end

--Events.OnGameStart.Add(openDiceUI);
Events.OnCustomUIKeyPressed.Add(onCustomUIKeyPressed)





