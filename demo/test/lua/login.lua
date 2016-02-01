--
-- Author: rsma
-- Date: 2016-02-01 15:23:04
--
local args = ngx.req.get_uri_args()
ngx.say(">>>login")
ngx.say('UserName:' .. args.name)
ngx.say('PassWord:' .. args.pwd)
ngx.say("<<<login")
local redis = require 'resty.redis'
local red = redis.new()
red:set_timeout(1000)
local ok,err = red:connect('127.0.0.1',8801)
if not ok then
	ngx.say('faild to connect : ',err)
	return
end
ok,	err	=	red:select(1)
if	not	ok	then
		ngx.say("failed	to	select	db:	",	err)
		return
end
ok, err = red:set("dog","an animal")
if not ok then
	ngx.say('faild to set dog:',err)
	return
end
ngx.say('set result:',ok)