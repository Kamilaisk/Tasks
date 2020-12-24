function mark_lestnica!(r::Robot) #главная функция
    num_vert = moves!(r, Sud)
    num_hor = moves!(r, West)
    #Робот в Юго-Западном углу
       
    putmarker!(r)
    k = putmarkers_0!(r,Ost)
    #Робот в Юго-Восточном углу, вся нижняя линия промаркерована

    for i in 1:k
        if isborder(r,Nord) == false
            if isborder(r,West) == false
                move!(r,West)
                move!(r,Nord)
                putmarker!(r)
                putmarkers!(r,West)
            else
                move!(r,Nord)
                putmarker!(r)
                putmarkers_2!(r,Ost,k-i)
            end
        end
    end
    #Робот сделал лестницу

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

#Всюду в заданном направлении ставит маркеры вплоть до перегородки, но в исходной клетке маркер не ставит и считает количество сделанных шагов
function putmarkers_0!(r::Robot,side::HorizonSide)
    num_k=0
     while isborder(r,side)==false
         move!(r,side)
         putmarker!(r)
         num_k+=1
     end
     return num_k
 end

 #Возвращает изначально сделанные шаги, но также ставит маркеры
 function putmarkers_2!(r::Robot, side::HorizonSide, num_steps::Int)
    for _ in 1:num_steps
        move!(r,side)
        putmarker!(r)
    end
end
