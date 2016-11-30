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
        private JToken json = null;
        private JToken popularjson = null;
        public string Overview { get { return overview; } }
        public JToken Jtoken { get { return json; } }
        public JToken popular { get { return popularjson; } }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            // Create database if no database is created
            Boolean createdb = false;
            if (createdb)
            {
                DatabaseQuery.CreateDb();
                //DatabaseQuery.CreateTable(GetJson());
            }
            JToken upcoming = null;
            JToken popular = null;

            if (!JToken.DeepEquals(upcoming, Program.GetJson("upcoming")))
            {
                upcoming = Program.GetJson("upcoming");
                Program.GetInfo(upcoming);
                this.json = upcoming;
                foreach (JToken j in json)
                {
                    DatabaseQuery.UpdateTable(j);
                }
            }

            // Get popular movies
            popular = Program.GetJson("popular");
            Program.GetInfo(popular);
            this.popularjson = popular; 

        }
    }
}