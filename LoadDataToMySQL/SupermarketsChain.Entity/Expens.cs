//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace LoadDataToMySQL.SupermarketsChain.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class Expens
    {
        public int Id { get; set; }
        public decimal VendorId { get; set; }
        public string Month { get; set; }
        public decimal Expense { get; set; }
    
        public virtual Vendor Vendor { get; set; }
    }
}
