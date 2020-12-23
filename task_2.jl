function mark_frame_perimetr!(r::Robot)
    num_vert = moves!(r, Sud)
    num_hor = moves!(r, Ost)
    #Робот - в Юго-восточном углу

    for i in (0:3)
        side = HorizonSide(i)
        putmarkers!(r, side)
    end
    #По всему периметру стоят маркеры

    moves!(r, Nord, num_vert)
    moves!(r, West, num_hor)
    #Робот - в исходном положении
end

#вспомогательные функции
function moves!(r::Robot, side::HorizonSide)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end

function moves!(r::Robot,side::HorizonSide,num_steps::Int)
    for _ in 1:numsteps #символ "_" заменяет неиспользуемую переменную
        move!(r,side)
    end
end

function putmarkers!(r::Robot, side::HorizonSide)
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
end