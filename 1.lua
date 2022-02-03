local dfpwm = require("cc.audio.dfpwm")
local speakers = table.pack(peripheral.find("speaker"))

local decoder = dfpwm.make_decoder()
    for chunk in io.lines("./disk2/3.dfpwm",16*1024) do
        local buffer = decoder(chunk)
       for i = 1,speakers.n do 
        while not speakers[i].playAudio(buffer) do
            os.pullEvent("speaker_audio_empty")
        end
        end
end
