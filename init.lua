local color={Black="\27[90m",Red="\27[91m",Green="\27[92m",Yellow="\27[93m",DarkBlue="\27[94m",Purple="\27[95m",LightBlue="\27[96m",White="\27[97m"}
function clear()io.write("\27\99"..color.White..'\n\tdiscord-display-name-changer By Cowrod\n\n')end
function count(t)a=0 for i,v in pairs(t)do a,i,v=a+1,nil,nil end return a end
if not require'fs'.existsSync"donotdeleteme.iamaverifierfile"then while true do clear()print"Warning: Using this tool may result in the suspension of your Discord account.\nWhy? Although I cannot confirm, I've heard it may be due to potential \"selfbotting\" as mentioned on Reddit.\nThis tool simply changes your display name on a Discord server, but I cannot guarantee its safety.\nProceed at your own risk. [This message is for information purposes only.]"io.write'Type "YES" to continue using this tool: 'q,w=io.input():read'*l'if q and q:upper()=="YES"then break elseif not q and w then print"\nFailed To Read UserInput Please Create A File Named 'donotdeleteme.iamaverifierfile' if you confirm these thing in up"os.exit()end end require'fs'.writeFileSync("donotdeleteme.iamaverifierfile","")end
clear()io.write("token> \27[97;107m")
local token = require'fs'.existsSync"token.txt"and(function()q=require'fs'.readFileSync"token.txt"print(q)return q end)()or io.input():read'*l'io.write"\27[97;0m"io.write("ServerID> \27[97;107m")
local ServerID = require'fs'.existsSync"serverid.txt"and(function()q=require'fs'.readFileSync"token.txt"print(q)return q end)()or io.input():read'*l'io.write"\27[97;0m"
if token==nil and ServerID==nil then print"[IGNORE THIS IF YOU ENTERED NOTHING]\nFailed To Read UserInput Please Create A File Named 'token.txt' and 'serverid.txt' and enter required values to there."os.exit()end
r,b=require'coro-http'.request("GET","https://discordapp.com/api/v7/users/@me",{{"Content-Type","application/json"},{"authorization",token}})
if b=='{"message": "401: Unauthorized", "code": 0}'then
	io.write(color.Red..'\7Token Is Invalid')
	require'timer'.sleep(10000)
	os.exit()
end
local good,fail=tonumber(require'fs'.readFileSync"good.txt"or"0"),tonumber(require'fs'.readFileSync"fail.txt"or"0")
local realMessages={"username1","username2","username3"}
while true do
	messages={}for i,v in pairs(require'json'.decode(require'fs'.readFileSync"displayNames.txt"or require'json'.encode(realMessages))or realMessages)do messages[i-1]=v end messages[#messages+1]=""
	require'timer'.sleep(50)
	_=os.date"%S"
	if math.floor(_/10)==_/10 then
		isw,r,b=pcall(require'coro-http'.request,"PATCH","https://discord.com/api/v9/guilds/"..ServerID.."/members/@me",{{"Content-Type","application/json"},{"authorization",token}},require'json'.encode{nick=os.date(messages[good%#messages])},7500)
		if isw then
			isw,r=pcall(require'json'.decode,b)
			if isw and r then
				if r.code==0 then
					io.write(color.Red..'\7Token Got Invalid')
					require'timer'.sleep(10000)
					os.exit()
				elseif r.retry_after then
					require'timer'.sleep(r.retry_after*1000)fail=fail+1
				else
					good=good+1
				end
			else
				good=good+1
			end
		else
			fail=fail+1
		end
		clear()
		print(color.White.."Changed Display Name "..color.Green..good..color.White.." Times")
		print("Failed "..color.Red..fail..color.White.." Times")
		print("Current Token: ".."\27[97;107m"--[[token becomes invisible on console due to this ansi thing]]..token.."\27[97;0m")
		print("Current Display Name: "..messages[(good-1)%#messages])
		require'fs'.writeFileSync("fail.txt",tostring(fail))require'fs'.writeFileSync("good.txt",tostring(good))
		repeat _=os.date"%S"until not(math.floor(_/10)==_/10)
	end
end
