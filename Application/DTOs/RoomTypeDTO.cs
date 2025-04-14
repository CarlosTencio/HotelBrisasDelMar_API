﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.DTOs
{
    public class RoomTypeDTO
    {
        public int RoomTypeId { get; set; }
        public string RoomTypeName { get; set; }

        public int Price { get; set; }

        public string Characteristics { get; set; }

        public string description { get; set; }

        public string Image { get; set; }
    }
}
