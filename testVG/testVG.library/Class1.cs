using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace testVG.library
{
    public class GiveMeValue
    {
        private int value;
        public GiveMeValue()
        {

        }

        public int GetValue()
        {
            return this.value;
        }
        public void SetValue(int value)
        {
            this.value = value;
        }
    }
}
