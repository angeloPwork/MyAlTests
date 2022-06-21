report 50123 "Proof-A MyRdlReport"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'MyRDLReport.rdl';

    dataset
    {
        dataitem(Customer; Customer)
        {
            column(Name; Name)
            { }
            column(Address; Address)
            { }
            column(City; City)
            { }
            column(Post_Code; "Post Code")
            { }
            column(Phone_No_; "Phone No.")
            { }
            column(E_Mail; "E-Mail")
            { }
        }
    }
}