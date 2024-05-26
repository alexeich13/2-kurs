using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace lab_3
{
    class Set
    {
        public class Production
        {

            Production ID = new Production();
            Production name = new Production();

            class Developer
            {
                Developer FIO = new Developer();
                Developer ID = new Developer();
                Developer Otdel = new Developer();

            }
        };
        public List<int> items = new List<int>();
        public List<double> doubles = new List<double>();
        public List<string> words = new List<string>();
        
        public static bool operator >(Set set, int num)
        {
            bool flag = false;
            foreach (int item in set.items)
            {
                if (item.Equals(num)) // > - проверка на принадлежность
                {
                    flag = true;
                    return flag;
                }
            }
            return flag;
        }

        public static bool operator <(Set set, int num)
        {
            foreach (var item1 in set.items)
            {
                var equals = false;
                foreach (var item2 in set.items)
                {
                    if (item1.Equals(item2)) // < - проверка на подмножество
                    {
                        equals = true;
                        break;
                    }
                }
                if (!equals)
                {
                    return false;
                }
            }
            return true;
        }

        public static Set operator +(Set set1, int number)
        {
            set1.Add(number);
            return set1;
        }
        public static Set operator +(Set set1, Set set2)
        {

            foreach (int count in set2)
            {
                set1.Add(count);
            }
            return set1;
        }

        public static Set operator *(Set set1, Set set2)
        {

            Set result1 = new Set();
            foreach (int count1 in set1)
            {
                foreach (int count2 in set2)
                {
                    if (count2 == count1)
                    {
                        result1.Add(count2);
                    }
                }
            }
            return result1;
        }


        public static bool operator true(Set set1)
        {
            int count = 0;
            foreach (var a in set1)
            {
                count += 1;
            }
            if (count < 15) return true; else return false;

        }
        public static bool operator false(Set set1)
        {
            int count = 0;
            foreach (var a in set1)
            {
                count += 1;
            }
            if (count > 15) return false; else return true;

        }

        public static int Counter(Set set1)
        {
            int count = 0;
            foreach (var a in set1)
            {
                count += 1;
            }
            return count;
        }
        public void Add(int item)
        {
            items.Add(item);
        }

        public void Add(double item)
        {
            if (doubles.Contains(item))
            { //Добавление в множество
                return;
            }
            doubles.Add(item);
        }
        public void Add(string word)
        {

            if (words.Contains(word))
            { //Добавление в множество
                return;
            }
            words.Add(word);
        }
        public void comma(Set set1)
        {
            foreach (var a in set1)
            {
                string b = Convert.ToString(a);
                b = b + ',';
                Console.Write(b);
            }

        }


        public void Remove(int item)
        {
            items.Remove(item);
        }

        public void Distincter()
        {
            var dist = items.Distinct();
            foreach (var a in dist)
            {
                Console.Write(a + " ");
            }
        }
        public IEnumerator GetEnumerator()
        {
            return items.GetEnumerator();
        }
    }

    class Counter
    {
        public int Collection { get; set; }
        public static explicit operator int(Counter counter)
        {
            return counter.Collection;
        }
    }
}
