function mark_angles(r)
    num_steps = through_rectangles_into_angle(r,(Sud,West))
    # Робот в Юго-Западном углу и в num_steps - закодирован пройденный путь
    for side in (Nord,Ost,Sud,West)
        movements!(r,side) # возвращаемый результат игнорируется
        putmarker!(r)
    end
    #Маркеры поставлены и Робот - в юго-западном углу
    movements!(r,(Ost,Nord),num_steps)
    #Робот - в исходном положении
end

# Перемещает Робота в заданный угол, прокладывая путь межу внутренними прямоугольными перегородками и возвращает массив, содержащий числа шагов в каждом из заданных направлений на этом пути
function through_rectangles_into_angle(r,angle::NTuple{2,HorizonSide})
    num_steps=[]
    while isborder(r,angle[1])==false || isborder(r,angle[2]) # Робот не в Юго-Западном углу
        push!(num_steps, movements!(r, angle[2]))
        push!(num_steps, movements!(r, angle[1]))
    end
    return num_steps
end

#перемещает Робота по пути, представленного двумя последовательностями, sides и num_steps 
function movements!(r,sides,num_steps::Vector{Int})
    for (i,n) in enumerate(num_steps)
        movements!(r, sides[mod(i-1, length(sides))+1], n)
    end
end