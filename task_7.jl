function mark_chess!(r::Robot) #Главная функция
    num_vert = moves!(r, Sud)
    num_hor = moves!(r, West)
       #Робот в Юго-Западном углу
       
       mark_chess!(r,Ost,2) 
       #Маркируем первую строчку через одну
       
       while !isborder(r,Nord)
           move!(r,Nord)
           if !isborder(r,Ost)
               mark_chess!(r,Ost,2)
           else
               mark_chess!(r,West,2)
           end
       end
   
       moves!(r,West)
       moves!(r,Sud)
       moves!(r,Ost,num_hor)
       moves(r,Nord,num_vert)
   
   end

#вспомогательные функции
#ставит маркеры в шахматном порядке
function mark_chess!(r::Robot,side::HorizonSide,num::Int)
    num_steps=0
    while isborder(r,side)==false
        if mod(num_steps,2)==mod(num,2)
             putmarker!(r)
         end
        move!(r,side)
    num_steps+=1
       end
       return num_steps
    num_steps+=1                                        
       if mod(num_steps,2)==mod(num,2)
           putmarker!(r)
       end
   end



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