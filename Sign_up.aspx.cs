﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sign_up : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btn00_Click(object sender, EventArgs e)
    {
        try
        {
            MailMessage mailMessage = new MailMessage();
            mailMessage.From = new MailAddress("aboalmajd805@gmail.com");
            mailMessage.To.Add("aboalmajd805@gmail.com");
            mailMessage.Subject = " submit ";


            mailMessage.Body = "<b>first Name : </b>" + txt_fn.Text + "<br/>"
                + "<b>last name : </b>" + txt_ln.Text + "<br/>"+
                "<b>sender mail : </b>" + txt_mail.Text + "<br/>" +
                 "<b>college  : </b>" + ddlcollage.SelectedItem + "<br/>" + "<b>type   : </b>" + ddlprs.SelectedItem;

            mailMessage.IsBodyHtml = true;


            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.EnableSsl = true;
            smtpClient.Credentials = new System.Net.NetworkCredential("aboalmajd805@gmail.com", "engmo_1520_engmoo");
            smtpClient.Send(mailMessage);

            label1.Text = "Thank you for contacting us";

            txt_fn.Enabled = false;
            txt_ln.Enabled = false;
            ddlprs.Enabled = false;
            ddlcollage.Enabled = false;
            txt_mail.Enabled = false;
        }

        catch (Exception ex)
        {
            // Log the exception information to 
            // database table or event viewer
            label1.ForeColor = System.Drawing.Color.Red;
            label1.Text = "There is an unkwon problem. Please try later";
        }
    }

}
