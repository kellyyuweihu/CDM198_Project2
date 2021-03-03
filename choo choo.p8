pico-8 cartridge // http://www.pico-8.com
version 29
__lua__


function _init()
	busInit()
	passangerInit()
end

function _draw()
	cls()
	
	map(0, 0, 0, 0, 33, 8)
	
	if(bus.xposition > 30) then
		map(0, 14, 14 + bus.xposition-30, 66, 18, 4)
	else
		map(0, 14, 14, 66, 18, 4)
	end
	
	passangerDraw()
	
	busDraw()
	print(bus.xposition, bus.xposition, 0, 7)
	print(passanger.xposition1, passanger.xposition1, 0, 7)
	print(passanger.xposition2, passanger.xposition2, 0, 7)
	print(passanger.xposition3, passanger.xposition3, 0, 7)
	print(passanger.xposition4, passanger.xposition4, 0, 7)
	
end

function _update()
	busMove()
	pickUp()
	if(bus.xposition > 30) then
		camera(0 + bus.xposition-30, 0)
	else
		camera(0, 0)
	end
	
end




-->8
function busInit()
	bus = {}
	bus.sprite = 32
	bus.xposition = 0
	bus.yposition = 29
	bus.height = 2
	bus.width = 4
	

end

function busMove()
	
	if (btn(0)) then
		if (bus.xposition-1 > 0) then
			bus.xposition = bus.xposition-1
		end
	elseif (btn(1)) then
		if (bus.xposition + 1 < 250) then
			bus.xposition = bus.xposition + 1
		end
	end
	
end

function pickUp()
	if (btn(2)) then
		if((bus.xposition < passanger.xposition1) and (passanger.xposition1 < bus.xposition + 20)) then
			passanger.pickCheck1 = 1
		elseif((bus.xposition < passanger.xposition2) and (passanger.xposition2 < bus.xposition + 20)) then
			passanger.pickCheck2 = 1
		elseif((bus.xposition < passanger.xposition3) and (passanger.xposition3 < bus.xposition + 20)) then
			passanger.pickCheck3 = 1
		elseif((bus.xposition < passanger.xposition4) and (passanger.xposition4 < bus.xposition + 20)) then
			passanger.pickCheck4 = 1
		elseif((bus.xposition < passanger.xposition5) and (passanger.xposition5 < bus.xposition + 20)) then
			passanger.pickCheck5 = 1
		end
	end

end

function dropOff()
	if(btn(3)) then
		
	end

end

function busDraw()
	spr(bus.sprite, bus.xposition, bus.yposition, bus.width, bus.height)

end
-->8

function passangerInit()
	passanger = {}
	passanger.sprite1 = 5
	passanger.sprite2 = 6 
	passanger.sprite3 = 7
	passanger.sprite4 = 9
	passanger.sprite5 = 10
	passanger.xposition1 = 68 + rnd(60)
	passanger.xposition2 = passanger.xposition1 + rnd(60) + 10
	passanger.xposition3 = passanger.xposition2 + rnd(60) + 10
	passanger.xposition4 = passanger.xposition3 + rnd(60) + 10
	passanger.xposition5 = passanger.xposition4 + rnd(60) + 10
	passanger.yposition = 32
	passanger.pickCheck1 = 0
	passanger.pickCheck2 = 0
	passanger.pickCheck3 = 0
	passanger.pickCheck4 = 0
	passanger.pickCheck5 = 0
end

function passangerDraw()

	if(passanger.pickCheck1 == 0) then
		spr(passanger.sprite1, passanger.xposition1, passanger.yposition)
	end
	if(passanger.pickCheck2 == 0) then
		spr(passanger.sprite2, passanger.xposition2, passanger.yposition)
	end
	if(passanger.pickCheck3 == 0) then
		spr(passanger.sprite3, passanger.xposition3, passanger.yposition)
	end
	if(passanger.pickCheck4 == 0) then
		spr(passanger.sprite4, passanger.xposition4, passanger.yposition)
	end
	if(passanger.pickCheck5 == 0) then
		spr(passanger.sprite5, passanger.xposition5, passanger.yposition)
	end
	
	
	
	

end
__gfx__
0000000044444444cccccccc6666666611111111ccccccccccccccccccaaaaaccccccccccccccccccccccccccccccccccccc22cccc9999cccc8888ccc555555c
0000000044444444cccccccc6655556611111111cccc99cccccccccccca1aa1cccccccccceeecccccccccccccc1c1ccccc22222ccc9889ccc888888cc588885c
0070070044444444cccccccc6651115611111111ccc9999ccc2222ccc2aaaaacccccccccce5ecccccc99ccccc33333ccc220202ccc9889cc88888888c577775c
0007700044444444ccccccccaa51115a11111111cc97997cccd22dccc2aaaaacccc0c0ccceeecccccc97ccccc333333cc222222ccc9559cc87777778c577775c
0007700044444444ccccccccaa51115a11111111cf99999cc222222cc2aaaaacccccccccceee5ccc5599cccccc33333cceeeeeeccc9559cc87777778c588885c
0070070044444444cccccccc6665115611111111cf99999cc222222cccaaaaaccbccccccceeec55cc5559ccccccbcbccc4eeee4ccc9559cc88888888c5a88a5c
0000000044444444cccccccc6665556611111111cfcfcfcccf2222fcccc2cc2ccbccccccc4c4c55cc5669ccccccbcbccc4eeee4ccc9559ccc888888cc505505c
0000000044444444cccccccc6666666611111111cccfcfcccccfcfccccc2cc2ccccbccccc4c4c05cc5665ccccccbcbcccc4c4ccccc9999cccc8888ccc555555c
66666666ffffffffcccccccc5555555566667766ccccccccccccccccccccccccccccccccceeecccccccccccccccccccc00000000cc9999cccc9999ccccc55ccc
6666666644444444cccccccc5555555566667766cc99cccccccccccccaaacccccccccccccee5cccccccccccccbcbcccc00000000cc9559cccc9559ccccc55ccc
6666666644444444cccccccc5555555566667766c9999ccccc2c2ccccaa0ccccccccccccceeeccccccc99cccccbcbccc00000000cc9559cccc9559ccccc55ccc
aa6aaa6a44444444ccc3333c95999599aa66776a97997cfccc2cdcccc2aacccccc0c0cbcceeeccccccc97cccccbcbccc00000000cc9aa9cccc9559ccccc55ccc
aa6aaa6a44444444cc33b38395999599aa66776af9999fcccc2c2cccc2aacccccccccbcc5cc4ccccc5599cccc33333cc00000000cc9aa9cccc9559ccccc55ccc
66666666444444443bb333b35555555566667766f9999fccccfc22ccc2aacccccbccccccc554cccccc5559ccc333333c00000000cc9559cccc9bb9ccccc55ccc
6666666644444444b833b8335555555566667766ffcfcccccccc22fcccc2cccccbcbccccc55ccccccc5669cccc33333c00000000cc9559cccc9bb9ccccc55ccc
6666666644444444bb3333b35555555566667766cfcfcccccccccfccccc2cccccccbccccc05ccccccc5665ccccc1c1cc00000000cc9999cccc9999ccccc55ccc
cccccc7777777777777777777ccccccccccccccccccccccccccccccccccccccc1111115555555555555555555111111111111111111111111111111111111111
ccccc7777777777777777777777cccccccccccc777777777777777777ccccccc1111155555555555555555555551111111111115555555555555555551111111
ccccc7777777777777777777777cccccccccc7777777777777777777777ccccc1111155555555555555555555551111111111555555555555555555555511111
888888888888888888888888888888ccccccc7777777777777777777777ccccc800000000000000a0000000000000a1111111555555555555555555555511111
888888888888888888888888888888cc888888888888888888888888888888cc00000000000000000000000000000011800000000000000a0000000000000a11
888888888888888888888888888877cc888888888888888888888888888888cc0000000000000000000000000000771100000000000000000000000000000011
8877788777887778877788555a5877cc888888888888888888888888888877cc0077700777007770077700000000771100000000000000000000000000007711
88777887778877788777885aa55877cc8877788777887778877788555a5877cc00777007770077700777000a0a00771100777007770077700777000000007711
887778877788777887778877777877cc88777887778877788777885aa55877cc00777007770077700777000aa000771100777007770077700777000a0a007711
887778877788777887778877777877cc887778877788777887778877777877cc0077700777007770077700000000771100777007770077700777000aa0007711
888888888888888888888888888877cc887778877788777887778877777877cc0000000000000000000000000000771100777007770077700777000000007711
888888888888888888888888888888cc888888888888888888888888888877cc8000000000000000000000000000001100000000000000000000000000007711
88880000888888888000088888888acc888888888888888888888888888888cc00000000000000000000000000000a1180000000000000000000000000000011
888800008888888880000888888888cc88880000888888888000088888888acc8000000000000000000000000000001100000000000000000000000000000a11
cccc0000ccccccccc0000ccccccccccc888800008888888880000888888888cc1111000011111111100001111111111180000000000000000000000000000011
cccc0000ccccccccc0000ccccccccccccccc0000ccccccccc0000ccccccccccc1111000011111111100001111111111111110000111111111000011111111111
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000
ccccccccccc7777777777777777777777777777777777777777777777ccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000
cccccccccc7777777777777777777777777777777777777777777777777ccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000
cccccc7777777777777777777777777777777777777777777777777777777ccccccccccccccccccccccc22222222cccccccccccc000000000000000000000000
ccccc777777777777777777777777777777777777777777777777777777777ccccccccccccccccccccee8888888822cccccccccc000000000000000000000000
99888888888888888888888888888888888aaa88888888888888888888888888888888aaccccccccce8888888888882ccccccccc000000000000000000000000
888888888888888888888888888888888888888888888888888888888888888888888888cccccccee8888888888888822ccccccc000000000000000000000000
888888666656666666566666666665566665666666656666666566666556888888888888ccccccce88888888888888882ccccccc000000000000000000000000
888886666665666666656666666655666656666666556666665666665566688888887777cccccce8877788888888888882cccccc000000000000000000000000
888866666665666666656666666656666656666666566666655666665666668888877777ccccce888788888888888888882ccccc000000000000000000000000
888855555555555555556666666656666656666665566666656666665666666888877777ccccce888788888888888888882ccccc000000000000000000000000
888866cccccc666cccc5c666666656666656666665666666656666665666666888877777cccce88888888655555888888882cccc000000000000000000000000
888866cccccc666ccc55c666666555555555555555555555555555555555555888877777cccce88888888688885888888882cccc000000000000000000000000
888866cccccc666ccc5cc66666656cccccc66ccc5cc66cccccc65cccccc6666888877777cccce88888888677775888888882cccc000000000000000000000000
8888ddcccccdd66cccacc66666656cccccc66ccc5cc66cccccc65cccccc6666888877777cccce88888888677775888888882cccc000000000000000000000000
8888ddcccccdd66ccc5cc66666656cccccc66ccc5cc66cccccc65cccccc6666888877777cccce88888888688885888888882cccc000000000000000000000000
8888dd66666dd66666566666666a6ddcccc6ddccaccddcccccddacccccc6666888877777cccce888888886a88a5888888882cccc000000000000000000000000
8888dddd666dddd66656666666656ddcccc6ddcc5ccddcccccdd5cccccc6666888877777cccce88888888605505888888882cccc000000000000000000000000
8888dddd666dddd66656666666656dd66666dd66566dd66666dd56666666666888877777cccce88888888666667888888882cccc000000000000000000000000
98881661666166166656666666656dddd666dddd566dddd666dd5d666666666888877777ccccce888888888888888888882ccccc000000000000000000000000
98881661666166166656666666656dddd666dddd566dddd666dd5d666666666888887777ccccce888888888888888888882ccccc000000000000000000000000
888855555555555555566666666561661666166156616616661651666666666888888888cccccce8888888888888888882cccccc000000000000000000000000
988855555555555555556666666561661666166156616616661651666666666888888888ccccccce88888888888888882ccccccc000000000000000000000000
9888885555555555555555aaaaa55555555555555555555555555555511111888888888acccccccee8888888888888822ccccccc000000000000000000000000
88888885555555555555555555555555555555555555555555555555558888888888888accccccccce8888888888882ccccccccc000000000000000000000000
000888888000000008888888888888888888888888000000000888888888888888888000ccccccccccee8888888822cccccccccc000000000000000000000000
000888888000000008888888888888888888888888000000000888888888888888888000cccccccccccceeeeeeeecccccccccccc000000000000000000000000
ccccccccc00000000ccccccccccccccccccccccccc000000000ccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000
ccccccccc00000000ccccccccccccccccccccccccc000000000ccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000
cccccccccc000000ccccccccccccccccccccccccccc0000000cccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000
ccccccccccc0000ccccccccccccccccccccccccccccc00000ccccccccccccccccccccccccccccccccccccccccccccccccccccccc000000000000000000000000
22cccc55ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc777cccccccccc
222cc555ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc7777ccccc77777ccccc777c
22225555cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc777ccccccccccccccc7777777cccc777777cccc77777
22222555ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc77777ccccccccccccc77777777ccc7777777ccc777777
22222555ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc777cccccccccc777777ccccccccccc77777777777cc7777777cc7777777
22222255cccccccccccccccc66ccccccccccccccccccccccccccccccccccccccccc777777ccccccccc777777ccccccccccc777777777777c666666ccc7777777
22222225ccccccccccccccc666cccccccccccccccccccccccccccccccccccccccc77777777cccccccc666666ccccccccc77777777777777cccccccccc6666666
22222222cccccccccccccc66666cccccccccccccccccceccccccccccccccccccc7777777777cccccccccccccccccccccc777777777777777cccccccccccccccc
22cccc55cccccccccccc66666665ccccccccccccccccee2cccccccccccccccccc6777777777cccccccccccccc7777cccc777777777777777cccccccccccccccc
222cc555ccccccccccc666566665555ccccccccccce2ee22cccccccccccccccccc6666666cccc77ccccccc777777777cc777777777777777ccc77ccccc7777cc
22225555cccccccccc6666666655555cccccccccceeee2222cccccccccccccccccccccccccc7777cccc777777777777cc666667777777777cc7777ccc777777c
22255555cccccccc6666666566555555555cccceeeeee2222cccccccccccccccccccccccccc77777ccc77777777777ccc666666666666666cc77777cc7777777
22555555ccccccc666665655655555555555ccce22ee222222cccccccccccccccccccccccc777777ccc66777777777ccccccccccccccccccc7777777c7777777
25555555ccccccc656666656655555555555ee2eeee22222222ccccccccccccccccccccccc666666cccc666666666cccccccccccccccccccc7777777c7777777
55555555cccccc66666665665555555555552eeeeee22222222ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc77777cc6666666
55555555cccccc66666665666555555555555eee2e2222222222ccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc6666ccccccccc
ccccccccccccc6666656566655555555555555555522222222222ccccccccccccccccc33333ccccccccccccccccccccccccccccccc663333636d63cccccccccc
cccccccccccc66666566666555555555555555555522222222222cccccccccccccccc33333333ccccccccccccccccccccccccccc33633dd633553dcccccccccc
cccccccccccc66666666665555555555555555555522222222222ccccccccccccc33333333333cccccccccccccccccccccccccc3365566dddd53556ccccccccc
ccccccccccc6666656665555555555555555555555522222222222cccccccccccc33333333333ccccccccccccccccccccccccc636550666d650305d3cccccccc
cccccccccc666666565555555555555555555555555222222222222ccccccccccc3333333333333ccccccccccc366dddcccccc66550006dd300005d3cccccccc
cccccccccc6666656655555555555555555555555552222222222222cccccccccc3333333333333ccccccccc633d3d6dccccc636500006d66000005366cccccc
cccccccc56666656655555555555555555555555555522222222222222ccccccccc333333333333cccccccc663d63336ccccc665500006dd600000566666cccc
ccccccc566666666655555555555555555555555555555222222222222ccccccccc333333333cccccccccc6655066d36cccc66550000006d3000000366666ccc
cccccc555556666655555555555555555555555555555552222222222222cccccccccc444444cccccccccc655000663d666635000000006d3000000366666666
ccccc55555566665555555555555555555555555555555552222222222222ccccccccc444444ccccccccc6550000063366663300000000333666000d66666666
cccc5555555566555555555555555555555555555555555522222222222222cccccccc444444ccccccccc6550000006d66666666666666d3d666666666666666
ccc55555555555555555555555555555555555555555555552222222222222ccccccc444444ccccccccc355000000063aa6aaa6aaa6aaa56da6aaa6aaa6aaa6a
cc5555555555555555555555555555555555555555555555522222222222222cccccc444444ccccccccc355000000033aa6aaa6aaa6aaa633a6aaa6aaa6aaa6a
c555555555555555555555555555555555555555555555555522222222222222cccc4444444ccccccccc35000000003366666666666666633666666666666666
5555555555555555555555555555555555555555555555555552222222222222cccc444444444ccccccc6500000000d366666666666666666666666666666666
5555555555555555555555555555555555555555555555555552222222222222cc444444444444cccccc6500000000d666666666666666666666666666666666
__map__
9797979797979797979797020202020297979797979797979797979797979797979786860202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202
0202020202020297020202970202020297970202020202029781020286848686879786860202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202
9702020202029702970297020202020297020202020202028702020202868686979786868686868602020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202
97979797970e02a8a9979702979797020202020202020202020202020286868686970202868686860202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202aaab
12970202021f02b8b9020202020802120202020202020202020202020286868686970202868686860202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202babb
101010101014101003101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010bcbd
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
0202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202
0202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202
0202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202
af02020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202
ae02020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202
bebf101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010
1111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
0101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010111110101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010111110101010101010101010101010101
0202020202020202020202020202020202020202020202020202020202020202020202020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202020202020202020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202020202020202020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202020202020202020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0202020202020202020202020202020202020202020202020202020202020202020202020000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1010101010101010101010101010101010101010101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111111111111111111111111111111111111111111111111111111111111111111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0101010101010101010101010101010101010101010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000404142434445464748494a4b4c
10101010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000505152535455565758595a5b5c
11111111111111111111111111111111111111111111111100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000111111111111111111111111111111111100000000000000000000000000000000000000606162636465666768696a6b6c
01010101010101010101010101010101010101010101010101010101010101010101010101010101010100000000000000000000000000000000000000000000000000000000000000000000000000010101010101010101010101010101010100000000000000000000000000000000000000707172737475767778797a7b7c
