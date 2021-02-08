using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace Proj
{
    public partial class Homepage : System.Web.UI.Page
    {
        private DataAccess _dataAccess;
        private DataTable _dt;
        private DataTable _dt1;
        private DataTable _proj;
        private DataTable _summary;

        public Homepage()
        {
            _dataAccess = new DataAccess();
            _dt = new DataTable();
            _dt1 = new DataTable();
            _proj = new DataTable();
            _summary = new DataTable();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    Page.MaintainScrollPositionOnPostBack = true;
                    _dt1.Rows.InsertAt(_dt1.NewRow(), 0);
                    this.GrvNewTask.DataSource = _dt1;
                    this.GrvNewTask.DataBind();
                    this.C1.Text = (DateTime.Now).ToString("yyyy-MM-dd");
                    LoadTable();
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
        }

        protected void LoadTable()
        {
            DropDownList list = this.GrvNewTask.Rows[0].FindControl("T3") as DropDownList;
            _proj = _dataAccess.SelectProjects();
            list.DataSource = _proj;
            list.DataBind();

            _dt = _dataAccess.SelectLastWeekTasks();
            this.GrvTasks.DataSource = _dt;
            this.GrvTasks.DataBind();
            Generate();
        }

        protected void Save(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                TextBox name = this.GrvNewTask.Rows[e.RowIndex].FindControl("T1") as TextBox;
                TextBox desc = this.GrvNewTask.Rows[e.RowIndex].FindControl("T2") as TextBox;
                DropDownList proj = this.GrvNewTask.Rows[e.RowIndex].FindControl("T3") as DropDownList;
                TextBox client = this.GrvNewTask.Rows[e.RowIndex].FindControl("T4") as TextBox;
                TextBox start = this.GrvNewTask.Rows[e.RowIndex].FindControl("T5") as TextBox;
                TextBox end = this.GrvNewTask.Rows[e.RowIndex].FindControl("T6") as TextBox;
                _dataAccess.InsertTask(name.Text, desc.Text, Guid.Parse(proj.SelectedValue), client.Text, Convert.ToDateTime(start.Text), Convert.ToDateTime(end.Text));
                name.Text = null;
                desc.Text = null;
                client.Text = null;
                start.Text = null;
                end.Text = null;
                LoadTable();
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
        }

        protected void Edit(object sender, GridViewEditEventArgs e)
        {
            this.GrvTasks.EditIndex = e.NewEditIndex;
            LoadTable();
            DropDownList list = this.GrvTasks.Rows[e.NewEditIndex].FindControl("Txb3") as DropDownList;
            list.DataSource = _proj;
            list.DataBind();

            int i = 0;
            string ProjectID = null;
            foreach (DataRow dr in _dt.Rows)
            {
                if (i == e.NewEditIndex)
                {
                    ProjectID = dr["ProjectID"].ToString();
                    break;
                }
                i++;
            }
            list.SelectedValue = ProjectID;
        }
        protected void Update(object sender, GridViewUpdateEventArgs e)
        {
            TextBox name = this.GrvTasks.Rows[e.RowIndex].FindControl("Txb1") as TextBox;
            TextBox desc = this.GrvTasks.Rows[e.RowIndex].FindControl("Txb2") as TextBox;
            DropDownList proj = this.GrvTasks.Rows[e.RowIndex].FindControl("Txb3") as DropDownList;
            TextBox client = this.GrvTasks.Rows[e.RowIndex].FindControl("Txb4") as TextBox;
            TextBox start = this.GrvTasks.Rows[e.RowIndex].FindControl("Txb5") as TextBox;
            TextBox end = this.GrvTasks.Rows[e.RowIndex].FindControl("Txb6") as TextBox;
            int i = 0;
            string TaskID = null;
            LoadTable();
            foreach (DataRow dr in _dt.Rows)
            {
                if (i == e.RowIndex)
                {
                    TaskID = dr["TaskID"].ToString();
                    break;
                }
                i++;
            }

            _dataAccess.UpdateTask(Guid.Parse(TaskID), name.Text, desc.Text, Guid.Parse(proj.SelectedValue), client.Text, Convert.ToDateTime(start.Text), Convert.ToDateTime(end.Text));

            this.GrvTasks.EditIndex = -1;
            LoadTable();
        }
        protected void Cancel(object sender, GridViewCancelEditEventArgs e)
        {
            this.GrvTasks.EditIndex = -1;
            LoadTable();
        }

        protected void SaveProject(object sender, EventArgs e)
        {
            _dataAccess.InsertProject(this.TP.Text);
            this.TP.Text = null;
            LoadTable();
        }

        protected void GenerateSummary(object sender, EventArgs e)
        {
            Generate();
        }

        protected void Generate()
        {
            _summary = _dataAccess.SelectProjectSummary(Convert.ToDateTime(this.C1.Text));
            this.GrvSummary.DataSource = _summary;
            this.GrvSummary.DataBind();

            Dictionary<string, int>  dict = new Dictionary<string, int>();
            int i = 0;
            _proj = _dataAccess.SelectProjects();
            foreach (DataRow dr in _proj.Rows)
            {
                Boolean exists = false;
                for (int j = 0; j < this.chart1.Series.Count; j++)
                {
                    if (this.chart1.Series[j].Name == dr["ProjectID"].ToString())
                        exists = true;
                }
                Series s = new Series(dr["ProjectID"].ToString());
                if (!exists)
                {
                    this.chart1.Series.Add(s);
                }
                dict.Add(dr["ProjectID"].ToString(), i);
                i++;
            }

            foreach (DataRow dr in _summary.Rows)
            {
                int idx = dict[dr["ProjectFK"].ToString()];
                this.chart1.Series[idx].Points.Add(new DataPoint(1, Convert.ToInt32(dr["Mon"])));
                this.chart1.Series[idx].Points.Add(new DataPoint(2, Convert.ToInt32(dr["Tue"])));
                this.chart1.Series[idx].Points.Add(new DataPoint(3, Convert.ToInt32(dr["Wed"])));
                this.chart1.Series[idx].Points.Add(new DataPoint(4, Convert.ToInt32(dr["Thu"])));
                this.chart1.Series[idx].Points.Add(new DataPoint(5, Convert.ToInt32(dr["Fri"])));
                this.chart1.Series[idx].Points.Add(new DataPoint(6, Convert.ToInt32(dr["Sat"])));
                this.chart1.Series[idx].Points.Add(new DataPoint(7, Convert.ToInt32(dr["Sun"])));
            }

            foreach (Series cs in chart1.Series)
                cs.ChartType = SeriesChartType.StackedColumn;
        }
    }
}