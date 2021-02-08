using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Proj
{
    public class DataAccess
    {
        private string _DBConnectionString;

        public DataAccess()
        {
            _DBConnectionString = ConfigurationManager.ConnectionStrings["DBConnection"].ConnectionString;
        }

        public void InsertTask(string name, string desc, Guid project, string client, DateTime start, DateTime end)
        {
            string queryString = "dbo.Task_Ins";
            using (SqlConnection connection = new SqlConnection(_DBConnectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@name", name);
                command.Parameters.AddWithValue("@description", desc);
                command.Parameters.AddWithValue("@project", project);
                command.Parameters.AddWithValue("@client", client);
                command.Parameters.AddWithValue("@start", start);
                command.Parameters.AddWithValue("@end", end);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex);
                }
            }
        }

        public void UpdateTask(Guid TaskID, string name, string desc, Guid project, string client, DateTime start, DateTime end)
        {
            string queryString = "dbo.Task_Upd";
            using (SqlConnection connection = new SqlConnection(_DBConnectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@taskID", TaskID);
                command.Parameters.AddWithValue("@name", name);
                command.Parameters.AddWithValue("@description", desc);
                command.Parameters.AddWithValue("@project", project);
                command.Parameters.AddWithValue("@client", client);
                command.Parameters.AddWithValue("@start", start);
                command.Parameters.AddWithValue("@end", end);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex);
                }
            }
        }

        public DataTable SelectLastWeekTasks()
        {
            string queryString = "dbo.LastWeekTasks_Sel";
            using (SqlConnection connection = new SqlConnection(_DBConnectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                SqlDataAdapter Adapter = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    Adapter.Fill(dt);
                    connection.Close();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex);
                }
                return dt;
            }
        }

        public DataTable SelectProjects()
        {
            string queryString = "dbo.Project_Sel";
            using (SqlConnection connection = new SqlConnection(_DBConnectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.CommandType = CommandType.StoredProcedure;
                DataTable dt = new DataTable();
                SqlDataAdapter Adapter = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    Adapter.Fill(dt);
                    connection.Close();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex);
                }
                return dt;
            }
        }

        public void InsertProject(string name)
        {
            string queryString = "dbo.Project_Ins";
            using (SqlConnection connection = new SqlConnection(_DBConnectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@name", name);
                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex);
                }
            }
        }

        public DataTable SelectProjectSummary(DateTime day)
        {
            string queryString = "dbo.WeeklyProjectSummary_Sel";
            using (SqlConnection connection = new SqlConnection(_DBConnectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@day", day);
                DataTable dt = new DataTable();
                SqlDataAdapter Adapter = new SqlDataAdapter(command);
                try
                {
                    connection.Open();
                    Adapter.Fill(dt);
                    connection.Close();
                }
                catch (Exception ex)
                {
                    System.Diagnostics.Debug.WriteLine(ex);
                }
                return dt;
            }
        }
    }
}