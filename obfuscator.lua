local source = arg[1]
local output = arg[2]

if not source or not output then
    print("Usage: lua cli.lua <input_file.lua> <output_file.lua>")
    os.exit(1)
end

math.randomseed(os.time())
local v1 = 128
local v2 = 1
local owner = "yoi"
local slist = {
    "This file was obfuscated by Lienscope V1.0Beta", "Penaldo", "Growlauncher Obfuscator", "Messi Better", "I cant code lua tbh","Tetnation","Makan dulu", "Decrypt = Gay", "Bukan Fork Ivyno", "Never watch skibidi toilet",
    "Moonsec di growtopia kapan ya", "Really Sucks", "Groutopiya obfuscator", "Yanh Baca Item",
    "Growtopia == trash", "print(kalian gay)", "gaada key nya",
    "When working loadstring with link for us?", "Sakit Hati Aku Wal",
    "Jangan Hapus Yang paling atas atau sc nya ngebug", "heheboi", "mewjng",
    "Skidibi", "Bukan Fork Yasucator", "AAAAAAA", "print(Gay)",
    "Messi Goat", "Main Roblok yuk", "Nick Ku Rentlz", "jangan pernah main ml di jam 3 pagi",
    "Ikan Bandeng", "Ff", "Ngomong Apa",
    "Makan Eek", "Skibidi Toilet", "Même dans un sommeil éternel", "J'étais censé t'aimer mais j'ai vu l'averse",
    "J'ai cligné des yeux, tu n'étais plus la même", "Est-ce que je t'aime? J'sais pas si je t'aime"
}

local function getslist(tbl)
    return tbl[math.random(#tbl)]
end

local function encodeString(s)
    return s:gsub(".", function(bb) return "\\x" .. string.format("%02X", bb:byte()) end)
end

local ax = "DEKODER"
local encoded = encodeString(ax)

local function gen(length)
    local letters = "abcdefghijklmnopqrstuvwxyz"
    local result = ""
    for i = 1, length do
        local index = math.random(1, #letters)
        result = result .. letters:sub(index, index)
    end
    return result
end

local function mth(length)
    local mth = { ">", "+", "<" }
    local result = ""
    for i = 1, length do
        local index = math.random(1, #mth)
        result = result .. mth[index]
    end
    return result
end

local v01 = "_" .. math.random(1, 500)
local v10 = "_" .. math.random(1, 500)
local randomIndex = math.random(1, 500)
local a, b, c = math.random(1, 500), math.random(1, 500), math.random(1, 500)

local x = "_, Obfuscated_by_Lienscope,Version = '" .. "1.0Beta" .. "'\na,b,c ="..math.random(1,500)..","..math.random(1,500)..","..math.random(1,500).." if Obfuscated_by_Lienscope then local Baca = \"Yang Gerak Gay\" end "

x = x .. "local " .. v01 .. " = \"" .. getslist(slist) .. "\" "
x = x .. "local " .. v10 .. " = \"" .. getslist(slist) .. "\" "
local zv = "_" .. math.random(1, 500)
local hn = "_" .. math.random(1, 500)

local function var0()
    x = x .. "setmetatable(_G, {__newindex = function (_, " .. hn .. ", " .. zv .. ") " ..
        "if (" .. hn .. " == \"L_" .. math.random(1, 500) .. "\") then " ..
        "do_setlevel(" .. zv .. ") " ..
        "elseif (" .. hn .. " == \"L_map\") then " ..
        "do_setmap(" .. zv .. ") " ..
        "else rawset(_G, " .. hn .. ", " .. zv .. ") " ..
        "end " ..
        "end }) "
end
var0()

local vmn = gen(1)
local vb = gen(5)
local xb = gen(7)
local bz = gen(10)


local function var01()
    x = x .. "function _" .. math.random(1, 500) .. " (" .. v01 .. ", " .. v10 .. ") " ..
        "_G[_x" .. math.random(1, 500) .. "] = \"" .. getslist(slist) .. "\" end "
end

local function var1()
    x = x .. "local _x" .. math.random(1, 9999) .. " = \"" .. getslist(slist) .. "\" "
end

local md = math.random(1, 500)

local function var3()
    x = x .. "local _x" .. md .. " = \"" .. encoded .. "\" "
end

local bn = mth(1)
local function var4()
    x = x .. "local function _x" .. math.random(1, 500) .. "() _G[_x" .. math.random(1, 500) .. "] = _x" .. math.random(1, 500) .. bn .. math.random(1, 500) .. " end "
end

local LOA = math.random(1, 500)
local function lod()
    x = x .. "local _x" .. LOA .. " = \"\\x6C\\x6F\\x61\\x64\" "
end

local fload = "-- load"
local function var6()
    x = x .. "local _x" .. math.random(1, 500) .. " = " .. fload .. ";"
end

local lkw = math.random(1, 500)
local function var7()
    x = x .. "if L_x" .. lkw .. " == " .. math.random(1, 500) .. " then local _x" .. math.random(1, 500) .. " = " .. math.random(1, 500) .. " end "
end

os.execute("luac -o luac.out " .. source)
local bytecode_file, bytecode_err = io.open("luac.out", "rb")
if not bytecode_file then
    print("Error opening bytecode file: " .. bytecode_err)
    os.exit(1)
end
local com = bytecode_file:read("*all")
bytecode_file:close()

local enc = com:gsub(".", function(bb) return "\\" .. bb:byte() end)

local bk = gen(10)
local ld = "load"
local function lk()
    x = x .. bk .. (" .. "\"" .. enc .. "\"" .. ")()"
end
function b()
x = x .. bk .. " = " .. ld .. ";"
end

for _ = 1, 120 do
    var1()
    var01()
    var7()
end
b()
for i = 1,50 do
var1()
end
lk()

for i = 1, 20 do
    var01()
end

local f = io.open(output, "w")
if not f then
    print("Error opening output file: " .. output)
    os.exit(1)
end
f:write(x)
f:close()
print("Obfuscated Successfully.")

os.remove("luac.out")