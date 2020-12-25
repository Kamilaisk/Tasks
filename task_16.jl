function mark_field(r) #главная функция
    side=Ost
    mark_row(r,side)

    while isborder(r,side)==false
        move!(r,Nord)
        side=inverse(side)
        mark_row(r,side)
    end
    #Робот - у северной границы
end

#вспомогательные функции
function mark_row(r::Robot,side::HorizonSide)
    putmarker!(r)
    while move_if_posible!(r,side) == true
        putmarker!(r)
    end
end

movements!(r::Robot, side::HorizonSide, num_steps::Int) =
    for _ in 1:num_steps
        move_if_posible!(r,side) # обход внутренней перегородки гарантирована
    end