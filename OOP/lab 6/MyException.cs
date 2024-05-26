using System;
using System.Collections.Generic;
using System.Text;

namespace lab_6
{
    class MException : Exception
    {
        public new string Message;
        public MException(string message, string year) : base(message)
        {
            Message = $"MindException({year}): " + message;
        }
    }
    class HException : Exception
    {
        public new string Message;
        public HException(string message, string power) : base(message)
        {
            Message = $"HumanException({power}): " + message;
        }
    }
}
