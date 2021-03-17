Logo = {}

function Logo:init()
	obj = {}
	obj['Q'] = {
		"  █████  ",
		"▒██▓  ██▒",
		"▒██▒  ██░",
		"░██  █▀ ░",
		"░▒███▒█▄ ",
		"░░ ▒▒░ ▒ ",
		" ░ ▒░  ░ ",
		"   ░   ░ ",
		"    ░    "
	}

	obj['S'] = {
		"  ██████ ",
		"▒██    ▒ ",
		"░ ▓██▄   ",
		"  ▒   ██▒",
		"▒██████▒▒",
		"▒ ▒▓▒ ▒ ░",
		"░ ░▒  ░ ░",
		"░  ░  ░  ",
		"      ░  "
	}

	obj['H'] = {
		" ██░ ██ ",
		"▓██░ ██▒",
		"▒██▀▀██░",
		"░▓█ ░██ ",
		"░▓█▒░██▓",
		" ▒ ░░▒░▒",
		" ▒ ░▒░ ░",
		" ░  ░░ ░",
		" ░  ░  ░"
	}

	obj['O'] = {
		" ▒█████  ",
		"▒██▒  ██▒",
		"▒██░  ██▒",
		"▒██   ██░",
		"░ ████▓▒░",
		"░ ▒░▒░▒░ ",
		"  ░ ▒ ▒░ ",
		"░ ░ ░ ▒  ",
		"    ░ ░  "       
	}

	obj['P'] = {
		" ██▓███  ",
		"▓██░  ██▒",
		"▓██░ ██▓▒",
		"▒██▄█▓▒ ▒",
		"▒██▒ ░  ░",
		"▒▓▒░ ░  ░",
		"░▒ ░     ",
		"░░       "         
	}

	function obj:getChar(char)
		return obj[char]
	end

	function obj:getCharCaption(char)
		local caption = ""
		for _, line in pairs(self:getChar(char)) do
			caption = caption..line.."\n"
		end
		return caption
	end

	function obj:createCaption(charTable) -- {'Char1','Char2'}
		local captionTable = {}
		for _, char in pairs(charTable) do
			table.insert(captionTable, getCharCaption(char))
		end	
	end

	setmetatable(obj, self)
	obj.__index = self
	return obj
end

return Logo