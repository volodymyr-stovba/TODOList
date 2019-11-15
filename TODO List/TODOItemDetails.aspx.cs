using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TODO_List
{
    public partial class TODOItemDetails : System.Web.UI.Page
    {
        protected void LoadItem(int id)
        {
            Entities db = new Entities();
            var item = db.TodoItems.FirstOrDefault(i => i.Id == id);

            if (item != null)
            {
                this.Description.Text = item.Description;
                this.AddedAt.Text = item.AddedAt.ToString("yyyy-MM-dd");
                this.WasDone.Checked = item.WasDone != 0;
                this.WasDoneAt.Text = item.WasDoneAt.ToString("yyyy-MM-dd");
                this.DueDate.Text = item.DueDate?.ToString("yyyy-MM-dd") ?? "";
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Request.QueryString["id"] != null && Int32.TryParse(Request.QueryString["id"], out int id))
                {
                    LoadItem(id);
                }
            }
        }

        protected void Back_Click(object sender, EventArgs e)
        {
            Response.Redirect("TODOGrid.aspx");
        }

    }
}