function mark_frame_perimetr!(r::Robot) #главная функция  
    num_steps=[]
    while ((isborder(r,Sud)==false) || (isborder(r,West)==false)) #не в Юго-Западном углу
        push!(num_steps, moves!(r, West))
        push!(num_steps, moves!(r, Sud))
    end
    #Робот в Юго-Западном углу и в num_steps - закодирован пройденный путь
   
    for side in (Nord,Ost,Sud,West)
        putmarkers!(r, side)
    end

    k=length(num_steps)
    i = (mod(k, 2) == 1) ? 2 : 1
    #возвращаемся в исходную клетку
    for n in (1:k)
        i=i+1
        t=isodd(i)
        side=Nord
        if (t == true)
            side = Ost
        end
        moves!(r,side,num_steps[k-n+1])
    end 
    #Робот - в исходном положении
end

#вспомогательные функции
#Перемещает Робота в заданном направлении до упора и возвращает число сделанных шагов
function moves!(r,side)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end

#Перемещает Робота в заданном направлении на заданное число шагов
moves!(r,side,num_steps) = for _ in 1:num_steps move!(r,side) end

#Всюду в заданном направлении ставит маркеры вплоть до перегородки, но в исходной клетке маркер не ставит
function putmarkers!(r::Robot, side::HorizonSide)
    while isborder(r,side)==false
    move!(r,side)
    putmarker!(r)
    end
end
