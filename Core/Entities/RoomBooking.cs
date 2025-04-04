using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Entities
{
    public class RoomBooking
    {
        public int RoomId { get; set; }
        public Room Room { get; set; }

        public int BookingID { get; set; }
        public Booking Booking { get; set; }
    }

}
