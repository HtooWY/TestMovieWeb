using System;
using Facebook;
using Newtonsoft.Json.Linq;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Dynamic;
using System.Net;
using System.IO;
using System.Collections.Specialized;
using System.Web;
using System.Web.UI.WebControls;
using RestSharp;



namespace TestMovieWeb
{
    public partial class TestMovie : System.Web.UI.Page
    {
        private string overview="";
        private string videourl= "";
        private JToken json = null;
        public string Overview { get { return overview; } }
        public JToken Jtoken { get { return json; } }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            // Create database if no database is created
            Boolean createdb = false;
            if (createdb)
            {
                DatabaseQuery.CreateDb();
                //DatabaseQuery.CreateTable(GetJson());
            }
            JToken json = null;


            if (!JToken.DeepEquals(json, Program.GetJson()))
            {

                json = Program.GetJson();
                Program.GetInfo(json);
                this.json = json;
                foreach (JToken j in json)
                {
                    DatabaseQuery.UpdateTable(j);
                }
            }
        }


    }
}