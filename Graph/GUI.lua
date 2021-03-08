component = require("component")
forms=require("forms")
gpu = component.gpu
UI = {resolution={80,25}, defaultBackgroundColor=0x6600ff, defaultForegroundColor=0xffffff, major='1', minor='0.1', version=function () return UI.major..'.'..UI.minor end}
frames = {
    auth={frameSettings={
        name='auth',
        left=1,
        top=1,
        W=UI.resolution[1],
        H=UI.resolution[2],
        border=2,
        color=UI.defaultBackgroundColor,
        frontColor=UI.defaultForegroundColor,
        isActive=true}
    },
    main={frameSettings={
        name='main',
        left=1,
        top=1,
        W=UI.resolution[1],
        H=UI.resolution[2],
        border=1,
        color=0xff0040,
        frontColor=UI.defaultForegroundColor,
        isActive=true}
    }
}

function UI:init()
    --TODO
end

function createFrames(framesProfile)
    for key,form in pairs(framesProfile) do
        form.obj = forms.addForm()
        for setting, arg in pairs(framesProfile[key].frameSettings) do
            form.obj[setting]=arg
        end
    end
end

createFrames(frames)
forms.run(frames['main'].obj)