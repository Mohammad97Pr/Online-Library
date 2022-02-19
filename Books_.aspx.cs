using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Books_ : System.Web.UI.Page
{
    static string global_filepath;
    static int global_actual_stock, global_current_stock, global_issued_books;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fill();
        }
    }
    public void fill()
    {
        String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
        string sql = "select * from Books ";
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grid_Books.DataSource = dt;
        grid_Books.DataBind();
    }
    protected void grid_Books_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "down")
        {


            String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            int j = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid_Books.Rows[j];

            SqlConnection con = new SqlConnection(cs);
            Label file = (Label)row.FindControl("lbl_path1");
            if (file.Text != string.Empty)
            {
                if (file.Text.EndsWith(".txt"))
                {
                    Response.ContentType = "application/txt";
                }
                else if (file.Text.EndsWith(".pdf"))
                {
                    Response.ContentType = "application/pdf";
                }
                else if (file.Text.EndsWith(".docx"))
                {
                    Response.ContentType = "application/docx";
                }
                else
                {
                    Response.ContentType = "image/jpg";
                }

                string filePath = file.Text;

                Response.AddHeader("Content-Disposition", "attachment;filename=\"" + filePath + "\"");
                Response.TransmitFile(Server.MapPath(filePath));
                Response.End();
                //string sql = "";
                //sql = "update files set downloads=downloads+1 where file_id=@file";
                //SqlCommand cmd = new SqlCommand(sql, con);
                //cmd.Parameters.AddWithValue("@file", row.Cells[0].Text);
                //con.Open();
                //cmd.ExecuteNonQuery();
                //con.Close();


            }




        }

        if (e.CommandName == "del")
        {


            String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            int j = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid_Books.Rows[j];
            SqlConnection con = new SqlConnection(cs);
            Label file1 = (Label)row.FindControl("lbl01");
            var c = Convert.ToInt32(BoundField.ThisExpression.Equals("f"));
            SqlCommand cmd = new SqlCommand("delete from books where book_id='" + file1.Text + "'", con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('" + "your book deleted" + "');</script>");


            fill();
        }
        if (e.CommandName == "view")

        {
            String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);
            int j = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = grid_Books.Rows[j];
            Label file = (Label)row.FindControl("lbl_path1");

            string filePath = Server.MapPath(file.Text);
            WebClient user = new WebClient();
            Byte[] FileBuffer = user.DownloadData(filePath);
            if (FileBuffer != null)
            {
                if (file.Text.EndsWith(".pdf"))
                {
                    Response.ContentType = "application/pdf";
                }
                if (file.Text.EndsWith(".docx"))

                {

                    Response.Write("<script>alert('" + "only pdf" + "');</script>");
                    return;

                }
                Response.AddHeader("content-length", FileBuffer.Length.ToString());
                Response.BinaryWrite(FileBuffer);
            }

        }
    }
    void addNewBook()
    {
        try
        {
            string genres = "";
            foreach (int i in ListBox1.GetSelectedIndices())
            {
                genres = genres + ListBox1.Items[i] + ",";
            }
            // genres = Adventure,Self Help,
            genres = genres.Remove(genres.Length - 1);

            string filepath = "~/book_inventory/books1.png";
            string filename = Path.GetFileName(FileUpload1.PostedFile.FileName);
            FileUpload1.SaveAs(Server.MapPath("Book_image/" + filename));
            filepath = "~/Book_image/" + filename;


            String cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            SqlConnection con = new SqlConnection(cs);

            string ext = System.IO.Path.GetExtension(FileUpload0.FileName);
            string file_name = Path.GetFileName(FileUpload0.PostedFile.FileName);
            FileUpload0.SaveAs(Server.MapPath("Book_files") + "\\" + file_name + ext);
            string path = "~\\Book_files\\" + file_name + ext;

            SqlCommand cmd = new SqlCommand("insert into books(book_name,b_lan,auther_name,genre,pub_name,pub_date,edition_,page,description_book,img_link,book_path,downloads) values(@name, @language,@author_name,@genre,@publisher_name,@publish_date,@edition,@no_of_pages,@book_description,@book_img_link,@path1,@downs)", con);

            cmd.Parameters.AddWithValue("@name", book_name.Text.Trim());
            cmd.Parameters.AddWithValue("@genre", genres);
            cmd.Parameters.AddWithValue("@author_name", txt_auther.Text.Trim());
            cmd.Parameters.AddWithValue("@publisher_name", txt_publisher.Text.Trim());
            cmd.Parameters.AddWithValue("@publish_date", pub_date.Text.Trim());
            cmd.Parameters.AddWithValue("@language", ddl_lan.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@edition", txt_ed.Text.Trim());
            cmd.Parameters.AddWithValue("@no_of_pages", txt_pages.Text.Trim());
            cmd.Parameters.AddWithValue("@book_description", txt_desc.Text.Trim());
            cmd.Parameters.AddWithValue("@book_img_link", filepath);
            cmd.Parameters.AddWithValue("@path1", path);
            cmd.Parameters.AddWithValue("@downs", 0);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Book added successfully.');</script>");
            fill();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('" + ex.Message + "');</script>");
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        addNewBook();
    }
}