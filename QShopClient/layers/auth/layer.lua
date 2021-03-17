Auth = {}

------Requirements------
cfg = require("./config.lua")
logo = require("./logo")

------Libs------
component = require("component")
gpu = component.gpu
forms = require("forms")
user = require("user")

function Auth:init()
	data = {}
	data.frame = forms.addForm()
	data.frame.border = 1
	data.frame.color = 0x222831
	data.frame.fontColor = 0x393e46
	data.animationDelay = 0.45
	data.logo={
		G={
		"   ▄████   ",
		"  ██▒ ▀█▒  ",
		" ▒██░▄▄▄░  ",
		" ░▓█  ██▓  ",
		" ░▒▓███▀▒  ",
		"  ░▒   ▒   ",
		"   ░   ░   ",
		" ░ ░   ░   ",
		"       ░   "},
		L={
		"  ██▓    ",
		" ▓██▒    ",
		" ▒██░    ",
		" ▒██░    ",
		" ░██████▒",
		" ░ ▒░▓  ░",
		" ░ ░ ▒  ░",
		"   ░ ░   ",
		"     ░  ░"}             
	}
	function data:redraw()
		local objects = {}

		-- Сreate auth button
		objects['auth'] = self.frame:addButton(4,20,">  Нажми, чтобы продолжить  < ", 
			function(self, user)
				objects['timer']:stop()
				self.caption = "           Авторизирую...            " 
				-- self.user = user:new(user) 
				-- self.isAuth = user:auth()
				self.color = 0xeeeeee
				self:redraw()
				os.sleep(data.animationDelay)
				self.color = 0xf4d160	
				self.caption = ">  Нажми, чтобы продолжить  < "
				self:redraw() 
				objects['timer']:run()
			end)
		objects['auth'].color = 0xf4d160
		objects['auth'].fontColor = 0x00adb5
		objects['auth'].H = 3
		objects['auth'].W = 74

		--Create logo label
		-- objects['info'] = self.frame:addLabel(20,5," .----------------.  .----------------. \n| .--------------. || .--------------. |\n| |    ______    | || |   _____      | |\n| |  .' ___  |   | || |  |_   _|     | |\n| | / .'   \\_|   | || |    | |       | |\n| | | |    ____  | || |    | |   _   | |\n| | \\ `.___]  _| | || |   _| |__/ |  | |\n| |  `._____.'   | || |  |________|  | |\n| |              | || |              | |\n| '--------------' || '--------------' |\n '----------------'  '----------------' ")
		objects['logoG'] = self.frame:addLabel(26,5,toCaption(self.logo.G))
		objects['logoG'].centered = true
		objects['logoG'].color = 0x222831
		objects['logoG'].fontColor = 0x4a47a3

		objects['logoL'] = self.frame:addLabel(41,5,toCaption(self.logo.L))
		objects['logoL'].centered = true
		objects['logoL'].color = 0x222831
		objects['logoL'].fontColor = 0xf14668

		--Animated back
		objects['anim'] = self.frame:addLabel(3,3,"")
		objects['anim'].color = 0x222831
		objects['anim'].fontColor = 0x4a47a3
		objects['anim'].animSymb = "&"

		--Timer
		objects['timer'] = self.frame:addTimer(self.animationDelay, 
			function (self) 
				if objects['timer'].pos == 0 then objects['auth'].buff = objects['auth'].caption end
				objects['auth'].caption = "> "..objects['auth'].caption.."< "
				objects['auth']:redraw()
				objects['timer'].pos = objects['timer'].pos + 1
				if objects['timer'].pos == objects['timer'].duration then
					objects['auth'].caption = objects['auth'].buff
					objects['auth']:redraw()
					objects['timer'].pos = 0
				end
			end)
		objects['timer'].duration = 4
		objects['timer'].pos = 0
		self.objects = objects
	end

	function data:run()
		forms.run(self.frame)
	end

	function data:stop()
		forms.stop(self.frame)
	end
	
	setmetatable(data, self)
	self.__index = self;
	return data
end

function test() end

function toCaption(mass)
	local caption = ""
	for _,k in pairs(mass) do
		caption = caption..k..'\n'
	end
	return caption
end

return Auth