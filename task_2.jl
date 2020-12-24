function mark_frame_perimetr!(r::Robot) #главная функция  
    num_vert = moves!(r, Sud)
    num_hor = moves!(r, Ost)
    #Робот в Юго-Восточном углу

    for i in (0:3)
        side = HorizonSide(i)
        putmarkers!(r, side)
    end
    #По периметру стоят маркеры

    moves!(r, Nord, num_vert)
    moves!(r, West, num_hor)
    #Робот в исходном положении
end

#вспомогательные функции

#Перемещает робота в заданном направлении и считает шаги
function moves!(r::Robot, side::HorizonSide) 
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end

#Перемещает робота в заданном направлении по заданному количетсву шагов
function moves!(r::Robot,side::HorizonSide,num_steps::Int)
    for _ in 1:numsteps #символ "_" заменяет неиспользуемую переменную
        move!(r,side)
    end
end

#Всюду в заданном направлении ставит маркеры вплоть до перегородки, но в исходной клетке маркер не ставит
function putmarkers!(r::Robot, side::HorizonSide)
    while isborder(r,side)==false
        move!(r,side)
        putmarker!(r)
    end
end
