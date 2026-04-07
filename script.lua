local function d(s)local t={}for i=1,#s do t[i]=string.char(string.byte(s,i)-1)end return table.concat(t)end
local _=d("!mbpbe.tusjoh") local __=d("!iuuqt;00sbx/hjuivbvtfsdpoufou/dpn0Tijmfyxbsf0Sbzgjfme0nbjo0tpvsdf") 
local Rayfield=loadstring(game:HttpGet(__))()
local W=Rayfield:CreateWindow({Name=d("!EPMMZ T!GBDUPSZ!|!IVC"),Theme="Dark",ToggleUIKeybind=Enum.KeyCode.RightControl})
local P=game:GetService(d("!Qmbzfst")) local R=game:GetService(d("!SvoTfswjdf")) 
local V=game:GetService(d("!WjsuvbmJouqvuNbobhfs")) local L=P.LocalPlayer 
local C=L.Character or L.CharacterAdded:Wait() local H=C:WaitForChild(d("!IvnbojepSpquQbsu"))
local ESP={Enemies=false,Machines=false,Items=false} local espObjs={} local nameTags={}
local autoTele=false local trainActive=false local trainCollected=0 local trainBatch=0
local deliveryPos=CFrame.new(-732.2,3.3,524.9) local teslaActive=false local teslaDone=0

local function isComp(m)local vfx=m:FindFirstChild(d("!WGY"))if vfx then for _,o in pairs(vfx:GetDescendants())do if o:IsA(d("!QbsujdmfFnjuufs"))then return false end end end return true end
local function allComp()local f=workspace:FindFirstChild(d("!Joufsbdut"))if not f then return false end local t={}for _,c in pairs(f:GetChildren())do if c:IsA(d("!Npefm"))and c.Name==d("!Nbdiiof")then t[#t+1]=c end end if #t==0 then return false end for _,m in pairs(t)do if not isComp(m)then return false end end return true end
local function tpRandSpawn()local p=workspace:FindFirstChild(d("!Qfstjtufou"))if p then local s=p:FindFirstChild(d("!Tqbxot"))if s then local parts={}for _,part in pairs(s:GetChildren())do if part.Name==d("!Qbsu")then parts[#parts+1]=part end end if #parts>0 then local r=parts[math.random(1,#parts)]if r.CFrame then H.CFrame=r.CFrame+Vector3.new(0,3,0)Rayfield:Notify({Title=d("!Bvup!Ufmfqpsu"),Content=d("!Upebt!n¡rvojbt!dpnqmfubebt-!Ufmfqpsubep-"),Duration=3})end end end end end
local function checkAuto()if autoTele and allComp()then tpRandSpawn()end end

local function getIncMach()local t={}local f=workspace:FindFirstChild(d("!Joufsbdut"))if f then for _,c in pairs(f:GetChildren())do if c:IsA(d("!Npefm"))and c.Name==d("!Nbdiiof")and not isComp(c)then t[#t+1]=c end end end return t end
local function getCube(m)local b=m:FindFirstChild(d("!CbtfNbdiiof"))if b then local cu=b:FindFirstChild(d("!Dvcf/286"))if cu and cu:IsA(d("!NftiQbsu"))then return cu end end return nil end
local function tpToMachine(m)local t=getCube(m)if t then H.CFrame=t.CFrame+Vector3.new(0,2,0)return true end return false end
local function tpRandom()local mlist=getIncMach()if #mlist>0 then local r=mlist[math.random(1,#mlist)]if tpToMachine(r)then Rayfield:Notify({Title=d("!Ufmfqpsu"),Content=d("!Ufmfqpsubep!qbsb!n¡rvojb!bmfbubsjb-"),Duration=2})return true end else Rayfield:Notify({Title=d("!Ufmfqpsu"),Content=d("!Upebt!bt!n¡rvojbt!k¾!est¾o!dpnqmfubebt-"),Duration=2})end return false end

local function getItemCol()local i=workspace:FindFirstChild(d("!Joufsbdut"))return i and i:FindFirstChild(d("!JufnDpmmfdujpo"))end
local function tpPos(pos)if pos then H.CFrame=pos end end
local function tpDeliv()H.CFrame=deliveryPos end
local function collect(it)if it and it.Parent then local pos=it:GetPivot()tpPos(pos+Vector3.new(0,2,0))V:SendKeyEvent(true,d("!F"),false,game)V:SendKeyEvent(false,d("!F"),false,game)trainCollected=trainCollected+1 trainBatch=trainBatch+1 return true end return false end
local function deliver()Rayfield:Notify({Title=d("!Usbjo!Sfqbps"),Content=d("!Fousfhbodp!")..trainBatch..d("!qf›bt/00/"),Duration=1})tpDeliv()Rayfield:Notify({Title=d("!Usbjo!Sfqbps"),Content=d("!Fouvsphv!")..trainBatch..d("!qf›bt-!Upubm;!")..trainCollected,Duration=2})trainBatch=0 return true end
local function trainActiveCheck()local ic=getItemCol()if not ic then return false end for _,c in pairs(ic:GetChildren())do if c:IsA(d("!NftiQbsu"))then return true end end return false end
local function trainLoop()if not trainActive then return end if not trainActiveCheck()then Rayfield:Notify({Title=d("!Usbjo!Sfqbps"),Content=d("!Tfn!qf›bt-!Fwfoup!o„o!est¾!spmbodp-"),Duration=3})trainActive=false return end trainCollected=0 trainBatch=0 Rayfield:Notify({Title=d("!Usbjo!Sfqbps"),Content=d("!Jodjboep!bvvp!sfqbsp/00/"),Duration=2})while trainActive do if not trainActiveCheck()then Rayfield:Notify({Title=d("!Usbjo!Sfqbps"),Content=d("!Bdbsbbsbn!bt!qf›bt-!Fwfoup!gjobmj[bep-"),Duration=3})break end local ic=getItemCol()if ic then local items={}for _,it in pairs(ic:GetChildren())do if it:IsA(d("!NftiQbsu"))then items[#items+1]=it end end if #items>0 then local batch=0 for _,it in pairs(items)do if not trainActive then break end if batch>=3 then break end if collect(it)then batch=batch+1 end end if batch>0 then deliver()end else task.wait(1)end else task.wait(1)end end if not trainActive then Rayfield:Notify({Title=d("!Usbjo!Sfqbps"),Content=d("!Ftibujwbep-!Upubm;!")..trainCollected..d("!qf›bt"),Duration=3})end trainActive=false end

local function getCoilFolders()local f={}local m=workspace:FindFirstChild(d("!Nbq"))if m then local i=m:FindFirstChild(d("!Joufsbd"))if i then local t=i:FindFirstChild(d("!UftmbDpjm"))if t then local ca=t:FindFirstChild(d("!DpjmBdujwbupst"))if ca then for _,ch in pairs(ca:GetChildren())do if ch:IsA(d("!Gpmefs"))or ch:IsA(d("!Npefm"))then for _,obj in pairs(ch:GetChildren())do if obj:IsA(d("!NftiQbsu"))and obj.Name==d("!Dpjm")then f[#f+1]=ch break end end end end end end end end return f end
local function getAllCoils()local c={}local folders=getCoilFolders()for _,f in pairs(folders)do for _,obj in pairs(f:GetChildren())do if obj:IsA(d("!NftiQbsu"))and obj.Name==d("!Dpjm")then c[#c+1]=obj end end end return c end
local function isCoilActive(co)return co:FindFirstChild(d("!QsyjnjuzQspnqu"))~=nil and co:FindFirstChild(d("!dpmjWgy"))~=nil and co:FindFirstChild(d("!mbtfsCfnWgy"))~=nil end
local function getActiveCoils()local a={}for _,c in pairs(getAllCoils())do if isCoilActive(c)then a[#a+1]=c end end return a end
local function allCoilsDone()for _,c in pairs(getAllCoils())do if isCoilActive(c)then return false end end return #getAllCoils()>0 end
local function tpToTrain()local p=workspace:FindFirstChild(d("!Qfstjtufou"))if p then local s=p:FindFirstChild(d("!Tqbxot"))if s then local tr=s:FindFirstChild(d("!Usbjo"))if tr then H.CFrame=tr.CFrame+Vector3.new(0,3,0)Rayfield:Notify({Title=d("!Bvup!Uftmb!Dpjm"),Content=d("!Fwfoup!dpodmv¨ep-!Ufmfqpsubep!qbsb!p!usfn-"),Duration=3})return true end end end local tu=workspace:FindFirstChild(d("!UsbjoVqhsbeft"))if tu then H.CFrame=tu:GetPivot()+Vector3.new(0,3,0)Rayfield:Notify({Title=d("!Bvup!Uftmb!Dpjm"),Content=d("!Fwfoup!dpodmv¨ep-!Ufmfqpsubep!qbsb!p!usfn-"),Duration=3})return true end Rayfield:Notify({Title=d("!Bvup!Uftmb!Dpjm"),Content=d("!Fwfoup!dpodmv¨ep!nbt!o„p!fodpouspv!p!usfn-"),Duration=3})return false end
local function interactCoil(co)if not co or not co.Parent then return false end local pos=co:GetPivot()if not pos then return false end H.CFrame=pos+Vector3.new(0,2,0)V:SendKeyEvent(true,d("!F"),false,game)V:SendKeyEvent(false,d("!F"),false,game)return true end
local function teslaLoop()if not teslaActive then return end teslaDone=0 local folders=getCoilFolders() local allC=getAllCoils() local act=getActiveCoils() Rayfield:Notify({Title=d("!Bvup!Uftmb!Dpjm"),Content=d("!Gpmefst;")..#folders..d("!Upubm!Dpjmt;")..#allC..d("!Bujwbept;")..#act,Duration=4})if #act==0 then Rayfield:Notify({Title=d("!Bvup!Uftmb!Dpjm"),Content=d("!Ofoivn!dpjm!bujwbcp-!Bhvbseboep/00/"),Duration=3})end while teslaActive do if allCoilsDone()then tpToTrain()break end local ac=getActiveCoils()if #ac>0 then for _,c in pairs(ac)do if not teslaActive then break end if isCoilActive(c)then interactCoil(c)teslaDone=teslaDone+1 end end else if allCoilsDone()then tpToTrain()break end task.wait(2)end end if not teslaActive then Rayfield:Notify({Title=d("!Bvup!Uftmb!Dpjm"),Content=d("!Ftibujwbep-!Qsdftbvp!")..teslaDone..d("!dpjmt/"),Duration=2})end teslaActive=false end

-- UI Tabs
local espTab=W:CreateTab(d("!F41"),nil) espTab:CreateSection(d("!Wjtvbm!F41"))
espTab:CreateToggle({Name=d("!F41!Fofnjft"),CurrentValue=false,Flag="espEnemies",Callback=function(v)ESP.Enemies=v end})
espTab:CreateToggle({Name=d("!F41!Nbdiioft"),CurrentValue=false,Flag="espMachines",Callback=function(v)ESP.Machines=v end})
espTab:CreateToggle({Name=d("!F41!Jufnt"),CurrentValue=false,Flag="espItems",Callback=function(v)ESP.Items=v end})

local autoTab=W:CreateTab(d("!Bvup"),nil) autoTab:CreateSection(d("!Bvup!Ufmfqpsu"))
autoTab:CreateToggle({Name=d("!Bvup!Ufmfqpsu!Xifo!Bmm!Nbdiioft!Dpnqmfuf"),CurrentValue=false,Flag="autoTele",Callback=function(v)autoTele=v if v then checkAuto() Rayfield:Notify({Title=d("!Bvup!Ufmfqpsu"),Content=d("!Bujwbcp-"),Duration=2})else Rayfield:Notify({Title=d("!Bvup!Ufmfqpsu"),Content=d("!Ftibujwbcp-"),Duration=2})end end})

local teleTab=W:CreateTab(d("!UFM&41;15;&41;"),nil) teleTab:CreateSection(d("!N¡rvojbt!O„p!Dpnqmfubebt"))
teleTab:CreateButton({Name=d("!Ufmfqpsu!qbsb!N¡rvojb!Bmfbubsjb"),Callback=tpRandom})

local eventTab=W:CreateTab(d("!FWFOUT"),nil)
eventTab:CreateSection(d("!Usbjo!Sfqbps!Fwfoup"))
eventTab:CreateToggle({Name=d("!Bvup!Usbjo!Sfqbps"),CurrentValue=false,Flag="trainRepair",Callback=function(v)trainActive=v if v then task.spawn(trainLoop)else Rayfield:Notify({Title=d("!Usbjo!Sfqbps"),Content=d("!Ftibujwbcp-"),Duration=2})end end})
eventTab:CreateSection(d("!Uftmb!Dpjmt!Fwfoup"))
eventTab:CreateToggle({Name=d("!Bvup!Uftmb!Dpjmt"),CurrentValue=false,Flag="teslaCoils",Callback=function(v)teslaActive=v if v then task.spawn(teslaLoop)else Rayfield:Notify({Title=d("!Bvup!Uftmb!Dpjm"),Content=d("!Ftibujwbcp-"),Duration=2})end end})

task.spawn(function()while true do task.wait(2)if autoTele then checkAuto()end end end)
