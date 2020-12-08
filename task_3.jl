function mark_all!(r::Robot)
    num_vert = moves!(r, Sud)
    num_hor = moves!(r, Ost)
    #УТВ: Робот - в Юго-Восточном углу
    putmarker!(r)
    
    for i in (0:2)
        side = HorizonSide(i)
        putmarkers!(r, side)
    end

    for j in (3)
        side = HorizonSide(j)
        putmakersek!(r, side)
    end

    for k in (0:3)
        side = HorizonSide(k)
        putmarkersеk!(r, side)
    end

    move!(r, Sud)
    move!(r, Ost)

    moves!(r, Nord, num_vert)
    moves!(r, West, num_hor)
    #УТВ: Робот - в исходном положении
end

function moves!(r::Robot, side::HorizonSide)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end

function moves!(r::Robot,side::HorizonSide,num_steps::Int)
    for _ in 1:num_steps # символ "_" заменяет фактически не используемую переменную
        move!(r,side)
    end
end

function putmarkers!(r::Robot, side::HorizonSide)
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
end

function putmarkersеk!(r::Robot, side::HorizonSide)
    while ismarker(r)==false
        move!(r,side)
        putmarker!(r)
    end
end

