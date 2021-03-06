﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RealEstateAgency.Data
{
    public class Person
    {
        [StringLength(30)]
        public string FirstName { get; set; }

        [StringLength(30)]
        public string LastName { get; set; }

        [StringLength(30)]
        public string MiddleName { get; set; }

        public string FullName
        { 
            get
            {
                return $"{FirstName} {LastName} {MiddleName}";
            }
        }

        public override string ToString()
        {
            return FullName;
        }
    }
}
