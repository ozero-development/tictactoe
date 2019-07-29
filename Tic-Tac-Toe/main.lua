-- Tic-tac-toe
print("Project: Tic-tac-toe");

-- Эмблемы:

GlobalEmblem_1 = "google-logo.png"
GlobalEmblem_2 = "yandex-logo.png"

WhoNow = 1 -- Кто сейчас ходит? 1: Перый игрок, -1: Второй игрок

-- Создаем массив, в котором хранится информация о занятости клетки. Крестик: 1, Нолик: -1
ProcessPlay = {0, 0, 0, 0, 0, 0, 0, 0, 0}

-- Помещаем наш бэкграунд в перемунную background
local background = display.newRect(display.contentWidth, display.contentHeight, 0, 0);
background.x = display.contentCenterX -- Центруем по иксу
background.y = display.contentCenterY -- Центруеи по игреку

-- Эта функция отвечает за отрисовку поля
function drawPlayground(squareSize, thickness) -- Аргументы: Размер одной из девяти частей поля, толщина линий
  -- Запомним размер ячейки
  GlobalSize = squareSize
  -- Рисуем 2 гориронтальные линии
  local line1 = display.newRect(display.contentCenterX, display.contentCenterY - squareSize/2, squareSize*3, thickness) -- Верхняя
  local line2 = display.newRect(display.contentCenterX, display.contentCenterY + squareSize/2, squareSize*3, thickness) -- Нижняя
  -- Рисуем 2 вертикальные линии
  local line3 = display.newRect(display.contentCenterX - squareSize/2, display.contentCenterY, thickness, squareSize*3) -- Левая
  local line4 = display.newRect(display.contentCenterX + squareSize/2, display.contentCenterY, thickness, squareSize*3) -- Правая

  -- Создаем 9 кнопок
  -- Верхний ряд
  button1 = display.newRect(display.contentCenterX, display.contentCenterY - squareSize, squareSize, squareSize) -- Верхняя центральная кнопка
  button1.alpha = 0.01 -- Делаем кнопку почти прозрачной, подругому не работает, а заливать поле белым цветон не круто. Костыль!
  button2 = display.newRect(display.contentCenterX - squareSize, display.contentCenterY - squareSize, squareSize, squareSize) -- Верхняя левая кнопка
  button2.alpha = 0.01 -- Делаем кнопку почти прозрачной
  button3 = display.newRect(display.contentCenterX + squareSize, display.contentCenterY - squareSize, squareSize, squareSize) -- Верхняя правая кнопка
  button3.alpha = 0.01 -- Делаем кнопку почти прозрачной
  -- Средний ряд
  button4 = display.newRect(display.contentCenterX, display.contentCenterY, squareSize, squareSize) -- Средняя центральная кнопка
  button4.alpha = 0.01 -- Делаем кнопку почти прозрачной
  button5 = display.newRect(display.contentCenterX - squareSize, display.contentCenterY, squareSize, squareSize) -- Средняя левая кнопка
  button5.alpha = 0.01 -- Делаем кнопку почти прозрачной
  button6 = display.newRect(display.contentCenterX + squareSize, display.contentCenterY, squareSize, squareSize) -- Средняя правая кнопка
  button6.alpha = 0.01 -- Делаем кнопку почти прозрачной

  -- Нижний ряд
  button7 = display.newRect(display.contentCenterX, display.contentCenterY + squareSize, squareSize, squareSize) -- Нижняя центральная кнопка
  button7.alpha = 0.01 -- Делаем кнопку почти прозрачной
  button8 = display.newRect(display.contentCenterX - squareSize, display.contentCenterY + squareSize, squareSize, squareSize) -- Нижняя левая кнопка
  button8.alpha = 0.01 -- Делаем кнопку почти прозрачной
  button9 = display.newRect(display.contentCenterX + squareSize, display.contentCenterY + squareSize, squareSize, squareSize) -- Нижняя правая кнопка
  button9.alpha = 0.01 -- Делаем кнопку почти прозрачной

end

-- Рисуем поле
drawPlayground(220, 3)

-- Если выйграл Гугл, то вывести на экран "Google Won!"
function GoogleWon()

  WhoNow = 0
  print("arWin")
  display.newText("Google Won!", display.contentCenterX, display.contentCenterY, "", 60)

end

-- Если выйграл Яндекс, то вывести на экран "Google Won!"
function YandexWon()

  WhoNow = 0
  print("arWin")
  display.newText("Yandex Won!", display.contentCenterX, display.contentCenterY, "", 60)

end

-- Проверяем нажимал ли ты кнопку №1
function drawEmblem1()
  print("Button 1 has been pressed")

  if WhoNow == 1 then
    if ProcessPlay[1] == 0 then
      local emblem = display.newImageRect(GlobalEmblem_1, 170, 170)
      emblem.x = display.contentCenterX - 220
      emblem.y = display.contentCenterY - 220
      ProcessPlay[1] = 1
      WhoNow = WhoNow * -1
    end
  elseif WhoNow == -1 then
    if ProcessPlay[1] == 0 then
      emblem2 = display.newImageRect(GlobalEmblem_2, 170, 170)
      emblem2.x = display.contentCenterX - 220
      emblem2.y = display.contentCenterY - 220
      ProcessPlay[1] = -1
      WhoNow = WhoNow * -1
    end
  end
  print_r(ProcessPlay)
  Proverka()
end

-- Проверяем нажимал ли ты кнопку №2
function drawEmblem2()
  print("Button 2 has been pressed")

  if WhoNow == 1 then
    if ProcessPlay[2] == 0 then
      local emblem = display.newImageRect(GlobalEmblem_1, 170, 170)
      emblem.x = display.contentCenterX
      emblem.y = display.contentCenterY - 220
      ProcessPlay[2] = 1
      WhoNow = WhoNow * -1
    end
  elseif WhoNow == -1 then
    if ProcessPlay[2] == 0 then
      emblem2 = display.newImageRect(GlobalEmblem_2, 170, 170)
      emblem2.x = display.contentCenterX
      emblem2.y = display.contentCenterY - 220
      ProcessPlay[2] = -1
      WhoNow = WhoNow * -1
    end
  end
  print_r(ProcessPlay)
  Proverka()
end

-- Проверяем нажимал ли ты кнопку №3
function drawEmblem3()
  print("Button 3 has been pressed")

  if WhoNow == 1 then
    if ProcessPlay[3] == 0 then
      local emblem = display.newImageRect("google-logo.png", 170, 170)
      emblem.x = display.contentCenterX + 220
      emblem.y = display.contentCenterY - 220
      ProcessPlay[3] = 1
      WhoNow = WhoNow * -1
    end
  elseif WhoNow == -1 then
    if ProcessPlay[3] == 0 then
      emblem2 = display.newImageRect("yandex-logo.png", 170, 170)
      emblem2.x = display.contentCenterX + 220
      emblem2.y = display.contentCenterY - 220
      ProcessPlay[3] = -1
      WhoNow = WhoNow * -1
    end
  end
  print_r(ProcessPlay)
  Proverka()
end

-- Проверяем нажимал ли ты кнопку №4
function drawEmblem4()
  print("Button 4 has been pressed")

  if WhoNow == 1 then
    if ProcessPlay[4] == 0 then
      local emblem = display.newImageRect("google-logo.png", 170, 170)
      emblem.x = display.contentCenterX - 220
      emblem.y = display.contentCenterY
      ProcessPlay[4] = 1
      WhoNow = WhoNow * -1
    end
  elseif WhoNow == -1 then
    if ProcessPlay[4] == 0 then
      emblem2 = display.newImageRect("yandex-logo.png", 170, 170)
      emblem2.x = display.contentCenterX - 220
      emblem2.y = display.contentCenterY
      ProcessPlay[4] = -1
      WhoNow = WhoNow * -1
    end
  end
  print_r(ProcessPlay)
  Proverka()
end

-- Проверяем нажимал ли ты кнопку №5
function drawEmblem5()
  print("Button 5 has been pressed")

  if WhoNow == 1 then
    if ProcessPlay[5] == 0 then
      local emblem = display.newImageRect("google-logo.png", 170, 170)
      emblem.x = display.contentCenterX
      emblem.y = display.contentCenterY
      ProcessPlay[5] = 1
      WhoNow = WhoNow * -1
    end
  elseif WhoNow == -1 then
    if ProcessPlay[5] == 0 then
      emblem2 = display.newImageRect("yandex-logo.png", 170, 170)
      emblem2.x = display.contentCenterX
      emblem2.y = display.contentCenterY
      ProcessPlay[5] = -1
      WhoNow = WhoNow * -1
    end
  end
  print_r(ProcessPlay)
  Proverka()
end

-- Проверяем нажимал ли ты кнопку №6
function drawEmblem6()
  print("Button 6 has been pressed")

  if WhoNow == 1 then
    if ProcessPlay[6] == 0 then
      local emblem = display.newImageRect("google-logo.png", 170, 170)
      emblem.x = display.contentCenterX + 220
      emblem.y = display.contentCenterY
      ProcessPlay[6] = 1
      WhoNow = WhoNow * -1
    end
  elseif WhoNow == -1 then
    if ProcessPlay[6] == 0 then
      emblem2 = display.newImageRect("yandex-logo.png", 170, 170)
      emblem2.x = display.contentCenterX + 220
      emblem2.y = display.contentCenterY
      ProcessPlay[6] = -1
      WhoNow = WhoNow * -1
    end
  end
  print_r(ProcessPlay)
  Proverka()
end

-- Проверяем нажимал ли ты кнопку №7
function drawEmblem7()
  print("Button 7 has been pressed")

  if WhoNow == 1 then
    if ProcessPlay[7] == 0 then
      local emblem = display.newImageRect("google-logo.png", 170, 170)
      emblem.x = display.contentCenterX - 220
      emblem.y = display.contentCenterY + 220
      ProcessPlay[7] = 1
      WhoNow = WhoNow * -1
    end
  elseif WhoNow == -1 then
    if ProcessPlay[7] == 0 then
      emblem2 = display.newImageRect("yandex-logo.png", 170, 170)
      emblem2.x = display.contentCenterX - 220
      emblem2.y = display.contentCenterY + 220
      ProcessPlay[7] = -1
      WhoNow = WhoNow * -1
    end
  end
  print_r(ProcessPlay)
  Proverka()
end

-- Проверяем нажимал ли ты кнопку №8
function drawEmblem8()
  print("Button 8 has been pressed")

  if WhoNow == 1 then
    if ProcessPlay[8] == 0 then
      local emblem = display.newImageRect("google-logo.png", 170, 170)
      emblem.x = display.contentCenterX
      emblem.y = display.contentCenterY + 220
      ProcessPlay[8] = 1
      WhoNow = WhoNow * -1
    end
  elseif WhoNow == -1 then
    if ProcessPlay[8] == 0 then
      emblem2 = display.newImageRect("yandex-logo.png", 170, 170)
      emblem2.x = display.contentCenterX
      emblem2.y = display.contentCenterY + 220
      ProcessPlay[8] = -1
      WhoNow = WhoNow * -1
    end
  end
  print_r(ProcessPlay)
  Proverka()
end

-- Проверяем нажимал ли ты кнопку №9
function drawEmblem9()
  print("Button 9 has been pressed")
  -- Если ходит первый игрок, то нарисовать его эмблему
  if WhoNow == 1 then
    if ProcessPlay[9] == 0 then
      local emblem = display.newImageRect("google-logo.png", 170, 170)
      emblem.x = display.contentCenterX + 220
      emblem.y = display.contentCenterY + 220
      ProcessPlay[9] = 1
      WhoNow = WhoNow * -1
    end
  -- Если ходит второй игрок, то нарисовать его эмблему
  elseif WhoNow == -1 then
    if ProcessPlay[9] == 0 then
      emblem2 = display.newImageRect("yandex-logo.png", 170, 170)
      emblem2.x = display.contentCenterX + 220
      emblem2.y = display.contentCenterY + 220
      ProcessPlay[9] = -1
      WhoNow = WhoNow * -1
    end
  end
  print_r(ProcessPlay) -- Выводит массив, который записывает, какие ячейки заняты
  Proverka() -- Проверяем выйграл ли кто-нибудь
end

-- Заставляем кнопки отслеживать нажатия
button1:addEventListener("tap", drawEmblem2)
button2:addEventListener("tap", drawEmblem1)
button3:addEventListener("tap", drawEmblem3)
button4:addEventListener("tap", drawEmblem5)
button5:addEventListener("tap", drawEmblem4)
button6:addEventListener("tap", drawEmblem6)
button7:addEventListener("tap", drawEmblem8)
button8:addEventListener("tap", drawEmblem7)
button9:addEventListener("tap", drawEmblem9)


-- Прошу не выходить в окно после просмотра следующей функции
function Proverka()
  -- Начинаем проверку горизонтальных случаев
  if ProcessPlay[1] == 1 and ProcessPlay[2] == 1 and ProcessPlay[3] == 1 then
    GoogleWon()
  elseif ProcessPlay[1] == -1 and ProcessPlay[2] == -1 and ProcessPlay[3] == -1 then
    YandexWon()
  elseif ProcessPlay[4] == 1 and ProcessPlay[5] == 1 and ProcessPlay[6] == 1 then
    GoogleWon()
  elseif ProcessPlay[4] == -1 and ProcessPlay[5] == -1 and ProcessPlay[6] == -1 then
    YandexWon()
  elseif ProcessPlay[7] == 1 and ProcessPlay[8] == 1 and ProcessPlay[9] == 1 then
    GoogleWon()
  elseif ProcessPlay[7] == -1 and ProcessPlay[8] == -1 and ProcessPlay[9] == -1 then
    YandexWon()
  -- Начинаем проверку вертикальных случаев
  elseif ProcessPlay[1] == 1 and ProcessPlay[4] == 1 and ProcessPlay[7] == 1 then
    GoogleWon()
  elseif ProcessPlay[1] == -1 and ProcessPlay[4] == -1 and ProcessPlay[7] == -1 then
    YandexWon()
  elseif ProcessPlay[2] == 1 and ProcessPlay[5] == 1 and ProcessPlay[8] == 1 then
    GoogleWon()
  elseif ProcessPlay[2] == -1 and ProcessPlay[5] == -1 and ProcessPlay[8] == -1 then
    YandexWon()
  -- Начинаем проверку косых случаев
  elseif ProcessPlay[1] == 1 and ProcessPlay[5] == 1 and ProcessPlay[9] == 1 then
    GoogleWon()
  elseif ProcessPlay[1] == -1 and ProcessPlay[5] == -1 and ProcessPlay[9] == -1 then
    YandexWon()
  elseif ProcessPlay[3] == 1 and ProcessPlay[5] == 1 and ProcessPlay[7] == 1 then
    GoogleWon()
  elseif ProcessPlay[3] == -1 and ProcessPlay[5] == -1 and ProcessPlay[7] == -1 then
    YandexWon()
  elseif ProcessPlay[3] == 1 and ProcessPlay[6] == 1 and ProcessPlay[9] == 1 then
    GoogleWon()
  elseif ProcessPlay[3] == -1 and ProcessPlay[6] == -1 and ProcessPlay[9] == -1 then
    YandexWon()
  end

end

-- При вызове, функция выводит массив, который записывает, какие ячейки заняты
function print_r(arr, indentLevel)
    local str = ""
    local indentStr = "#"

    if(indentLevel == nil) then
        print(print_r(arr, 0))
        return
    end

    for i = 0, indentLevel do
        indentStr = indentStr.."\t"
    end

    for index,value in pairs(arr) do
        if type(value) == "table" then
            str = str..indentStr..index..": \n"..print_r(value, (indentLevel + 1))
        else
            str = str..indentStr..index..": "..value.."\n"
        end
    end
    return str

end
