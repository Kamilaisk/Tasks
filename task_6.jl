function inner_frame!(r::Robot)
    num_steps=[]
    while ((isborder(r,Sud)==false) || (isborder(r,West)==false)) #не в Юго-Западном углу
        push!(num_steps, moves!(r, West))
        push!(num_steps, moves!(r, Sud))
    end
    #Робот в Юго-Западном углу

    str = true
    move!(r, Nord)
    while (isborder(r, Ost)==false)
        if ((isborder(r, Nord)==false) && (isborder(r, Sud)==false))
            (str == true) ? move!(r, Nord) : move!(r, Sud)
        else
            move!(r, Ost)
            isborder(r, Nord) ? move!(r, Sud) : move!(r, Nord)
            str=!str
        end
    end
    #Робот у западной границы внутренней рамкой

    for dir in (Nord,Ost,Sud,West)
        while isborder(r, HorizonSide(mod(Int(dir)-1, 4))) && !(ismarker(r))
            putmarker!(r)
            move!(r, dir)
        end
        if !(ismarker(r))
            putmarker!(r)
            move!(r, HorizonSide(mod(Int(dir)-1, 4)))
        end
    end 
    #Робот поставил по периметру внутренней рамки марки

    putmarker!(r)
    moves!(r,West)
    moves!(r,Sud)
    #Робот в Юго-Западном углу


    k = num_steps
    i = (mod(k, 2) == 1) ? 2 : 1
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
    
#Перемещает Робота в заданном направлении до упора и возвращает число сделанных шагов
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