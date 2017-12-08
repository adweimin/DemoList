using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;

/// <summary>
/// tbl_dcs_people 的摘要说明
/// </summary>
public class tbl_dcs_people
{
    public tbl_dcs_people()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }




    #region Model
    private string _people_no;
    public string People_no
    {
        get { return _people_no; }
        set { _people_no = value; }
    }

    private string _isCensus;
    public string IsCensus
    {
        get { return _isCensus; }
        set { _isCensus = value; }
    }

    private string _workUnit;
    public string WorkUnit
    {
        get { return _workUnit; }
        set { _workUnit = value; }
    }

    private string _reg_city;
    public string Reg_city
    {
        get { return _reg_city; }
        set { _reg_city = value; }
    }

    private string _reg_area;
    public string Reg_area
    {
        get { return _reg_area; }
        set { _reg_area = value; }
    }

    private string _reg_street;
    public string Reg_street
    {
        get { return _reg_street; }
        set { _reg_street = value; }
    }

    private string _reg_community;
    public string Reg_community
    {
        get { return _reg_community; }
        set { _reg_community = value; }
    }

    private string _census_addr;
    public string Census_addr
    {
        get { return _census_addr; }
        set { _census_addr = value; }
    }

    private string _address_province;
    public string Address_province
    {
        get { return _address_province; }
        set { _address_province = value; }
    }

    private string _address_city;
    public string Address_city
    {
        get { return _address_city; }
        set { _address_city = value; }
    }

    private string _address_area;
    public string Address_area
    {
        get { return _address_area; }
        set { _address_area = value; }
    }

    private string _address_community;
    public string Address_community
    {
        get { return _address_community; }
        set { _address_community = value; }
    }

    private string _home_no;
    public string Home_no
    {
        get { return _home_no; }
        set { _home_no = value; }
    }

    private string _live_addr;
    public string Live_addr
    {
        get { return _live_addr; }
        set { _live_addr = value; }
    }

    private DateTime? _comeintime=null;
    public DateTime? ComeInTime
    {
        get { return _comeintime; }
        set { _comeintime = value; }
    }

    private DateTime? _leavetime = null;
    public DateTime? LeaveTime
    {
        get { return _leavetime; }
        set { _leavetime = value; }
    }

    private string _leave_reasom;
    public string LeaveReason
    {
        get { return _leave_reasom; }
        set { _leave_reasom = value; }
    }

    private string _educate;
    public string Educate
    {
        get { return _educate; }
        set { _educate = value; }
    }

    private string _merry;
    public string Merry
    {
        get { return _merry; }
        set { _merry = value; }
    }

    private string _reasonDesc;
    public string ReasonDesc
    {
        get { return _reasonDesc; }
        set { _reasonDesc = value; }
    }

    private string _politics;
    public string Politics
    {
        get { return _politics; }
        set { _politics = value; }
    }

    private string _people_nation;
    public string People_Nation
    {
        get { return _people_nation; }
        set { _people_nation = value; }
    }

    private string _people_name;
    public string People_name
    {
        get { return _people_name; }
        set { _people_name = value; }
    }

    private string _peopletype;
    public string PeopleType
    {
        get { return _peopletype; }
        set { _peopletype = value; }
    }

    private string _peopletypekind;
    public string PeopleTypeKind
    {
        get { return _peopletypekind; }
        set { _peopletypekind = value; }
    }

    private string _peopletypedesc;
    public string PeopleTypeDesc
    {
        get { return _peopletypedesc; }
        set { _peopletypedesc = value; }
    }


    private string _livesource;
    public string LiveSource
    {
        get { return _livesource; }
        set { _livesource = value; }
    }

    private string _interest;
    public string Interest
    {
        get { return _interest; }
        set { _interest = value; }
    }

    private string _interestdesc;
    public string InterestDesc
    {
        get { return _interestdesc; }
        set { _interestdesc = value; }
    }

    private string _reg_people;
    public string RegPeople
    {
        get { return _reg_people; }
        set { _reg_people = value; }
    }

    private DateTime _update_datetime;
    public DateTime Update_datetime
    {
        get { return _update_datetime; }
        set { _update_datetime = value; }
    }

    private string _cancel_status;
    public string Cancel_status
    {
        get { return _cancel_status; }
        set { _cancel_status = value; }
    }

    private string _people_sex;
    public string People_sex
    {
        get { return _people_sex; }
        set { _people_sex = value; }
    }

    private DateTime? _cancel_datetime;
    public DateTime? Cancel_datetime
    {
        get { return _cancel_datetime; }
        set { _cancel_datetime = value; }
    }

    private string _is_dead;
    public string Is_dead
    {
        get { return _is_dead; }
        set { _is_dead = value; }
    }

    private DateTime? _dead_time;
    public DateTime? Dead_time
    {
        get { return _dead_time; }
        set { _dead_time = value; }
    }

    private string _remark ;
    public string Remark
    {
        get { return _remark; }
        set { _remark = value; }
    }

    private DateTime? _born_time=null;
    public DateTime? Born_time
    {
        get { return _born_time; }
        set { _born_time = value; }
    }

    private string _identity_card ;
    public string Identity_card
    {
        get { return _identity_card; }
        set { _identity_card = value; }
    }

    private string _mobile;
    public string Mobile
    {
        get { return _mobile; }
        set { _mobile = value; }
    }

    private string _isisolate;
    public string IsIsolate
    {
        get { return _isisolate; }
        set { _isisolate = value; }
    }

    private string _reg_province;
    public string Reg_province
    {
        get { return _reg_province; }
        set { _reg_province = value; }
    }

    private string _carno;
    public string Carno
    {
        get { return _carno; }
        set { _carno = value; }
    }

    private string _cartel;
    public string Cartel
    {
        get { return _cartel; }
        set { _cartel = value; }
    }

    private string _carpk;
    public string Carpk
    {
        get { return _carpk; }
        set { _carpk = value; }
    }
    #endregion


}