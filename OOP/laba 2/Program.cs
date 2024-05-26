using System;
using System.Collections;

namespace laba_2
{
    public partial class Student
    {
        private readonly int id;
        private string lastname;
        private string firstname;
        public string Firstname
        {
            get { return firstname; }
            set { firstname = value; }
        }
        private string patronymic;
        public string Patronymic
        {
            get { return patronymic; }
            set { patronymic = value; }
        }
        private string address;
        public string Address
        {
            get { return address; }
            set { address = value; }
        }
        private string birthday;
        public string Birthday
        {
            get { return birthday; }
            set { birthday = value; }
        }
        private string number;
        public string Number
        {
            get { return number; }
            set { number = value; }
        }
        private string faculty;
        public string Faculty
        {
            get { return faculty; }
            set { faculty = value; }
        }
        private int course;
        private double group;
        public double Group
        {
            get { return group; }
            set { 
                if (value < 1 || value > 12)
                {
                    group = 0;
                }
                else
                {
                    group = value;
                }
            }
        }
        //Не менее трех конструкторов
        public Student(int i, string l, string f, string p, string a, string b, string n, string fac, int c, double g)
        { id = i; lastname = l; firstname = f; patronymic = p; address = a; birthday = b; number = n; faculty = fac; course = c; group = g; count++; }
        public Student(int iii)
        { id = iii; lastname = "unknown"; firstname = "unknown"; patronymic = "unknown"; address = "unknown"; number = "unknown"; faculty = "unknown"; course = 0; group = 0; count++; }
        public Student(int ii, string ll, string ff, string pp)
        { id = ii; lastname = ll; firstname = ff; patronymic = pp; address = "Gamarnika street"; number = "+375295786976"; faculty = "FIT"; course = 2; group = 4; count++; }

        //Статический конструктор
        static Student()
        {
            Console.WriteLine("Students:");
        }
        //закрытый конструктор
        //private Student() {
        //public static double e = Math.E;
        //}

        //поле- константу
        public const string city = "Minsk";

        //в одном из методов класса для работы с аргументами используйте
        //ref - и out-параметры.
        public void Translate(out int Plus)
        {
            Plus = course + 1;
            course = Plus;
        }

        public void Leave(ref int Minus)
        {
            course -= Minus;
        }

        /*создайте в классе статическое поле, хранящее количество созданных 
        объектов (инкрементируется в конструкторе) и статический 
        метод вывода информации о классе.*/

        public static int count;
        public Student(int x, string y)
        {
            count++;
            this.id = x;
            this.lastname = y;
            Student.count++;
        }

        /* переопределяете методы класса Object: Equals, для сравнения объектов,
        GetHashCode; для алгоритма вычисления хэша руководствуйтесь 
        стандартными рекомендациями, ToString – вывода строки –
        информации об объекте.*/
        public override int GetHashCode()
        {
            Console.WriteLine($"Hashcode of lastname: {lastname.GetHashCode()}");
            return lastname.GetHashCode();
        }
        public override bool Equals(object obj)
        {
            if (obj.GetType() != this.GetType()) return false;
            return base.Equals(obj);
        }
        public override string ToString()
        {
            return $"{id}\t{lastname}\t{firstname}\t{patronymic}\t{address}\t{birthday}\t{number}|t{faculty}\t{course}\t{group}\t{city}";
        }

        //Создать массив объектов.
        public static void Array()
        {
            var Student = new Student[6];
            Student[0] = new Student(1, "Boikov", "Anton", "Vladimirovich", "Gamarnika street", "22-01-2004" , "+375446758293", "FIT", 2, 2 );
            Student[1] = new Student(1, "Moroz", "Pavel", "AAleksandrovich", "Plehanova street", "02-09-2003", "+375449908293", "TOV", 2, 1);
            Student[2] = new Student(1, "Himyak", "Maxim", "Denisovich", "Sverdlova street", "20-09-2004", "+375448768293", "FIT", 1, 2);
            Student[3] = new Student(1, "Nikiforovich", "Dmitriy", "Artyomovich", "Koltsova street", "13-04-2004", "+375445558293", "FIT", 2, 2);
            Student[4] = new Student(1, "Lobanov", "Vladimir", "Igorevich", "Kozlova street", "08-12-2003", "+375442328293", "HTIT", 2, 5);
            Student[5] = new Student(1, "Petrov", "Alexey", "Vladimirovich", "Yakubova street", "10-02-2004", "+375444548293", "FIT", 2, 2);

            //a) список студентов заданного факультета;
            Console.WriteLine("Введите название факультета: ");
            string j = Console.ReadLine();
            foreach(var d in Student)
                if(d.faculty == j)
                {
                    Console.WriteLine(d);
                }
            //d) список учебной группы.
            Console.WriteLine("Введите номер группы: ");
            int s = int.Parse(Console.ReadLine());
            foreach (var h in Student)
                if (h.course == s)
                {
                    Console.WriteLine(h);
                }
        }
        public void GetInfo()
        {
            Console.WriteLine("___________________________________________________________________________________________________________________________________________________________");
            Console.WriteLine($"Id: {id} | Lastname: {lastname} | Firstname: {firstname} | Patronymic: {patronymic} | Address: {address} | Birthday: {birthday} | Number: {number} | Faculty: {faculty} | Course: {course} | Group: {group} | City: { city}");
            Console.WriteLine("___________________________________________________________________________________________________________________________________________________________");
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            Student Anton = new Student(1, "Boikov", "Anton", "Vladimirovich", "Gamarnika street", "22-01-2004", "+375446758293", "FIT", 2, 2);
            Student Tom = new Student(2);
            Tom.Group = 3;
            double number = Tom.Group;
            Student Dima = new Student(3, "Nikiforovich", "Dmitriy", "Artyomovich", "Gamarnika street", "22-01-2004", "+375446758293", "FIT", 2, 2);
            int y;
            Anton.Translate(out y);
            Anton.GetInfo();
            Tom.GetInfo();
            int x = 2;
            Dima.Leave(ref x);
            Dima.GetInfo();
            Dima.GetHashCode();
            Tom.GetHashCode();
            Console.WriteLine(Tom.ToString());
            bool r = Tom.Equals(Anton);
            bool rr = Tom.Equals(Tom);
            Console.WriteLine($"Tom-Anton: {r}\tTom-Tom: {rr}");
            Console.WriteLine($"Количество: {Student.count}");
            Student.Array();
            //анонимный тип
            var user = new { lastname = "Ivanov", name = "Pavel" };
            Console.WriteLine(user.lastname);
        }
    }
}

