AddEventHandler('esx:playerLoaded', function(playerId, xPlayer)
	local nowDateTime = "date:"..os.date("%x").." | time:"..os.date("%X")
	local playerIP = ""	
	
	for k,v in ipairs(GetPlayerIdentifiers(playerId))do
		if string.sub(v, 1, string.len("ip:")) == "ip:" then
			playerIP = v
			break
		end
	end	
	local info = os.time().." | "..nowDateTime.." | "..playerIP
	MySQL.Async.execute('UPDATE users SET lastlogin = @lastlogin WHERE identifier = @identifier',{['@identifier'] = xPlayer.getIdentifier(),['@lastlogin'] = info })
end)