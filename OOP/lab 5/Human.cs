using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace lab_5
{
    public class Human : Mind
    {
        private string name;
        public virtual string Name
        {
            get { return name; }
            set { name = value; }
        }
        private string power;
        public string Power
        {
            get { return power; }
            set { power = value; }
        }
        private string year;
        public string Year
        {
            get { return year; }
            set { year = value; }
        }
        public Human(string _name, string _power, string _type, string _year)
        {
            Type = _type;
            Name = _name;
            Year = _year;
            Power = _power;

        }
        public Human()
        { }
        public override string ToString()
        {
            string rez = this.Type + this.Name + this.Year + this.Power;
            return rez;
        }
    }
}
