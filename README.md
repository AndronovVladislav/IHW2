# Андронов Владислав Артёмович, БПИ213
# Вариант 5
# Условие задачи
Разработать программу, заменяющую все строчные гласные буквы
в заданной ASCII-строке заглавными.
## Компиляция
__gcc -O0 -fno-asynchronous-unwind-tables -fcf-protection=none -march=x86-64 pure_c.c -S -o pure_c.s__

__gcc main.s funcs.s__
## На 9
Выполнены необходимые требования: представлена программы на Си и её дизассемблированная версия, никакие комментарии в которой не представлены, так как полностью вручную написана программа на ассемблере(оговорено с лектором) и представлена в виде двух единиц компиляции, во всех программах используются локальные переменные и параметры функций вместо глобальных переменных, имплементирована работа с файлами, добавлено несколько тестовых файлов(в частности, исходный код программы на Си), добавлен генератор случайных наборов данных(для того, что запустить программу для работы с файлами: ./filename input_filename output_filename, для работы со случайными наборами данных ./filename --random output_filename), добавлены замеры по времени, результаты представлены ниже.

Тестовые прогоны не представлены в силу неудобства для проверяющих, поэтому предлагается запустить программу на исходных кодах и дополнительных входных файлах.

![image](https://user-images.githubusercontent.com/97717897/201477808-9a1a68e5-a611-48fe-b523-ce69ef44931a.png)

Обе программы работают линейно, однако программа на ассемблере работает значительно быстрее. Заметно, что при увелечении размера данных в 10 раз, время работы программы на Си увеличивается в 100 раз, а время работы программы на ассемблере - в 10. Также видим, что происходит взрывное увеличение количества времени на данных того же размера, что и буфер. Также стоит отметить, что программы работали своё "настоящее" время, они не зацикливались(потому что программа на Си работает значительно дольше ассемблерной), чтобы сохранить эквивалентность между логиками программ(также обсуждалось с лектором).

Сравнение ассемблерного файла с файлом на Си, оптимизированном с помощью флагов -O0, -O1, -O2, -O3, -Ofast, -Os:
![image](https://user-images.githubusercontent.com/97717897/201479921-b039143c-b452-4ee4-8dba-7d48c8ad288d.png)

Как видим, флаги -O2/3/fast дают значительный прирост в скорости выполнения программы, однако никакой из них не делает программу быстрее написанной вручную, сделать код короче написанного вручную позволяет только флаг -О3.

Также видим, что флаги -O0/1/2/3/s дают размер исполняемого файла, меньше, чем размер исполняемого файла, порождаемого ассемблерным кодом, написанным вручную, -Ofast же напротив, заметно повышает размер исполняемого файла, чтобы обеспечить максимальное быстродействие.
