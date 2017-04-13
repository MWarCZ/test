using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using testVG.library;

namespace testVG.unit_test
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMethod1()
        {
            
        }
        [TestMethod]
        public void Test_GiveMeValue()
        {
            GiveMeValue gmv = new GiveMeValue();

            Assert.AreEqual(0, gmv.GetValue() );

            gmv.SetValue(5);
            Assert.AreEqual(5, gmv.GetValue());

        }
    }
}
