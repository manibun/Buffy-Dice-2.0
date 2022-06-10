
if not isServer() then return end

local BuffyDiceSkills
local BuffyDiceAbilities

local function OnInitGlobalModData(isNewGame)
  -- Loading skill config
	local fileReader = getFileReader("BuffyDiceSkills.ini", true)
	local lines = {}
	local line = fileReader:readLine()
	while line do
		table.insert(lines, line)
		line = fileReader:readLine()
	end
  fileReader:close()
	BuffyDiceSkills = loadstring(table.concat(lines))() or {}

  -- Loading ability config
  fileReader = getFileReader("BuffyDiceAbilities.ini", true)
  lines = {}
  line = fileReader:readLine()
  while line do
		table.insert(lines, line)
		line = fileReader:readLine()
	end
  fileReader:close()
	BuffyDiceAbilities = loadstring(table.concat(lines))() or {}
end

local function OnClientCommand(module, command, player, args)
	if module == "BuffyDice" then
		if command == "load" then
			sendServerCommand(player, module, command, BuffyDiceSkills)
		end
	end
end

Events.OnClientCommand.Add(OnClientCommand)
Events.OnInitGlobalModData.Add(OnInitGlobalModData)
