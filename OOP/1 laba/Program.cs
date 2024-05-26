using System;
using System.Text;

namespace _1_laba
{
    class Program
    {
        static void Main(string[] args)
        {
            //1a
            int a = 4;
            char b = 'f';
            double c = 1.6;
            Console.WriteLine(a);
            Console.WriteLine(b);
            Console.WriteLine(c);
            Console.WriteLine($"---------");
            //1b
            byte kl = 5;
            short s = kl;
            int i = b;
            long l = b;
            double d = l;
            Console.WriteLine("Short = {0}, Int = {1}, Long = {2}, Double = {3}", s, i, l, d);
            short h = 35;
            byte k = (byte)h;
            Console.WriteLine("Byte = {0}", k);
            Console.ReadLine();
            string n = "45";
            int m = Convert.ToInt32(n);
            Console.WriteLine("Int = {0}", m);
            Console.WriteLine($"---------");
            //1c
            int price = 39;
            Object farm = price;
            Console.WriteLine(farm);
            int price2 = (int)farm;
            Console.WriteLine(price2);
            Console.WriteLine($"---------");
            //1d
            var r = 2.7183;
            Console.WriteLine(r);
            Console.WriteLine($"---------");
            //1e
            Nullable<int> number2 = 5;
            Console.WriteLine(number2);
            Console.WriteLine($"---------");
            //1f
            var f = 36;
            // f = 36.678 не будет работать, так как приоритет больше, чем у других типов данных
            Console.WriteLine($"---------");
            //2a
            string sk1 = "123";
            string s2 = "321";
            string s3 = sk1 + " " + s2;
            string s4 = string.Concat(s3, "123");
            Console.WriteLine(s4);
            Console.WriteLine($"---------");
            //2b
            string str1 = "keylord";
            string str2 = "lord";
            string str3 = str1 + " " + str2;
            Console.WriteLine(str3);
            //объединение
            string str = "12345670";
            string z = str.Substring(0, 3);
            Console.WriteLine(z);
            //копирование
            string s1 = "hello world";
            char ch = 'o';
            int indexOfChar = s1.IndexOf(ch); // равно 4
            Console.WriteLine(indexOfChar);
            //поиск подстроки
            string text = "И поэтому все так произошло";
            string[] words = text.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            foreach (string ll in words)
            {
                Console.WriteLine(ll);
            }
            //разделение строки
            // Вставка подстроки в строку
            string s10 = "Hello ";
            string s11 = s10.Insert(6, "world");
            Console.WriteLine(s11);
            //удаление заданной подстроки
            string tex = "Хороший день";
            // индекс последнего символа
            int ind = tex.Length - 1;
            // вырезаем последний символ
            tex = tex.Remove(ind);
            Console.WriteLine(tex);    // Хороший ден
            //интерполирование
            string name = "Tom";
            int age = 23;
            Console.WriteLine($"Имя: {name}  Возраст: {age}");
            Console.WriteLine($"---------");
            //2c
            string q = String.Empty;
            string nullStr = null; 
            bool bIsEmpty = String.IsNullOrEmpty(q);
            Console.WriteLine(bIsEmpty);
            bool bIEmpty = String.IsNullOrEmpty(nullStr);
            Console.WriteLine(bIEmpty);
            Console.WriteLine($"---------");
            //2d
            var sb = new StringBuilder("Привет мир");
            sb.Append("!");
            sb.Insert(0, "!");
            Console.WriteLine(sb);
            sb.Remove(7, 2);
            Console.WriteLine(sb);
            Console.WriteLine($"---------");
            //3a
            int[,] numbers = { { 1, 2, 3 }, { 4, 5, 6 }, { 7, 8, 9 } };
            int rows = numbers.GetUpperBound(0) + 1;    
            int columns = numbers.Length / rows;                                                             
            for (int ii = 0; ii < rows; ii++)
            {
                for (int j = 0; j < columns; j++)
                {
                    Console.Write($"{numbers[ii, j]} \t");
                }
                Console.WriteLine();
            }
            Console.WriteLine($"---------");
            //3b
            string[] weekDays = new string[] { "Sun", "Mon", "Tue" };
            Console.WriteLine($"Длина массива: {weekDays.Length}" );
            foreach(string kkk in weekDays)
            {
               Console.WriteLine(kkk);
            }
            Console.WriteLine($"---------");
            weekDays[2] = "Fri";
            foreach (string kkk in weekDays)
            {
                Console.WriteLine(kkk);
            }
            Console.WriteLine($"---------");
            
            //3c
            double[][] numb = new double[3][];
            numb[0] = new double[] { 1.5567, 3.87 };
            numb[1] = new double[] { 1.56, 2.09, 3.876 };
            numb[2] = new double[] { 1.34, 2.78, 3.654, 4.896 };
            foreach (double[] row in numb)
            {
                foreach (double num in row)
                {
                    Console.Write($"{num} \t");
                }
                Console.WriteLine();
            }
            //3d
            var hhh = new object[0];
            Console.WriteLine($"---------");
            //4a
            (ulong, int, string, char, string) tuple = (78, 3, "key", 'y', "lor");
            Console.WriteLine($"Кортеж {tuple.Item1} {tuple.Item2} {tuple.Item3} {tuple.Item4} {tuple.Item5}");
            Console.WriteLine($"---------");
            //4b
            Console.WriteLine("Введите элемент ");
            int choice = int.Parse(Console.ReadLine());

            switch (choice)
            {
                case 1: Console.WriteLine(tuple.Item1); break;

                case 2: Console.WriteLine(tuple.Item2); break;


                case 3: Console.WriteLine(tuple.Item3); break;

                case 4: Console.WriteLine(tuple.Item4); break;

                case 5: Console.WriteLine(tuple.Item5); break;
            }
            Console.WriteLine($"---------");
            //4c
            var u = ("Maxim", 18 );
            (string nam, int ag) = u;
            Console.WriteLine($"Name: {nam} Age: {ag}");
            Console.WriteLine($"---------");
            //4d
            (int a, byte b) left = (5, 10);
            (long a, int b) right = (5, 10);
            Console.WriteLine(left == right);  
            Console.WriteLine(left != right);
            Console.WriteLine($"---------");
            //5
            (int, int, int, char) Local(int[] arr, string str)
            {
                int minValue = 11;
                int maxValue = 0;
                int sumArr = 0;
                char firstSymbol = ' ';
                Random random = new Random();
                for (int j = 0; j < arr.Length; j++)
                {
                    arr[j] = random.Next(1, 10);
                }
                for (int i = 0; i < arr.Length - 1; i++)
                {
                    if (arr[i] < minValue)
                    {
                        minValue = arr[i];
                    }
                    if (arr[i] > maxValue)
                    {
                        maxValue = arr[i];
                    }

                    sumArr += arr[i];

                }

                for (int i = 0; i < arr.Length; i++)
                {
                    Console.WriteLine($"{arr[i]}");
                }

                for (int g = 0; g < str.Length; g++)
                {
                    firstSymbol = str[0];
                }
                var result = (minValue, maxValue, sumArr, firstSymbol);
                return result;
            }
            int[] arr1 = new int[5];
            string stri1 = "hkjhk";
            Console.WriteLine(Local(arr1, stri1));
            Console.WriteLine($"---------");
            //6
            int w = 2147483647;
            Console.WriteLine(unchecked(w + 2));
            Console.WriteLine($"---------");
            int x = 2147483647;
            Console.WriteLine(checked(x + 2));
        }
    }
}
    