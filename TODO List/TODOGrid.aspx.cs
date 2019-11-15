using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TODO_List
{
    public partial class TODOGrid : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack && this.TODOGridView != null)
            {
                Entities db = new Entities();
                this.TODOGridView.DataSource = db.TodoItems.ToList();
                this.TODOGridView.DataBind();
            }
        }

        protected void TODOGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Entities db = new Entities();
            this.TODOGridView.PageIndex = e.NewPageIndex;
            this.TODOGridView.DataSource = db.TodoItems.ToList();
            this.TODOGridView.DataBind();
        }

        protected void TODOGridView_Sorting(object sender, GridViewSortEventArgs e)
        {
            Entities db = new Entities();
            this.TODOGridView.DataSource = SortItems(db.TodoItems, e.SortExpression + e.SortDirection);
           
            this.TODOGridView.DataBind();
        }

        private List<TodoItem> SortItems(System.Data.Entity.DbSet<TodoItem> items, string sort)
        {
            List<TodoItem> result;
            switch (sort)
            {
                default:
                    result = items.OrderBy(item => item.Id).ToList();
                    break;
                case "TODOItemIDAscending":
                    result = items.OrderBy(item => item.Id).ToList();
                    break;
                case "TODOItemIDDescending":
                    result = items.OrderByDescending(item => item.Id).ToList();
                    break;
                case "DescriptionAscending":
                    result = items.OrderBy(item => item.Description).ToList();
                    break;
                case "DescriptionDescending":
                    result = items.OrderByDescending(item => item.Description).ToList();
                    break;
                case "AddedAtAscending":
                    result = items.OrderBy(item => item.AddedAt).ToList();
                    break;
                case "AddedAtDescending":
                    result = items.OrderByDescending(item => item.AddedAt).ToList();
                    break;
                case "AddedByAscending":
                    result = items.OrderBy(item => item.AddedBy).ToList();
                    break;
                case "AddedByDescending":
                    result = items.OrderByDescending(item => item.AddedBy).ToList();
                    break;
                case "WasDoneAscending":
                    result = items.OrderBy(item => item.WasDone).ToList();
                    break;
                case "WasDoneDescending":
                    result = items.OrderByDescending(item => item.WasDone).ToList();
                    break;
            }
            return result;
        }

        protected void TODOGridView_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string userId = e.Row.Cells[3].Text;
                Entities db = new Entities();

                var item = db.AspNetUsers.FirstOrDefault(i => i.Id == userId);

                if (item != null)
                {
                    e.Row.Cells[3].Text = item.UserName;
                }
                e.Row.Cells[4].Text = e.Row.Cells[4].Text != "0" ? "True" : "False";

                if(e.Row.FindControl("EditButton") != null)
                {
                    ((LinkButton)e.Row.FindControl("EditButton")).PostBackUrl += "?id=" + e.Row.Cells[0].Text;
                }              
            }
        }
    }
}