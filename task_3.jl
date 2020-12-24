function mark_all!(r::Robot) #главная функция

    num_vert = moves!(r, Sud)
    num_hor = moves!(r, West)
    #Робот в Юго-Западном углу
       
    putmarker!(r)
    putmarkers!(r,Ost)
    #Робот в Юго-Восточном углу, вся нижняя линия промаркерована
       
    while isborder(r,Nord)==false
        move!(r,Nord)
        putmarker!(r)
        if isborder(r,Ost)==false
            putmarkers!(r,Ost)
        else
            putmarkers!(r,West)
        end
    end
    #Робот поставил маркеры по всему полю 
     
    moves!(r,West)
    moves!(r,Sud)
    moves!(r,Ost,num_hor)
    moves!(r,Nord,num_vert)
    #Робот - в исходном положении
   
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
    for _ in 1:num_steps
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

function mark_all!(r::Robot) #главная функция

    num_vert = moves!(r, Sud)
    num_hor = moves!(r, West)
    #Робот в Юго-Западном углу
       
    putmarker!(r)
    putmarkers!(r,Ost)
    #Робот в Юго-Восточном углу, вся нижняя линия промаркерована
       
    while isborder(r,Nord)==false
        move!(r,Nord)
        putmarker!(r)
        if isborder(r,Ost)==false
            putmarkers!(r,Ost)
        else
            putmarkers!(r,West)
        end
    end
    #Робот поставил маркеры по всему полю 
     
    moves!(r,West)
    moves!(r,Sud)
    moves!(r,Ost,num_hor)
    moves!(r,Nord,num_vert)
    #Робот - в исходном положении
   
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
    for _ in 1:num_steps
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

