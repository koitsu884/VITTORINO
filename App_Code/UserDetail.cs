using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserDetail
/// </summary>
/// 

namespace VITTORINO_User
{
    [Serializable]
    public class UserDetail
    {
        private int _customerID;
        private string _usserName;
        private string _password;
        private string _roleName;
        private string _firstName;
        private string _lastName;
        private string _email;
        private string _phone;
        private string _address;

        public UserDetail()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public int CustomerID
        {
            get { return _customerID; }
            set { _customerID = value; }
        }
        public string UserName
        {
            get { return _usserName; }
            set { _usserName = value; }
        }
        public string Password
        {
            get { return _password; }
            set { _password = value; }
        }
        public string RoleName
        {
            get { return _roleName; }
            set { _roleName = value; }
        }
        public string FirstName
        {
            get { return _firstName; }
            set { _firstName = value; }
        }
        public string LastName
        {
            get { return _lastName; }
            set { _lastName = value; }
        }
        public string Email
        {
            get { return _email; }
            set { _email = value; }
        }
        public string Phone
        {
            get { return _phone; }
            set { _phone = value; }
        }
        public string Address
        {
            get { return _address; }
            set { _address = value; }
        }

    }
}