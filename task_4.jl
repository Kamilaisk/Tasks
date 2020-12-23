function mark_lestnica!(r::Robot)
    num_vert = moves!(r, Sud)
    num_hor = moves!(r, West)
       #обот - в Юго-Западном углу
       
       putmarker!(r)
       k = putmarkers_0!(r,Ost)
       #Робоот в Юго-Восточном углу, вся нижняя линия промаркерована

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

 function putmarkers_2!(r::Robot, side::HorizonSide, num_steps::Int)
    for _ in 1:num_steps
        move!(r,side)
        putmarker!(r)
    end
end

function putmarkers_0!(r::Robot,side::HorizonSide)
    num_k=0
     while isborder(r,side)==false
         move!(r,side)
         putmarker!(r)
         num_k+=1
     end
     return num_k
 end

                
