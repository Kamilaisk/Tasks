function mark_all!(r::Robot) #Главная функция

    num_vert = moves!(r, Sud)
    num_hor = moves!(r, West)
       #Робот-в Юго-Западном углу
       
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
       #Робот поставил маркеры по всему периметру 
     
       moves!(r,West)
       moves!(r,Sud)
       moves!(r,Ost,num_hor)
       moves!(r,Nord,num_vert)
   
end

#вспомогательные функции
function moves!(r::Robot,side::HorizonSide,num_steps::Int) #Вспомогательная функция
    for _ in 1:num_steps
        move!(r,side)
    end
end

function putmarkers!(r::Robot, side::HorizonSide)
    while isborder(r,side)==false
    move!(r,side)
    putmarker!(r)
    end
end

function moves!(r::Robot, side::HorizonSide)
    num_steps=0
    while isborder(r,side)==false
         move!(r,side)
         num_steps+=1
    end
    return num_steps
end
