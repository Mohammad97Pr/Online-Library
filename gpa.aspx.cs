﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn_sub_Click(object sender, EventArgs e)
    {
        try
        {
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress("aboalmajd805@gmail.com");
            mailMessage.To.Add("aboalmajd805@gmail.com");
            mailMessage.Subject = " submit ";


            mailMessage.Body = "<b>Sender Name : </b>" + txt_fname.Text + "<br/>"
                + "<b>Sender Email : </b>" + TextBox2.Text + "<br/>"
                + "<b>Comments : </b>" + TextBox3.Text;
            mailMessage.IsBodyHtml = true;


            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.EnableSsl = true;
            smtpClient.Credentials = new System.Net.NetworkCredential("aboalmajd805@gmail.com", "engmo1520_em");
            smtpClient.Send(mailMessage);

            label1.Text = "Thank you for contacting us";

            txt_fname.Enabled = false;
            TextBox2.Enabled = false;
            TextBox3.Enabled = false;

        }

        catch (Exception ex)
        {
            // Log the exception information to 
            // database table or event viewer
            label1.ForeColor = System.Drawing.Color.Red;
            label1.Text = "There is an unkwon problem. Please try later";
        }
    }

    protected void ll_Click(object sender, EventArgs e)
    {
        Response.Redirect("adminlogin.aspx");

    }
}
