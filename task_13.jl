function mark_kross_x(r::Robot) #главная функция
    for side in ((Nord,Ost),(Sud,Ost),(Sud,West),(Nord,West))
        putmarkers!(r,side)
        move_by_markers!(r,inverse(side))
    end
    putmarker!(r)
end

#вспомогательные функции, которые уже были использованы в прошлых задачах
putmarkers!(r::Robot,side::NTuple{2,HorizonSide}) = while isborder(r,side)==false move!(r,side) end

isborder(r::Robot,side::NTuple{2,HorizonSide}) = (isborder(r,side[1] || isborder(r,side[2]))

HorizonSideRobots.move!(r::Robot, side::NTuple{2,HorizonSide}) = for s in side move!(r,s) end

move_by_markers!(r::Robot,side::NTuple{2,HorizonSide}) = while ismarker(r) move!(r,side) end

inverse(side::NTuple{2,HorizonSide}) = (inverse(side[1]),inverse(side[2]))