using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;


namespace lab_3
{
    class Program
    {
        static void Main(string[] args)
        {

            Set set1 = new Set();
            Set set2 = new Set();
            Set set3 = new Set();
            Set intnes = new Set();
            Set set4 = new Set();


            set2.Add(5);
            set2.Add(8);
            set2.Add(9);
            set2.Add(6);
            set2.Add(3);
            set2.Add(2);
            set1.Add(1);
            set1.Add(3);
            set1.Add(6);
            set1.Add(8);
            set1.Add(10);
            set3.Add("1 ");
            set3.Add("2 ");
            set3.Add("3 ");
            set3.Add("4 ");
            set3.Add("5 ");
            set3.Add("6 ");
            set4.Add(12);
            set4.Add(11);
            set4.Add(12);
            set4.Add(22);
            set4.Add(33);
            set4.Add(33);
            set4.Add(44);

            Set set1_1 = new Set();
            Set set1_2 = new Set();
            Set set1_3 = new Set();
            Console.Write("прибавление ко множеству, введите число: ");
            int num = Convert.ToInt32(Console.ReadLine());
            set1_1 = set1 + num;

            foreach (var item in set1_1)
            {
                Console.WriteLine(item);
            }


            Console.Write("пересечение множеств: ");
            set1_3 = set1 * set2;
            foreach (var item in set1_3)
            {
                Console.WriteLine(item);
            }
            
            set1_2 = set1 + set2;
            Console.Write("объединение множеств: ");
            foreach (var item in set1_2)
            {
                Console.WriteLine(item);
            }
            
            Console.Write("Преобразование: ");
            Counter counter1 = new Counter { Collection = 40 };
            int x = (int)counter1;
            Console.WriteLine(x);

            Console.Write("false: ");
            if (set1) Console.WriteLine(false);
            else Console.WriteLine(true);

            Console.WriteLine("добавление запятой после каждого слова: ");
            set3.comma(set1);

            Console.WriteLine("Удаление одинаковых переменных ");
            Console.WriteLine("До: ");
            foreach (var a in set4)
            {
                Console.Write(a + " ");
            }
            Console.Write("После: ");
            set4.Distincter();

            StaticOperation.summ(set1);
            int max = StaticOperation.maxmin(set1);
            Console.WriteLine("MAX-MIN=" + max);
            int length = StaticOperation.length(set1);
            Console.WriteLine("Длина:" + length);

            int charcount = StaticOperation.CharCount("asa", 'a');
            Console.WriteLine("string расширение:" + charcount);
        }

    }

}