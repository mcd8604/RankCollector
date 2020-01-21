local L = LibStub("AceLocale-3.0"):GetLocale("RankCollector", true)

local options = {
	type = "group",
	name = L["RankCollector Options"],
	args = {}
}

options.args["minimapButton"] = {
	order = 0,
	type = "toggle",
	name = L["Hide Minimap Button"],
	desc = L["Use \'/hs show\' to bring RankCollector window, if hidden. Will Reload UI on change."],
	get = function() return RankCollector.db.factionrealm.minimapButton.hide end,
	set = function(info, v) RankCollector.db.factionrealm.minimapButton.hide = v; ReloadUI() end,
}
options.args["minimapButtonDesc"] = {
	order = 1,
	type = "description",
	name = L["Use \'/hs show\' to bring RankCollector window, if hidden. Will Reload UI on change."] .. '\n\n'
}

options.args["sep1"] = {
	order = 2,
	type = "description",
	name = "\n"
}

options.args["sep1"] = {
	order = 3,
	type = "description",
	name = "\n"
}

options.args["export"] = {
	order = 4,
	type = "execute",
	name = L["Export to CSV"],
	desc = L["Show window with current data in CSV format"],
	func = function() RankCollector:ExportCSV() end,
}
options.args["purge_data"] = {
	order = 5,
	type = "execute",
	name = L["_ purge all data"],
	desc = L["Delete all collected data"],
	confirm = true,
	confirmText = L["Delete all collected data"] .. '?',
	func = function() RankCollector:ResetWeek() end,
}

LibStub("AceConfig-3.0"):RegisterOptionsTable("RankCollector-options", options)
LibStub("AceConfigDialog-3.0"):AddToBlizOptions("RankCollector-options", "RankCollector")