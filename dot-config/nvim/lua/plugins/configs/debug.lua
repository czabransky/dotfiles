local M = {}

function M.dump(obj)
	if type(obj) == 'table' then
		local s = '{ '
		for k,v in pairs(obj) do
			if type(k) ~= 'number' then
				k = '"'..k..'"'
			end
			s = s .. '['..k..'] = ' .. M.dump(v) .. ','
		end
		return s .. '} '
	else
		return tostring(obj)
	end
end

function M.tprint (t, s)
	local output = ''
    for k, v in pairs(t) do
        local kfmt = '["' .. tostring(k) ..'"]'
        if type(k) ~= 'string' then
            kfmt = '[' .. k .. ']'
        end
        local vfmt = '"'.. tostring(v) ..'"'
        if type(v) == 'table' then
            output = output .. M.tprint(v, (s or '')..kfmt)
        else
            if type(v) ~= 'string' then
                vfmt = tostring(v)
            end
            output = output .. type(t)..(s or '')..kfmt..' = '..vfmt
        end
    end
	return output
end


return M
