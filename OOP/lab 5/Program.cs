using System;
using System.Collections.Generic;

namespace lab_5
{
    class Program
    {
        static void Main(string[] args)
        {
            Transformer transform1 = new Transformer("auto", "2001", "Optimus", "600");
            Human human1 = new Human("Soldier", "Fred", "2001", "100");
            Human human2 = new Human("Soldier", "Nick", "2001", "100");
            List<object> arm1 = new List<object> { transform1, human1, human2};
            Army army = new Army();
            army.mainList = arm1;

            army.PrintElems();
            Transformer transform2 = new Transformer("decipt", "2003", "Megatron", "800");
            army.Add(transform2);
            army.Remove(2);
            Console.WriteLine("------------------------------------");
            army.PrintElems();
            Console.WriteLine("------------------------------------");

            Controller cntrl = new Controller();
            cntrl.Search(army, "2001");
            army.PrintElems();
            cntrl.Print(army, "600");
            cntrl.ElementCounter(army);
        }
    }
}
