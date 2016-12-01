﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;
using Newtonsoft.Json.Linq;

namespace TestMovieWeb
{
    class DatabaseQuery
    {
        //Create new Database
        public static void CreateDb()
        {
            String query;
            using (SqlConnection myConn = new SqlConnection())
            {
                myConn.ConnectionString = "Server=localhost; Integrated security=SSPI;";
                query = "CREATE DATABASE test;";

                SqlCommand myCommand = new SqlCommand(query, myConn);
                try
                {
                    myConn.Open();
                    myCommand.ExecuteNonQuery();

                }
                catch (System.Exception ex)
                {

                }
                finally
                {
                    if (myConn.State == ConnectionState.Open)
                    {
                        myConn.Close();
                    }
                }
            }
        }

        // Create movie table
        public static void CreateTable(JToken json)
        {
            String query;

            // get table column names            
            JObject keys = json.Value<JObject>();
            List<String> keylist = keys.Properties().Select(p => p.Name).ToList();

            // get query string
            query = "CREATE TABLE Movie (";
            foreach (String k in keylist)
            {
                query = query + k + " varchar(225),";
            }
            query = query + " PRIMARY KEY(id));";

            using (SqlConnection myConn = new SqlConnection())
            {
                myConn.ConnectionString = "Server=localhost; Database=test; Trusted_Connection=true";
                SqlCommand myCommand = new SqlCommand(query, myConn);
                try
                {
                    myConn.Open();
                    myCommand.ExecuteNonQuery();

                }
                catch (System.Exception ex)
                {

                }
                finally
                {
                    if (myConn.State == ConnectionState.Open)
                    {
                        myConn.Close();
                    }
                }
            }
        }

        // Update the table with record
        public static void UpdateTable(JToken json)
        {
            String query;

            // get table column names
            JObject keys = json.Value<JObject>();
            List<String> keylist = keys.Properties().Select(p => p.Name).ToList();

            query = "INSERT INTO Movie VALUES(";
            foreach (String k in keylist)
            {
                query += "'" + json[k].ToString() + "'";
                int i = keylist.IndexOf(k);
                if (i != keylist.Count - 1)
                {
                    query += ",";
                }
            }
            query += ");";

            string query2 = "IF NOT EXISTS(SELECT * from Movie where id='" + json["id"].ToString() + "')BEGIN " + query + " END;";
            using (SqlConnection myConn = new SqlConnection())
            {
                myConn.ConnectionString = "Server=localhost; Database=test; Trusted_Connection=true";
                SqlCommand myCommand = new SqlCommand(query2, myConn);
                try
                {
                    myConn.Open();
                    myCommand.ExecuteNonQuery();
                    Console.WriteLine("Record inserted Successfully");
                }

                catch (System.Exception ex)
                {

                }
                finally
                {
                    if (myConn.State == ConnectionState.Open)
                    {
                        myConn.Close();
                    }
                }
            }
        }
    }
}
