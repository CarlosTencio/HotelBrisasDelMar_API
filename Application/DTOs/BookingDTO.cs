﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Application.DTOs
{
    public class BookingDTO
    {
        public CustomerDTO Customer { get; set; }
        public int RoomId { get; set; }
        public DateTime CheckIn { get; set; }
        public DateTime CheckOut { get; set; }
        public int Transaction { get; set; }


    }
}
