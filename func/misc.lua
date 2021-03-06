local misc = {}

function misc.sep(str, char)
	local list = {}
        local element = ""
        for i = 1, string.len(str) do
                if string.sub(str, i, i) == char then
                        table.insert(list, element)
                        element = ""
                else
                        element = element .. string.sub(str, i, i)
                end
        end
        table.insert(list, element)
        return list[1], list, table.unpack(list)
end

function misc.randLine(file)
	local fileList = {}
	local f = io.open("assets/" .. file, "r")
	local line = ""
	while line do
		line = f:read("*line")
		fileList[#fileList+1] = line
	end
	return fileList[math.random(1, #fileList)]
end

function misc.error(text)
	io.write("ERR|" .. text .. "\n")
	io.write("-------------------------------------------\n")
	error(text)
end
function misc.warn(text)
	io.write("WRN|" .. text .. "\n")
end
function misc.debug(text)
	io.write("DBG|" .. text .. "\n")
end
function misc.info(text)
	io.write("INF|" .. text .. "\n")
end

function misc.fpart(n)
	return n - math.floor(n)
end

function misc.clamp(n, m, x)
	n = math.max(n, m)
	n = math.min(n, x)
	return n
end

function misc.slowDown(n, s)
	if n > 0 then
		n = math.max(0, n - s)
	elseif n < 0 then
		n = math.min(0, n + s)
	end
	return n
end

function misc.prettyNumber(n)
	return math.floor(n*10+0.5)/10
end

function misc.tablePrint(t, tabs)
	if not tabs then
		tabs = 0
	end
	for k, v in pairs(t) do
		if tabs > 0 then
			for i = 1, tabs do
				io.write("	")
			end
		end
		io.write(k, " (", type(v), "):")
		if type(v) == "table" then
			io.write("\n")
			misc.tablePrint(v, tabs+1)
		else
			io.write("	", tostring(v), "\n")
		end
	end
end

return misc
