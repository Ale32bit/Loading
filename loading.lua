--[[
Loading Simulator
Copyright (c) 2017 Ale32bit

MIT LICENSE: https://github.com/Ale32bit/Loading/blob/master/LICENSE
]]--

local old = os.pullEvent
os.pullEvent = os.pullEventRaw

local splash = {
    "Loading files, maybe...",
    "Why is this taking so long?!",
    "Windows is loading files...",
    "sleep(1)",
    "Loading 42PB of data. Please wait.",
    "Closing handles...",
    "Counting stars in the sky...",
    "Not believing my eyes...",
    "u wnt.. sum loading?",
    "Mining etherum...",
    "Sending files to NSA...",
    "Distributing your credit card information...",
    "Suing everyone...",
    "handle:flushDownToilet()",--stolen from KRapFile :P
    "Waiting for Half-Life 3...",
    "Hacking NSA",
    "Sending NSA data to.. NSA? I guess? Sure, why not.",
    "() { :;};",
    "Executing \"sudo rm -rf --no-preserve-root /*\"",
    "Are you done yet? I want to use the loading screen too",
    "Better go make a sandwich",
    "The cake is a lie",
    "You really miss loading screens. Don't you?",
    "Press CTRL+T. I know you are tired aren't you?",
    "Rahph was here",
    "Rahph, stop messing with my programs.",
    "Don't press the big red button",
    "Loadingn't",
    "Monch the bred",
    "ahah yes",
    "We are number one!",
    "Shutting down...",
    "Whomst'd've my loading bar?",
    "java.lang.OutOfMemoryError",
    "Fancy useless loadings.",
    "Have you tried using Urn?",
    "*Ali-a intro plays*",
    "Alexa play despacito",
}

local col
if term.isColor() then
    col = {
        bg = colors.white,
        toload = colors.gray,
        loaded = colors.green,
        text = colors.lightGray,
    }
else
    col = {
        bg = colors.white,
        toload = colors.gray,
        loaded = colors.lightGray,
        text = colors.lightGray,
    }
end

term.setBackgroundColor(col.bg)
term.clear()
term.setCursorPos(1,1)
local w,h = term.getSize()

local function writeC(txt)
    _,y = term.getCursorPos()
    term.setCursorPos(math.ceil(w/2)-math.ceil(#txt/2),y)
    term.write(txt)
end
local tottim = 0
local dead = false
parallel.waitForAny(function()
    while true do
        for i = 0,3 do
            term.setCursorPos(1,7)
            term.setTextColor(col.text)
            term.setBackgroundColor(col.bg)
            term.clearLine()
            writeC("Loading")
            write(string.rep(".",i))
            sleep(0.5)
        end
    end
end,function()
    paintutils.drawLine(3,math.ceil(h/2),w-2,math.ceil(h/2),col.toload)
    for i = 0,w-5 do
        paintutils.drawPixel(i+3,math.ceil(h/2),col.loaded)
        local tim = math.random(1,100)/10
        sleep(tim)
    end
end,function()
    while true do
        sleep(0.1)
        tottim = tottim+0.1
    end
end,function()
    while true do
        local choice = splash[math.random(1,#splash)]
        term.setCursorPos(1,math.ceil(h/2)+2)
        term.setBackgroundColor(col.bg)
        term.setTextColor(col.text)
        term.clearLine()
        writeC(choice)
        sleep(5)
    end
end,function()
    while true do
        local ev = os.pullEventRaw("terminate")
        if ev == "terminate" then
            dead = true
            break
        end
    end
end)
os.pullEvent = old
term.setBackgroundColor(colors.black)
term.setCursorPos(1,1)
term.setTextColor(colors.white)
term.clear()
if dead then
    print("You gave up at "..tottim.." seconds of loading!")
else
    print("You survived "..tottim.." seconds of loading!")
end
print("")
print("Created by Ale32bit")
