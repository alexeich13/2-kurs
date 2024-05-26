using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace lab_7
{
    public class CollectionType<T> : IGenericInterface<T> where T : class
    {
        private List<T> collection = null;
        public List<T> Collection
        {
            get
            {
                if (collection == null)
                {
                    throw new NullReferenceException();
                }
                else
                {
                    return collection;
                }
            }

            set
            {
                collection = value;
            }
        }

        public void Add(T element)
        {
            collection.Add(element);
        }

        public void Delete(T element)
        {
            collection.Remove(element);
        }

        public void Show()
        {
            foreach (T item in collection)
            {
                Console.WriteLine(item.ToString());
            }
        }
    }
}
