using Erow.WebControlLib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Erow.Common;
using System.Text;
using Erow.Common;
using Erow.WebControlLib;
using Microsoft.Practices.EnterpriseLibrary.Data;
using System.Data.Common;
using System.Data;
using System.Text;
using System.Text;

public partial class PM_ReformMonitor_UcPushAscx : UserControlBase
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btn_pushagain_Click(object sender, EventArgs e)
    {
        List<UcGridViewContainer> ucGridViewContainer = ControlHelper.GetControls<UcGridViewContainer>(this.Page.Controls);
        string Rostr = "";
        UcGridView gridView = ucGridViewContainer[1].UserControl.Grid;
        foreach (GridViewRow gvr in gridView.Rows)
        {
            if ((gvr.Cells[0].Controls[0] as CheckBox).Checked)
            {
                Rostr +="'"+ gridView.DataKeys[gvr.RowIndex].Value.ToString() + "' ";
            }
        }
        Rostr = Rostr.Trim().Replace(" ", ",");
        if (string.IsNullOrEmpty(Rostr))
        {
            Page.Alert("至少选择一条数据!");
            return;
        }

        string sql = "update reform_monitor_push set delete_flag =0,operation='推送' where row_guid in (" + Rostr + ")";
        Database db = DatabaseFactory.CreateDatabase(ConnString.BizReadOnly);
        DbCommand cmd = db.GetSqlStringCommand(sql);
        db.ExecuteNonQuery(cmd);
        Page.Alert("已推送!");
        Page.ReloadPage();
    }

    protected void btn_cancel_Click(object sender, EventArgs e)
    {
        List<UcGridViewContainer> ucGridViewContainer = ControlHelper.GetControls<UcGridViewContainer>(this.Page.Controls);
        string Rostr = "";
        UcGridView gridView = ucGridViewContainer[1].UserControl.Grid;
        foreach (GridViewRow gvr in gridView.Rows)
        {
            if ((gvr.Cells[0].Controls[0] as CheckBox).Checked)
            {
                Rostr +="'"+gridView.DataKeys[gvr.RowIndex].Value.ToString() + "' ";
            }
        }
        Rostr = Rostr.Trim().Replace(" ", ",");
        if (string.IsNullOrEmpty(Rostr))
        {
            Page.Alert("至少选择一条数据!");
            return;
        }

        string sql = "update reform_monitor_push set delete_flag =-1,operation='取消' where row_guid in (" + Rostr + ")";
        Database db = DatabaseFactory.CreateDatabase(ConnString.BizReadOnly);
        DbCommand cmd = db.GetSqlStringCommand(sql);
        db.ExecuteNonQuery(cmd);
        Page.Alert("已取消!");
        Page.ReloadPage();
    }

}