require "discordmain"

-- Invite link: https://discord.com/api/oauth2/authorize?client_id=935927816120320080&permissions=515396405312&scope=applications.commands%20bot

Discordia = require('discordia')
Client = Discordia.Client()
local stdout 
wordleton = false

local out = io.popen('find /v "" > con', "w")
function print(s)
  out:write(s.."\r\n") --\r because windows
  out:flush()
end


Client:on('ready', function()
	print('Logged in as '.. Client.user.username)

end)

Client:on('messageCreate', function(message)
	if message.content == '!ping' then
		message.channel:send('Pong!')
	end

	if wordleton then
		print(message.content)
	end
    if message.content == '!wordlet' then
		wordleton = true
		message.channel:send('Wordlet starting...')
        play_game_disc(message.channel)
    end
end)

Client:run('Bot OTM1OTI3ODE2MTIwMzIwMDgw.YfFwtA.sd8hOo4xpflFoLF6EkQazE3WlZM')