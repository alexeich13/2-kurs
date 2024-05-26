using System;

namespace _5_lab
{
    class Program
    {
        static int ModPow(int x, int y, int z) => y == 0 ? 1 : (x * ModPow(x, y - 1, z)) % z;

        static void Main()
        {
            int p = 13, q = 7, e = 5, d = 29;
            int n, c = 0, m, r = 0;
            string s;
            n = p * q;
            Console.Write("Сообщение: ");
            s = Console.ReadLine();
            m = Convert.ToInt32(s);
            Console.WriteLine(m);
            Console.WriteLine("Открытый ключ: ({0},{1})", e, n);
            Console.WriteLine("Секретный ключ: ({0},{1})", d, n);
            if (m >= 0 && m < (n - 1))
            {
                c = ModPow(m, e, n);
                Console.WriteLine("Шифрование: {0} ", c);
                r = ModPow(c, d, n);
                Console.WriteLine("Дешифрование: {0} ", r);
            }
            else Console.WriteLine("Слишком большое число");
            Console.ReadLine();
        }
    }
}
