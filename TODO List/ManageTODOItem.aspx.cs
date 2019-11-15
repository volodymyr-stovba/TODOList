using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
namespace TODO_List
{
    public partial class ManageTODOItem : System.Web.UI.Page
    {
        protected void LoadUsers()
        {
            Entities db = new Entities();
            var users = db.AspNetUsers.ToList();
            this.AddedBy.DataSource = users;
            this.AddedBy.DataTextField = "UserName";
            this.AddedBy.DataValueField = "Id";
            this.AddedBy.DataBind();
        }

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

        protected void SaveItem(int id)
        {
            Entities db = new Entities();
            var item = db.TodoItems.FirstOrDefault(i => i.Id == id);

            if (item != null)
            {
                item.Description = this.Description.Text;
                item.AddedAt = DateTime.Parse(this.AddedAt.Text);
                item.WasDone = this.WasDone.Checked ? 1 : 0;
                item.DueDate = this.DueDate.Text == "" ? (DateTime?)null : DateTime.Parse(this.DueDate.Text);
                if(item.WasDone == 0 && this.WasDone.Checked && this.WasDoneAt.Text == "")
                {
                    item.WasDoneAt = DateTime.Now;
                }
                else
                {
                    item.WasDoneAt = DateTime.Parse(this.WasDoneAt.Text);
                }
                db.SaveChanges();
            }
        }
        protected void AddNewItem()
        {
            Entities db = new Entities();
            TodoItem item = new TodoItem();
            item.Description = this.Description.Text;
            item.AddedBy = this.AddedBy.SelectedItem.Value;
            item.AddedAt = this.AddedAt.Text == "" ? DateTime.Now : DateTime.Parse(this.AddedAt.Text);
            item.WasDone = this.WasDone.Checked ? 1 : 0;
            item.WasDoneAt = this.WasDoneAt.Text == "" ? DateTime.Now : DateTime.Parse(this.WasDoneAt.Text);
            item.DueDate = this.DueDate.Text == "" ? (DateTime?)null : DateTime.Parse(this.DueDate.Text);
            db.TodoItems.Add(item);
            db.SaveChanges();
        }
            

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                LoadUsers();

                if (Request.QueryString["id"] != null && Int32.TryParse(Request.QueryString["id"], out int id))
                {
                    LoadItem(id);
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null && Int32.TryParse(Request.QueryString["id"], out int id))
            {
                SaveItem(id);
            }
            else
            {
                AddNewItem();
            }
            Response.Redirect("TODOGrid.aspx");
        }
    }
}