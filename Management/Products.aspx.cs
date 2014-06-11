using System;
using System.Drawing;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class Management_Products : System.Web.UI.Page
{
    private string connectionString = WebConfigurationManager.ConnectionStrings["VITTORINOConnectionString1"].ConnectionString;
    SqlCommand cmd;
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Send_Click(object sender, EventArgs e)
    {
        Boolean result = false;
        if( insertProductData())
            result = pictureFileUpload();
        if(result)
            Response.Redirect(Request.Url.OriginalString);
    }

    private Boolean insertProductData()
    {
        Boolean result = false;
        string insertSQL = "INSERT INTO [Products] (ProductName, Category, Price, ImageName, Description) VALUES(";
        insertSQL += "@ProductName, @Category, @Price, @ImageName, @Description)";
        SqlConnection con = new SqlConnection(connectionString);

        cmd = new SqlCommand(insertSQL, con);
        cmd.Parameters.AddWithValue("@ProductName", tbNewName.Text);
        cmd.Parameters.AddWithValue("@Category", dlNewCategory.SelectedValue);
        cmd.Parameters.AddWithValue("@Price", double.Parse(tbNewPrice.Text));
        cmd.Parameters.AddWithValue("@ImageName", tbNewFileName.Text);
        cmd.Parameters.AddWithValue("@Description", tbNewDescription.Text);

        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            lblUpload.Text = "Product information is added successful!!";
            result = true;
        }
        catch (Exception err)
        {
            lblUpload.Text = "Error inserting record.";
            lblUpload.Text += err.Message;
        }
        finally
        {
            con.Close();
        }
        return result;
    }

    private Boolean pictureFileUpload()
    {
        Boolean result = false;
        string path = @"C:\VITTORINO\images\products\";
        string imageName = tbNewFileName.Text;
        string ext, filePath, fileName, newFileName, newThumbName;

        
        //Picture upload
        fileName = FileUpload.PostedFile.FileName;
        if (string.IsNullOrEmpty(fileName))
        {
            lblUpload.Text = "Attach picture file!!";
            return false;
        }
        ext = Path.GetExtension(fileName);
        newFileName = imageName + ext;
        filePath = Path.Combine(path, newFileName);
        FileUpload.SaveAs(filePath);

        //Create thumbnail
        System.Drawing.Image orig = System.Drawing.Image.FromFile(filePath);
        int thumbWidth, thumbHeight;
        int oWidth = orig.Width;
        int oHeight = orig.Height;
        double rate;
        if (oWidth > oHeight)
        {
            thumbWidth = 160;
            rate = (double)oHeight / oWidth;
            thumbHeight = (int)(160 * rate);
        }
        else
        {
            thumbHeight = 160;
            rate = (double)oWidth / oHeight;
            thumbWidth = (int)(160 * rate);
        }

        System.Drawing.Image thumbImage = orig.GetThumbnailImage(thumbWidth, thumbHeight, delegate { return false; }, IntPtr.Zero);
        newThumbName = "thumb_" + newFileName;
        filePath = Path.Combine(path, newThumbName);
        thumbImage.Save(filePath);

        //Thumbnail upload
        /*fileName = ThumbUpload.PostedFile.FileName;
        if (string.IsNullOrEmpty(fileName))
        {
            lblUpload.Text = "Attach thumbnail!!";
            return false;
        }
        ext = Path.GetExtension(fileName);
        newThumbName = "thumb_" + imageName + ext;
        filePath = Path.Combine(path, newThumbName);
        ThumbUpload.SaveAs(filePath);*/

        string insertSQL = "INSERT INTO [ProductPictures] (ImageName, ImageURL, ThumbURL) VALUES(";
        insertSQL += "@ImageName, @ImageURL, @ThumbURL)";
        SqlConnection con = new SqlConnection(connectionString);

        cmd = new SqlCommand(insertSQL, con);
        cmd.Parameters.AddWithValue("@ImageName", imageName);
        cmd.Parameters.AddWithValue("@ImageURL", newFileName);
        cmd.Parameters.AddWithValue("@ThumbURL", newThumbName);

        try
        {
            result = true;
            con.Open();
            cmd.ExecuteNonQuery();
            lblUpload.Text = "File upload successful!!";
            Response.Redirect(Request.Url.OriginalString);
        }
        catch (Exception err)
        {
            lblUpload.Text = "Error inserting record.";
            lblUpload.Text += err.Message;
        }
        finally
        {
            con.Close();
        }
        return result;
    }
}
